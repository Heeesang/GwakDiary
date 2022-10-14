import UIKit
import RealmSwift

class MainViewModel: baseViewModel {
    
    var diarys: [DiaryModel] = []
    
    func addMainData() {
        let realm = try! Realm()
        let results = realm.objects(DiaryModel.self)
        
        self.diarys = results.toArray()
    }
}

extension Results {
    func toArray() -> [Element] {
        return Array(self)
    }
}
