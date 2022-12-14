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
    
    func deleteButtonDidTap() {
        let realm = try! Realm()
        guard let diary = realm.object(ofType: DiaryModel.self, forPrimaryKey: datasource.value.id) else { return }

        try! realm.write {
          realm.delete(diary)
        }
        
        coordinator.navigate(to: .popVC)
    }
    
    func loadImageFromDocumentDirectory(imageName: String) -> UIImage? {
            let documentDirectory = FileManager.SearchPathDirectory.documentDirectory
            let userDomainMask = FileManager.SearchPathDomainMask.userDomainMask
            let path = NSSearchPathForDirectoriesInDomains(documentDirectory, userDomainMask, true)
            
            if let directoryPath = path.first {
            
                let imageURL = URL(fileURLWithPath: directoryPath).appendingPathComponent(imageName)
                
                return UIImage(contentsOfFile: imageURL.path)
            }
            
            return nil
    }
}
