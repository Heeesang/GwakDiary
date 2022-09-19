import UIKit
import SnapKit
import Then

class MainViewController: baseVC<MainViewModel> {
    private var sampleData: [String] = ["1","2","3","4"]
    
    private let mainTextLabel = UILabel().then {
        $0.text = "곽 Diary"
        $0.font = .systemFont(ofSize: 20)
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
    
//    private let addButton = UIButton().then {
//
//    }
    
    override func addView() {
        view.addSubViews(mainTextLabel, diaryCollectionView)
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
            $0.top.equalToSuperview().offset(100)
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
