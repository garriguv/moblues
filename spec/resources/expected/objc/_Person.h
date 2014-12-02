#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface _Person : NSManagedObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSDate *dob;

@end
