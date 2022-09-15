import UIKit

final class MainCollectionViewCell: baseCollectionViewCell<DiaryModel> {
    
    private let mainTextLabel = UILabel().then {
        $0.text = "곽 Diary"
    }
    
    private let diaryContainerView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 30
        $0.layer.shadowRadius = 15
        $0.layer.shadowOffset = CGSize(width: 0, height: 0)
        $0.layer.shadowOpacity = 1
        $0.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.15).cgColor
    }
    
    private let diaryLineView = UIView().then {
        $0.backgroundColor = UIColor(red: 1, green: 0.723, blue: 0.663, alpha: 1)
    }
    
    override func addView() {
        
    }
    
    override func setLayout() {
        
    }
    
}
