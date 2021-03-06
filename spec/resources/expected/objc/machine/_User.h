@import Foundation;
@import CoreData;

@class Playlist;
@class Track;

NS_ASSUME_NONNULL_BEGIN
@interface _User : NSManagedObject
@property (nonatomic, strong, nullable) NSDate *dob;
@property (nonatomic, copy, nullable) NSString *name;

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
NS_ASSUME_NONNULL_END
