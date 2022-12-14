import RealmSwift
import UIKit
import Foundation

class DiaryModel: Object {
    @Persisted(primaryKey: true) var id: String
    @Persisted var title: String
    @Persisted var contents: String
    
    convenience init(title: String, contents: String){
        self.init()
        self.id = UUID().uuidString
        self.title = title
        self.contents = contents
    }
}
