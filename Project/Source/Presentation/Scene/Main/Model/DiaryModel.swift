import RealmSwift
import Foundation

class DiaryModel: Object {
    @Persisted(primaryKey: true) var id: String
    @Persisted var title: String
    @Persisted var contents: String
    
    convenience init(id: String, title: String, contents: String){
        self.init()
        self.id = UUID().uuidString
        self.title = title
        self.contents = contents
    }
}
