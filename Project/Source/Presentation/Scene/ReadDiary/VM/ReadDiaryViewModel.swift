import UIKit
import RealmSwift

class ReadDiaryViewModel: baseViewModel {
    var contents: String = ""
    var diarys: [DiaryModel] = []
    var diary: DiaryModel = DiaryModel(title: "", contents: "")
    var datasource = Observable(DiaryModel())
    
    init(coordinator: baseCoordinator, diary: Observable<DiaryModel>) {
        super.init(coordinator: coordinator)
        self.datasource = diary
    }
}
