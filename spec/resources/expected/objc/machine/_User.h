@import Foundation;
@import CoreData;

@class Playlist;
@class Track;

@interface _User : NSManagedObject
@property (nonatomic, strong) NSDate *dob;
@property (nonatomic, copy) NSString *name;

@property (nonatomic, strong) NSSet *playlists;
@property (nonatomic, strong) NSSet *tracks;
@end

@interface _User (CoreDataGeneratedAccessors)

- (void)addPlaylistsObject:(Playlist *)value;
- (void)removePlaylistsObject:(Playlist *)value;
- (void)addPlaylists:(NSSet *)values;
- (void)removePlaylists:(NSSet *)values;

- (void)addTracksObject:(Track *)value;
- (void)removeTracksObject:(Track *)value;
- (void)addTracks:(NSSet *)values;
- (void)removeTracks:(NSSet *)values;

@end
