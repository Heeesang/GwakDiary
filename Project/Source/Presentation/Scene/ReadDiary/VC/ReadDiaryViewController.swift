import UIKit

class ReadDiaryViewController: baseVC<ReadDiaryViewModel> {
    
    private let addImageButton = UIButton().then {
        $0.layer.cornerRadius = 13
        $0.layer.cornerRadius = 10
        $0.layer.shadowRadius = 15
        $0.layer.shadowOffset =
        CGSize(width: 0, height: 0)
        $0.layer.shadowOpacity = 1
        $0.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.08).cgColor
    }
    
//    private let writeDiaryContainerView = UIView().then {
//        
//    }
        
    
}
