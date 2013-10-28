#import <CoreData/CoreData.h>

@interface NSManagedObjectContext (Management)

- (NSArray *)objectsForEntityName:(NSString *)entityName;
- (NSArray *)objectsForEntityName:(NSString *)entityName withExpression:(NSString *)expression, ...;
- (NSArray *)objectsFromFetchRequestTemplateWithName:(NSString *)fetchRequestTemplateName
                               substitutionVariables:(NSDictionary *)substitutionVariables;

@end
