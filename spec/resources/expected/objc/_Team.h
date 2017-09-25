@import Foundation;
@import CoreData;

@class Person;

NS_ASSUME_NONNULL_BEGIN
@interface _Team : NSManagedObject

@property (nonatomic, strong) NSSet *teamMembers;
@end

@interface _Team (CoreDataGeneratedAccessors)

- (void)addTeamMembersObject:(Person *)value;
- (void)removeTeamMembersObject:(Person *)value;
- (void)addTeamMembers:(NSSet *)values;
- (void)removeTeamMembers:(NSSet *)values;

@end
NS_ASSUME_NONNULL_END
