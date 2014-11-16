#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Publisher;

@interface _Author : NSManagedObject
@property (nonatomic, strong) NSDate *dob;
@property (nonatomic, copy) NSString *name;

@property (nonatomic, strong) NSOrderedSet *books;
@property (nonatomic, strong) NSSet *essays;
@property (nonatomic, strong) Publisher *publisher;
@end

@interface Author (CoreDataGeneratedAccessors)

- (void)insertObject:(NSManagedObject *)object inBooksAtIndex:(NSUInteger)index;
- (void)removeObjectFromBooksAtIndex:(NSUInteger)index;
- (void)insertBooks:(NSArray *)books atIndexes:(NSIndexSet *)indexes;
- (void)removeBooksAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInBooksAtIndex:(NSUInteger)index withObject:(NSManagedObject *)object;
- (void)replaceBooksAtIndexes:(NSIndexSet *)indexes withBooks:(NSArray *)books;
- (void)addBooksObject:(NSManagedObject *)object;
- (void)removeBooksObject:(NSManagedObject *)object;
- (void)addBooks:(NSOrderedSet *)books;
- (void)removeBooks:(NSOrderedSet *)books;

- (void)addEssaysObject:(NSManagedObject *)value;
- (void)removeEssaysObject:(NSManagedObject *)value;
- (void)addEssays:(NSSet *)essays;
- (void)removeEssays:(NSSet *)essays;

@end
