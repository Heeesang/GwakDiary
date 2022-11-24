import UIKit

class DiaryTableViewCell: BaseTableViewCell<DiaryModel> {
    
    static let cellId = "DiaryCell"
    
    private let diaryTitleLabel = UILabel().then {
        $0.text = ""
        $0.font = .systemFont(ofSize: 13, weight: .bold)
    }
    
    private let diaryDescriptionLabel = UILabel().then {
        $0.text = ""
        $0.font = .systemFont(ofSize: 10)
    }
    
    override func addSubview(_ view: UIView) {
        addSubViews(diaryTitleLabel, diaryDescriptionLabel)
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
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalToSuperview().offset(15)
        }
        diaryDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(diaryTitleLabel.snp.bottom).offset(10)
            $0.leading.equalTo(diaryTitleLabel.snp.leading)
        }
    }
    
    func prepare(title: String?) {
        self.diaryTitleLabel.text = title
    }
}
