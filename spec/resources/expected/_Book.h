#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface _Book : NSManagedObject
@property (nonatomic, copy) NSString *name;

@property (nonatomic, strong) NSSet *editions;
@end

@interface Book (CoreDataGeneratedAccessors)

- (void)addEditionsObject:(NSManagedObject *)value;
- (void)removeEditionsObject:(NSManagedObject *)value;
- (void)addEditions:(NSSet *)editions;
- (void)removeEditions:(NSSet *)editions;

@end
