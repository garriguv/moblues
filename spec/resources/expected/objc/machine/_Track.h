@import Foundation;
@import CoreData;

#import "Playable.h"

@class Playlist;
@class User;

@interface _Track : Playable
@property (nonatomic, strong, nullable) NSNumber *duration;

@property (nonatomic, strong) Playlist *playlist;
@property (nonatomic, strong) User *user;
@end
