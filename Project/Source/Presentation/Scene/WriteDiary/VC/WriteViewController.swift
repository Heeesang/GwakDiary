import UIKit

class WriteDiaryViewController: baseVC<WriteDiaryViewModel> {
   
    weak var delegate: WriteDiaryViewDelegate?
    
    private let addImageButton = UIButton().then {
        $0.setTitle("사진 추가", for: .normal)
        $0.setTitleColor(.secondaryLabel, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
        $0.layer.shadowRadius = 15
        $0.layer.shadowOffset = CGSize(width: 0, height: 0)
        $0.layer.shadowOpacity = 1
        $0.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.08).cgColor
    }
    
    private lazy var writeContentLabel = UILabel().then {
        $0.text = "0/400"
        $0.textColor = .secondaryLabel
        $0.font = .systemFont(ofSize: 10, weight: .medium)
    }
    
    private let titleTextField = UITextField().then {
        $0.placeholder = "일기 제목 (최대 15자)"
        $0.textColor = .label
        $0.addLeftPadding()
        $0.font = .systemFont(ofSize: 12, weight: .medium)
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1).cgColor
    }
    
    private let writeDiaryTextView = UITextView().then {
        $0.text = "오늘 무슨 일이 있었나요?"
        $0.font = .systemFont(ofSize: 12, weight: .medium)
        $0.textColor = .placeholderText
        $0.textContainerInset = UIEdgeInsets(top: 16.0, left: 7.0, bottom: 16.0, right: 7.0)
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1).cgColor
    }
    
    private let writeDiaryButton = UIButton().then {
        $0.setTitle("일기 작성", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        $0.layer.cornerRadius = 20
        $0.backgroundColor = GwakDiaryAsset.Colors.gwakDiaryMainColor.color
        $0.addTarget(self, action: #selector(addDiary), for: .touchUpInside)
    }
    
    @objc func addDiary(_sender: Any) {
        let alert = UIAlertController(title: "일기 작성", message: "일기를 작성하시겠습니까?", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "확인", style: .default, handler: { action in
            self.viewModel.selectButtonDidTap(title: self.titleTextField.text ?? "", content: self.writeDiaryTextView.text)
            self.viewModel.selectAlertOkButtonDidTap()
        })
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    override func configureVC() {
        writeDiaryTextView.delegate = self
        titleTextField.delegate = self
    }
    
    override func addView() {
        view.addSubViews(addImageButton, titleTextField, writeContentLabel, writeDiaryTextView, writeDiaryButton)
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
        
        writeContentLabel.snp.makeConstraints {
            $0.bottom.equalTo(writeDiaryTextView.snp.top)
            $0.trailing.equalTo(writeDiaryTextView.snp.trailing).inset(5)
        }
        
        writeDiaryTextView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(titleTextField.snp.bottom).offset(40)
            $0.height.equalTo(333)
            $0.leading.equalTo(40)
        }
        
        writeDiaryButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(writeDiaryTextView.snp.bottom).offset(30)
            $0.height.equalTo(46)
            $0.leading.equalTo(40)
        }
    }
}

extension WriteDiaryViewController: UITextViewDelegate, UITextFieldDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
            guard textView.textColor == .placeholderText else { return }
            textView.textColor = .label
            textView.text = nil
        }
    
    func textViewDidEndEditing(_ textView: UITextView) {
            if textView.text.isEmpty {
                textView.text = "오늘 무슨 일이 있었나요?"
                textView.textColor = .placeholderText
            }
        }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        guard let str = textView.text else { return true }
        let newLength = str.count + text.count - range.length
        
        writeContentLabel.text = "\(newLength)/350"
        return newLength <= 400
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
          if let char = string.cString(using: String.Encoding.utf8) {
              let isBackSpace = strcmp(char, "\\b")
              if isBackSpace == -92 {
                  return true
              }
          }
          guard textField.text!.count < 15 else { return false }
          return true
      }

}
