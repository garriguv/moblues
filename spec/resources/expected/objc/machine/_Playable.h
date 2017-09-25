@import Foundation;
@import CoreData;


@interface _Playable : NSManagedObject
@property (nonatomic, copy, nullable) NSString *permalink;
@property (nonatomic, copy, nullable) NSString *title;

@end
