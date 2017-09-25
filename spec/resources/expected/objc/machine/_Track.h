@import Foundation;
@import CoreData;

#import "Playable.h"

@class Playlist;
@class User;

NS_ASSUME_NONNULL_BEGIN
@interface _Track : Playable
@property (nonatomic, strong, nullable) NSNumber *duration;

@property (nonatomic, strong) Playlist *playlist;
@property (nonatomic, strong) User *user;
@end
NS_ASSUME_NONNULL_END
