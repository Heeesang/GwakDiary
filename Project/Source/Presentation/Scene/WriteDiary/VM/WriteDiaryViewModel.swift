import UIKit
import RealmSwift

final class WriteDiaryViewModel: baseViewModel {
    
//    private let closure: () -> Void
//
//    init(coordinator: baseCoordinator, closure: @escaping () -> Void) {
//        self.closure = closure
//        super.init(coordinator: coordinator)
//    }
    
    func selectButtonDidTap(title: String, content: String, image: UIImage) {
        let realm = try! Realm()
        let diary = DiaryModel(title: title, contents: content)
        
        try! realm.write{
            realm.add(diary)
            saveImageToDocumentDirectory(imageName: "\(diary.id).png", image: image)
        }
        let documentsDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        print(documentsDirectory)
        coordinator.navigate(to: .popVC)
    }
    
    func saveImageToDocumentDirectory(imageName: String, image: UIImage) {
           guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {return}

           let imageURL = documentDirectory.appendingPathComponent(imageName)
           
           guard let data = image.pngData() else {
               print("압축이 실패했습니다.")
               return
           }
           
           if FileManager.default.fileExists(atPath: imageURL.path) {
               do {
                   try FileManager.default.removeItem(at: imageURL)
                   print("이미지 삭제 완료")
               } catch {
                   print("이미지를 삭제하지 못했습니다.")
               }
           }
    
           do {
               try data.write(to: imageURL)
               print("이미지 저장완료")
           } catch {
               print("이미지를 저장하지 못했습니다.")
           }
       }
}
