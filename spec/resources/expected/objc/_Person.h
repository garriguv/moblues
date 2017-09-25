@import Foundation;
@import CoreData;


NS_ASSUME_NONNULL_BEGIN
@interface _Person : NSManagedObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSDate *dob;

@end
NS_ASSUME_NONNULL_END
