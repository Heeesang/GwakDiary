import UIKit

final class DiaryCell: baseCollectionViewCell<DiaryModel> {
    
    static let id = "MyCell"
    
    private let diaryContainerView = UIView().then {
        $0.backgroundColor = .white
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 10
        $0.layer.shadowRadius = 15
        $0.layer.shadowOffset = CGSize(width: 0, height: 0)
        $0.layer.shadowOpacity = 1
        $0.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.08).cgColor
    }
    
    private let diaryTitleView = UILabel().then {
        $0.font = .systemFont(ofSize: 15)
    }
    
    private let diaryLineView = UIView().then {
        $0.backgroundColor = UIColor(red: 1, green: 0.723, blue: 0.663, alpha: 1)
    }
    
    override func addView() {
        addSubViews(diaryContainerView)
        diaryContainerView.addSubViews(diaryTitleView, diaryLineView)
    }
    
    override func setLayout() {
        diaryContainerView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.height.equalTo(272)
            $0.leading.equalToSuperview()
        }
        
        diaryTitleView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.prepare(title: nil)
    }
    
    func prepare(title: String?) {
        self.diaryTitleView.text = title
    }
    
}
