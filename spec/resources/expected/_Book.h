#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Edition;

@interface _Book : NSManagedObject
@property (nonatomic, copy) NSString *name;

@property (nonatomic, strong) NSSet *editions;
@end

@interface _Book (CoreDataGeneratedAccessors)

- (void)addEditionsObject:(Edition *)value;
- (void)removeEditionsObject:(Edition *)value;
- (void)addEditions:(NSSet *)values;
- (void)removeEditions:(NSSet *)values;

@end
