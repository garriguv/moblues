import Foundation
import CoreData

class _Book: NSManagedObject {
    @NSManaged var name: String

    @NSManaged var editions: NSSet
}
