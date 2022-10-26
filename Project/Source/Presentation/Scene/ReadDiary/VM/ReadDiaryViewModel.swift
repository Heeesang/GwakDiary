import UIKit
import RealmSwift

class ReadDiaryViewModel: baseViewModel {
    
    
    var contents: String = ""
    var diarys: [DiaryModel] = []
    var diary: DiaryModel = DiaryModel(title: "", contents: "")
    
    init(coordinator: baseCoordinator, diary: DiaryModel) {
        super.init(coordinator: coordinator)
        self.diary = diary
    }
}
