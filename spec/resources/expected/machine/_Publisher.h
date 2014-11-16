#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Book;

@interface _Publisher : NSManagedObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *website;

@property (nonatomic, strong) Book *books;
@end
