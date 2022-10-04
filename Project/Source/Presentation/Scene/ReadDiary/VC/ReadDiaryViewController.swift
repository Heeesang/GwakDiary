import UIKit

class ReadDiaryViewController: baseVC<ReadDiaryViewModel> {
    
    private let addImageButton = UIButton().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
        $0.layer.shadowRadius = 15
        $0.layer.shadowOffset =
        CGSize(width: 0, height: 0)
        $0.layer.shadowOpacity = 1
        $0.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.08).cgColor
    }
    
    private let titleTextField = UITextField().then {
        $0.text = "일기 제목"
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
        $0.layer.shadowRadius = 15
        $0.layer.shadowOffset =
        CGSize(width: 0, height: 0)
        $0.layer.shadowOpacity = 1
        $0.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.08).cgColor
    
    }
    
    private let writeDiaryTextField = UITextField().then {
        $0.text = "오늘 무슨 일이 있었나요?"
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 19
        $0.layer.shadowRadius = 15
        $0.layer.shadowOffset =
        CGSize(width: 0, height: 0)
        $0.layer.shadowOpacity = 1
        $0.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.08).cgColor
    }
    
    private let writeDiaryButton = UIButton().then {
        $0.layer.cornerRadius = 27
        $0.backgroundColor = GwakDiaryAsset.Colors.gwakDiaryMainColor.color
    }
    
    override func addView() {
        view.addSubViews(addImageButton, titleTextField, writeDiaryTextField, writeDiaryButton)
    }
    
    override func setLayout() {
        addImageButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaInsets).offset(100)
            $0.height.equalTo(102)
            $0.leading.equalTo(100)
        }

        titleTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(addImageButton.snp.bottom).offset(60)
            $0.height.equalTo(32)
            $0.leading.equalTo(40)
        }
        
        writeDiaryTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(titleTextField.snp.bottom).offset(40)
            $0.height.equalTo(333)
            $0.leading.equalTo(40)
        }
        
        writeDiaryButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(writeDiaryTextField.snp.bottom).offset(30)
            $0.height.equalTo(46)
            $0.leading.equalTo(40)
        }
    }
}
