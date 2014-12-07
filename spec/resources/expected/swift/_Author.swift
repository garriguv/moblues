import Foundation
import CoreData

class _Author: Person {
    @NSManaged var dob: NSDate
    @NSManaged var name: String

    @NSManaged var books: NSOrderedSet
    @NSManaged var essays: NSSet
    @NSManaged var publisher: Publisher
}
