import Foundation
import CoreData

class _Track: Playable {
    @NSManaged var duration: NSNumber

    @NSManaged var playlist: Playlist
    @NSManaged var user: User
}
