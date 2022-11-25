import UIKit

final class QuestionCell: baseCollectionViewCell<DiaryModel> {
    
    static let id = "MyCell"
    
    private let diaryTitleView = UILabel().then {
        $0.font = .systemFont(ofSize: 15)
        $0.text = ""
        $0.textColor = UIColor(red: 0.633, green: 0.625, blue: 0.625, alpha: 1)
    }
    
    private let diaryLineView = UIView().then {
        $0.backgroundColor = GwakDiaryAsset.Colors.gwakDiaryMainColor.color
        $0.layer.cornerRadius = 5
    }
    
    override func addView() {
        addSubViews(diaryTitleView, diaryLineView)
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
        diaryLineView.snp.makeConstraints {
            $0.height.equalTo(9)
            $0.leading.equalToSuperview().offset(40)
            $0.bottom.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        
        diaryTitleView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(30)
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
