@import Foundation;
@import CoreData;


@interface _Person : NSManagedObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSDate *dob;

@end
