import Foundation
import CoreData

class _User: NSManagedObject {
    @NSManaged var dob: NSDate
    @NSManaged var name: String

    @NSManaged var playlists: NSSet
    @NSManaged var tracks: NSSet
}
