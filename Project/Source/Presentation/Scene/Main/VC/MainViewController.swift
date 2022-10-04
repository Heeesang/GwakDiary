import UIKit
import SnapKit
import Then

class MainViewController: baseVC<MainViewModel> {
    private var sampleData: [String] = ["노혁의 연애 일기","일기","희상","준화의 솔로 일기"]
    
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
        $0.minimumLineSpacing = 45.0
        $0.itemSize = CGSize(width: 186, height: 272)
    }
    
    private lazy var diaryCollectionView = UICollectionView(frame: .zero, collectionViewLayout: self.flowLayout).then {
        $0.isScrollEnabled = true
        $0.showsHorizontalScrollIndicator = false
        $0.showsVerticalScrollIndicator = true
        $0.backgroundColor = .clear
        $0.clipsToBounds = true
        $0.register(DiaryCell.self, forCellWithReuseIdentifier: "MyCell")
    }
    
    private let addButton = UIButton().then {
        $0.setTitle("글 쓰기", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        $0.tintColor = .white
        $0.backgroundColor = GwakDiaryAsset.Colors.gwakDiaryMainColor.color
        
        $0.layer.cornerRadius = 10
    }
    
    override func addView() {
        view.addSubViews(mainTextLabel, subTextLabel, diaryCollectionView, addButton)
    }
    
    override func setLayout() {
        diaryCollectionView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
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
        diaryCollectionView.dataSource = self
    }
    
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.sampleData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DiaryCell.id, for: indexPath) as! DiaryCell
        cell.prepare(title: self.sampleData[indexPath.item])
           return cell
    }
    
    
}
