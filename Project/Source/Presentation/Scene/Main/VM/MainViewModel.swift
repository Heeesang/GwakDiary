import UIKit
import RealmSwift

class MainViewModel: baseViewModel {
    
    var diarys: [DiaryModel] = []
    
    func addMainData() {
        let realm = try! Realm()
        let results = realm.objects(DiaryModel.self)
        
        self.diarys = results.toArray()
    }
    
    func writeDiaryButtonDidTap() {
        coordinator.navigate(to: .writeDiaryRequired)
    }
}

extension Results {
    func toArray() -> [Element] {
        return Array(self)
    }
}
