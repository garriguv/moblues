import Foundation
import CoreData

class _Playlist: Playable {

    @NSManaged var tracks: NSOrderedSet
    @NSManaged var user: User
}
