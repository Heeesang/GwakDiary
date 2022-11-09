import UIKit

class ReadDiaryViewController: baseVC<ReadDiaryViewModel> {
    
    private let mainImageView = UIImageView().then{
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
        $0.layer.shadowRadius = 15
        $0.layer.shadowOffset = CGSize(width: 0, height: 0)
        $0.layer.shadowOpacity = 1
        $0.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.08).cgColor
    }
    
    private let titleLabel = UILabel().then {
        $0.textColor = .label
        $0.font = .systemFont(ofSize: 12, weight: .medium)
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1).cgColor
    }
    
    private let contentsLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12, weight: .medium)
        $0.textColor = .placeholderText
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1).cgColor
    }
    
    private lazy var deleteButton = UIButton().then {
        $0.addTarget(self, action: #selector(deleteButtonDidTap), for: .touchUpInside)
        $0.setTitleColor(.systemRed, for: .normal)
        $0.setTitle("일기 삭제", for: .normal)
    }
    
    @objc func deleteButtonDidTap() {
        viewModel.deleteButtonDidTap()
    }
    
    func dataInsert() {
        self.titleLabel.text = viewModel.datasource.value.title
        self.contentsLabel.text = viewModel.datasource.value.contents
    }
    
    override func addView() {
        view.addSubViews(mainImageView,titleLabel,contentsLabel, deleteButton)
    }
    
    override func setLayout() {
        mainImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaInsets).offset(100)
            $0.height.equalTo(102)
            $0.leading.equalTo(100)
        }

        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(mainImageView.snp.bottom).offset(60)
            $0.height.equalTo(32)
            $0.leading.equalTo(40)
        }
        
        contentsLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.bottom).offset(40)
            $0.height.equalTo(333)
            $0.leading.equalTo(40)
        }
        
        deleteButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(contentsLabel.snp.bottom).offset(40)
            $0.height.equalTo(30)
        }
    }
    
    override func configureVC() {
        dataInsert()
    }
}
