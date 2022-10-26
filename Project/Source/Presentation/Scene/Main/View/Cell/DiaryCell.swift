import UIKit

final class DiaryCell: baseCollectionViewCell<DiaryModel> {
    
    static let id = "MyCell"
    
    public let diaryContainerButton = UIButton().then {
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
        $0.text = ""
        $0.textColor = UIColor(red: 0.633, green: 0.625, blue: 0.625, alpha: 1)
    }
    
    private let diaryLineView = UIView().then {
        $0.backgroundColor = GwakDiaryAsset.Colors.gwakDiaryMainColor.color
        $0.layer.cornerRadius = 5
    }
    
    override func addView() {
        addSubViews(diaryContainerButton)
        diaryContainerButton.addSubViews(diaryTitleView, diaryLineView)
    }
    
    override func setLayout() {
        diaryContainerButton.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.height.equalTo(272)
            $0.leading.equalToSuperview()
        }
        
        diaryLineView.snp.makeConstraints {
            $0.height.equalTo(9)
            $0.leading.equalToSuperview().offset(40)
            $0.bottom.equalTo(diaryContainerButton.snp.bottom)
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
