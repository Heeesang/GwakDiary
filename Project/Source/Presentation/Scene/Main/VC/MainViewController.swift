import UIKit
import SnapKit
import Then
import RealmSwift

class MainViewController: baseVC<MainViewModel> {
    private let mainTextLabel = UILabel().then {
        $0.text = "곽. Diary"
        $0.font = .systemFont(ofSize: 20, weight: .semibold)
        $0.textColor = UIColor(red: 0.475, green: 0.475, blue: 0.475, alpha: 1)
    }
    
    private let subTextLabel = UILabel().then {
        $0.text = "오늘의 장면을 기록하세요"
        $0.font = .systemFont(ofSize: 12, weight: .semibold)
        $0.textColor = UIColor(red: 0.475, green: 0.475, blue: 0.475, alpha: 1)
    }
    
    private let flowLayout = UICollectionViewFlowLayout().then {
        $0.scrollDirection = .horizontal
        $0.minimumLineSpacing = 36
        $0.itemSize = CGSize(width: 186, height: 272)
    }
    
    private lazy var diaryCollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout).then {
        $0.backgroundColor = .clear
        $0.isScrollEnabled = true
        $0.showsHorizontalScrollIndicator = false
        $0.showsVerticalScrollIndicator = true
        $0.clipsToBounds = true
        $0.register(DiaryCell.self, forCellWithReuseIdentifier: "MyCell")
    }
    
    private lazy var addButton = UIButton().then {
        $0.setTitle("글 쓰기", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        $0.tintColor = .white
        $0.backgroundColor = GwakDiaryAsset.Colors.gwakDiaryMainColor.color
        $0.layer.cornerRadius = 10
        $0.addTarget(self, action: #selector(writeDiaryButtonDidTap(_:)), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.addMainData()
        diaryCollectionView.reloadData()
    }
    
    @objc func writeDiaryButtonDidTap(_ sender: UIButton) {
        viewModel.writeDiaryButtonDidTap()
    }
    
    @objc func readDiaryButtonDidTap(_ sender: UIButton) {
        viewModel.readDiaryButtonDidTap()
    }
    
    override func addView() {
        view.addSubViews(mainTextLabel, subTextLabel, diaryCollectionView, addButton)
    }
    
    override func setLayout() {
        diaryCollectionView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.height.equalTo(300)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        
        mainTextLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(130)
        }
        
        subTextLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(mainTextLabel.snp.bottom).offset(13)
        }
        
        addButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(diaryCollectionView.snp.bottom).offset(80)
            $0.height.equalTo(35)
            $0.leading.equalTo(120)
        }
    }
    
    override func configureVC() {
        diaryCollectionView.reloadData()
        diaryCollectionView.dataSource = self
        diaryCollectionView.delegate = self
        viewModel.addMainData()
    }
    
    override func bindVM() {
        viewModel.datasource.bind { _ in
            DispatchQueue.main.async {
                self.diaryCollectionView.reloadData()
            }
        }
    }
}

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.diarys.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DiaryCell.id, for: indexPath) as! DiaryCell
        cell.prepare(title: viewModel.diarys[indexPath.row].title)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("touch")
        let diary = viewModel.diarys[indexPath.row]
        print(diary)
        viewModel.datasource.value = diary
        viewModel.readDiaryButtonDidTap()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        let totalCellWidth = 85 * collectionView.numberOfItems(inSection: 0)
        let totalSpacingWidth = 10 * (collectionView.numberOfItems(inSection: 0) - 1)
        
        let leftInset = (collectionView.layer.frame.size.width - CGFloat(totalCellWidth + totalSpacingWidth)) / 2
        let rightInset = leftInset
        
        return UIEdgeInsets(top: 0, left: leftInset, bottom: 0, right: rightInset)
    }
}
