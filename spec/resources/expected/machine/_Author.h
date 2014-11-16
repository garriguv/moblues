#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface _Author : NSManagedObject
@property (nonatomic, strong) NSDate *dob;
@property (nonatomic, copy) NSString *name;

@property (nonatomic, strong) NSSet *books;
@end

@interface Author (CoreDataGeneratedAccessors)

- (void)addBooksObject:(NSManagedObject *)value;
- (void)removeBooksObject:(NSManagedObject *)value;
- (void)addBooks:(NSSet *)books;
- (void)removeBooks:(NSSet *)books;

@end
