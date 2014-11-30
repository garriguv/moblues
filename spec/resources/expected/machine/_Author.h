#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Book;

@interface _Author : NSManagedObject
@property (nonatomic, strong) NSDate *dob;
@property (nonatomic, copy) NSString *name;

@property (nonatomic, strong) NSSet *books;
@end

@interface Author (CoreDataGeneratedAccessors)

- (void)addBooksObject:(Book *)value;
- (void)removeBooksObject:(Book *)value;
- (void)addBooks:(NSSet *)values;
- (void)removeBooks:(NSSet *)values;

@end
