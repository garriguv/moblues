#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

#import "Playable.h"

@class Playlist;
@class User;

@interface _Track : Playable
@property (nonatomic, strong) NSNumber *duration;

@property (nonatomic, strong) Playlist *playlist;
@property (nonatomic, strong) User *user;
@end
