import UIKit
import RealmSwift

class MainViewModel: baseViewModel {
    
    var diarys: [DiaryModel] = []
    var diary: DiaryModel = DiaryModel(title: "", contents: "")
    
    func addMainData() {
        let realm = try! Realm()
        let results = realm.objects(DiaryModel.self)
        
        self.diarys = results.toArray()
        print(diarys)
    }
    
    func writeDiaryButtonDidTap() {
        coordinator.navigate(to: .writeDiaryRequired)
    }
    
    func readDiaryButtonDidTap() {
        coordinator.navigate(to: .readDiaryRequired(diary: diary))
    }
}

extension Results {
    func toArray() -> [Element] {
        return Array(self)
    }
}
