#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface _Team : NSManagedObject

@property (nonatomic, strong) NSSet *teamMembers;
@end

@interface Team (CoreDataGeneratedAccessors)

- (void)addTeamMembersObject:(NSManagedObject *)value;
- (void)removeTeamMembersObject:(NSManagedObject *)value;
- (void)addTeamMembers:(NSSet *)teamMembers;
- (void)removeTeamMembers:(NSSet *)teamMembers;

@end
