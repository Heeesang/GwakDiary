import UIKit
import RealmSwift

class ReadDiaryViewModel: baseViewModel {
    
    
    var contents: String = ""
    var diarys: [DiaryModel] = []
    
    init(coordinator: baseCoordinator, contents: String) {
        super.init(coordinator: coordinator)
        self.contents = contents
    }
    
    func addMainData() {
        let realm = try! Realm()
        let results = realm.objects(DiaryModel.self)
        
        self.diarys = results.toArray()
        self.contents = self.diarys[0].contents
        print(diarys)
        print(contents)
    }
}
