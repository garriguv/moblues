@import Foundation;
@import CoreData;


NS_ASSUME_NONNULL_BEGIN
@interface _Playable : NSManagedObject
@property (nonatomic, copy, nullable) NSString *permalink;
@property (nonatomic, copy, nullable) NSString *title;

@end
NS_ASSUME_NONNULL_END
