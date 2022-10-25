import UIKit
import RealmSwift

class ReadDiaryViewModel: baseViewModel {
    
    
    var contents: String = ""
    var diarys: [DiaryModel] = []
    
    init(coordinator: baseCoordinator, contents: String) {
        super.init(coordinator: coordinator)
        self.contents = contents
    }
}
