import UIKit

final class DiaryListCollectionViewCell: baseCollectionViewCell<DiaryModel> {
    
    static let id = "DiaryCell"
    
    private let diaryTitleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 15)
        $0.text = ""
        $0.textColor = UIColor(red: 0.633, green: 0.625, blue: 0.625, alpha: 1)
    }
    
    override func addView() {
        addSubViews(diaryTitleLabel)
    }
    
    override func configureCell() {
        backgroundColor = .white
        contentMode = .scaleAspectFill
        layer.cornerRadius = 10
        layer.shadowRadius = 15
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowOpacity = 1
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.08).cgColor
    }
    
    override func setLayout() {
        diaryTitleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(30)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.prepare(title: nil)
    }
    
    func prepare(title: String?) {
        self.diaryTitleLabel.text = title
    }
}
