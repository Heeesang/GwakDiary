import UIKit
import RealmSwift

final class WriteDiaryViewModel: baseViewModel {
    
    func selectButtonDidTap(title: String, content: String){
        let realm = try! Realm()
        let diary = DiaryModel(title: title, contents: content)
        
        try! realm.write{
            realm.add(diary)
        }
        let documentsDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        print(documentsDirectory)
    }
}
