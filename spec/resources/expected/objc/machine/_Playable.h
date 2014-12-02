#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface _Playable : NSManagedObject
@property (nonatomic, copy) NSString *permalink;
@property (nonatomic, copy) NSString *title;

@end
