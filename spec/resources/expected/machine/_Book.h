#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Author;
@class Publisher;

@interface _Book : NSManagedObject
@property (nonatomic, strong) NSNumber *numberOfPages;
@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) Author *author;
@property (nonatomic, strong) Publisher *publisher;
@end
