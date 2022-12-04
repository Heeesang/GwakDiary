import UIKit
import SnapKit
import Then
import RealmSwift

class MainViewController: baseVC<MainViewModel> {
    let items: [String] = ["abc", "def", "ghi"]
    
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
        $0.itemSize = CGSize(width: 186, height: 102)
    }
    
    private lazy var questionCollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout).then {
        $0.backgroundColor = .clear
        $0.isScrollEnabled = true
        $0.showsHorizontalScrollIndicator = false
        $0.showsVerticalScrollIndicator = true
        $0.clipsToBounds = true
        $0.register(QuestionCell.self, forCellWithReuseIdentifier: "MyCell")
    }
    
    private lazy var addButton = UIButton().then {
        $0.setTitle("글 쓰기", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        $0.tintColor = .white
        $0.backgroundColor = GwakDiaryAsset.Colors.gwakDiaryMainColor.color
        $0.layer.cornerRadius = 10
        $0.addTarget(self, action: #selector(writeDiaryButtonDidTap(_:)), for: .touchUpInside)
    }
    
    private let diaryListLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 18, weight: .semibold)
        $0.textColor = UIColor(red: 0.475, green: 0.475, blue: 0.475, alpha: 1)
        $0.text = "일기목록"
    }
    
    private let verticalFlowLayout = UICollectionViewFlowLayout().then {
        $0.scrollDirection = .vertical
        $0.minimumLineSpacing = 36
        $0.itemSize = CGSize(width: 258, height: 102)
    }
    
    private lazy var diaryListCollectionView = UICollectionView(frame: .zero, collectionViewLayout: verticalFlowLayout).then {
        $0.backgroundColor = .clear
        $0.isScrollEnabled = true
        $0.showsHorizontalScrollIndicator = true
        $0.showsVerticalScrollIndicator = false
        $0.clipsToBounds = true
        $0.register(DiaryListCollectionViewCell.self, forCellWithReuseIdentifier: DiaryListCollectionViewCell.id)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.addMainData()
        questionCollectionView.reloadData()
        diaryListCollectionView.reloadData()
    }
    
    @objc func writeDiaryButtonDidTap(_ sender: UIButton) {
        viewModel.writeDiaryButtonDidTap()
    }
    
    @objc func readDiaryButtonDidTap(_ sender: UIButton) {
        viewModel.readDiaryButtonDidTap()
    }
    
    override func addView() {
        view.addSubViews(diaryListCollectionView, mainTextLabel, subTextLabel, questionCollectionView, addButton, diaryListLabel)
    }
    
    override func setLayout() {
        questionCollectionView.snp.makeConstraints {
            $0.top.equalTo(subTextLabel.snp.bottom).offset(10)
            $0.height.equalTo(200)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        
        mainTextLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(90)
        }
        
        subTextLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(mainTextLabel.snp.bottom).offset(13)
        }
        
        addButton.snp.makeConstraints {
            $0.top.equalTo(diaryListLabel.snp.bottom).offset(15)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(40)
            $0.leading.equalTo(68)
        }
        
        diaryListLabel.snp.makeConstraints {
            $0.top.equalTo(questionCollectionView.snp.bottom).offset(10)
            $0.leading.equalTo(addButton.snp.leading)
        }
        
        diaryListCollectionView.snp.makeConstraints {
            $0.top.equalTo(addButton.snp.bottom).offset(25)
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        
    }
    
    override func configureVC() {
        questionCollectionView.reloadData()
        questionCollectionView.dataSource = self
        questionCollectionView.delegate = self
        diaryListCollectionView.dataSource = self
        diaryListCollectionView.delegate = self
        viewModel.addMainData()
    }
    
    override func bindVM() {
        viewModel.datasource.bind { _ in
            DispatchQueue.main.async {
                self.questionCollectionView.reloadData()
                self.diaryListCollectionView.reloadData()
            }
        }
    }
}

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == questionCollectionView {
            return self.viewModel.diarys.count
        }
        else if collectionView == diaryListCollectionView {
            return self.viewModel.diarys.count
        }
        else {
            return self.viewModel.diarys.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == questionCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: QuestionCell.id, for: indexPath) as! QuestionCell
            cell.prepare(title: viewModel.diarys[indexPath.row].title)
            return cell
        }
        if collectionView == diaryListCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DiaryListCollectionViewCell.id, for: indexPath) as! DiaryListCollectionViewCell
            cell.prepare(title: viewModel.diarys[indexPath.row].title)
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DiaryListCollectionViewCell.id, for: indexPath) as! DiaryListCollectionViewCell
            cell.prepare(title: viewModel.diarys[indexPath.row].title)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == questionCollectionView {
            print("touch")
            let diary = viewModel.diarys[indexPath.row]
            print(diary)
            viewModel.datasource.value = diary
            viewModel.readDiaryButtonDidTap()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == questionCollectionView {
            return UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 0)
        }
        if collectionView == diaryListCollectionView {
            return UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        }
        else {
            return UIEdgeInsets()
        }
    }
}
