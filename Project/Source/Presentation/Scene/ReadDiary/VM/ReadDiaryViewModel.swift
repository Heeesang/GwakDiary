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
            
            // 1. 도큐먼트 폴더 경로가져오기
            let documentDirectory = FileManager.SearchPathDirectory.documentDirectory
            let userDomainMask = FileManager.SearchPathDomainMask.userDomainMask
            let path = NSSearchPathForDirectoriesInDomains(documentDirectory, userDomainMask, true)
            
            if let directoryPath = path.first {
            // 2. 이미지 URL 찾기
                let imageURL = URL(fileURLWithPath: directoryPath).appendingPathComponent(imageName)
                // 3. UIImage로 불러오기
                return UIImage(contentsOfFile: imageURL.path)
            }
            
            return nil
    }
}
