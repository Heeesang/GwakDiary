import UIKit
import RealmSwift

class MainViewModel: baseViewModel {
    
    var datasource = Observable(DiaryModel())
    var diarys: [DiaryModel] = []
    var diary: DiaryModel = DiaryModel(title: "", contents: "")
    
    func addMainData() {
        let realm = try! Realm()
        let results = realm.objects(DiaryModel.self)
        
        self.diarys = results.toArray()
        print(diarys)
        let fileURL = Realm.Configuration.defaultConfiguration.fileURL
        print(fileURL!)
    }
    
    func writeDiaryButtonDidTap() {
        coordinator.navigate(to: .writeDiaryRequired)
    }
    
    func readDiaryButtonDidTap() {
        coordinator.navigate(to: .readDiaryRequired(diary: datasource))
    }
}

extension Results {
    func toArray() -> [Element] {
        return Array(self)
    }
}
