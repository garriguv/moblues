@import Foundation;
@import CoreData;

#import "Playable.h"

@class Track;
@class User;

@interface _Playlist : Playable

@property (nonatomic, strong) NSOrderedSet *tracks;
@property (nonatomic, strong) User *user;
@end

@interface _Playlist (CoreDataGeneratedAccessors)

- (void)insertObject:(Track *)value inTracksAtIndex:(NSUInteger)index;
- (void)removeObjectFromTracksAtIndex:(NSUInteger)index;
- (void)insertTracks:(NSArray *)values atIndexes:(NSIndexSet *)indexes;
- (void)removeTracksAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInTracksAtIndex:(NSUInteger)index withObject:(Track *)value;
- (void)replaceTracksAtIndexes:(NSIndexSet *)indexes withTracks:(NSArray *)values;
- (void)addTracksObject:(Track *)value;
- (void)removeTracksObject:(Track *)value;
- (void)addTracks:(NSOrderedSet *)values;
- (void)removeTracks:(NSOrderedSet *)values;

@end
