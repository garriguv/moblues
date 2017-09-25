@import Foundation;
@import CoreData;

#import "Person.h"

@class Book;
@class Publisher;

NS_ASSUME_NONNULL_BEGIN
@interface _Author : Person
@property (nonatomic, strong) NSDate *dob;
@property (nonatomic, copy) NSString *name;

@property (nonatomic, strong) NSOrderedSet *books;
@property (nonatomic, strong) NSSet *essays;
@property (nonatomic, strong) Publisher *publisher;
@end

@interface _Author (CoreDataGeneratedAccessors)

- (void)insertObject:(Book *)value inBooksAtIndex:(NSUInteger)index;
- (void)removeObjectFromBooksAtIndex:(NSUInteger)index;
- (void)insertBooks:(NSArray *)values atIndexes:(NSIndexSet *)indexes;
- (void)removeBooksAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInBooksAtIndex:(NSUInteger)index withObject:(Book *)value;
- (void)replaceBooksAtIndexes:(NSIndexSet *)indexes withBooks:(NSArray *)values;
- (void)addBooksObject:(Book *)value;
- (void)removeBooksObject:(Book *)value;
- (void)addBooks:(NSOrderedSet *)values;
- (void)removeBooks:(NSOrderedSet *)values;

- (void)addEssaysObject:(Book *)value;
- (void)removeEssaysObject:(Book *)value;
- (void)addEssays:(NSSet *)values;
- (void)removeEssays:(NSSet *)values;

@end
NS_ASSUME_NONNULL_END
