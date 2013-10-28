#import "NSManagedObjectContext+Management.h"

@implementation NSManagedObjectContext (Management)

- (NSArray *)objectsForEntityName:(NSString *)entityName
{
    return [self executeFetchRequest:[NSFetchRequest fetchRequestWithEntityName:entityName] error:nil];
}

- (NSArray *)objectsForEntityName:(NSString *)entityName withExpression:(NSString *)expression, ...
{
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:entityName];
    
    va_list variadicArguments;
    va_start(variadicArguments, expression);
    NSPredicate *predicate = [NSPredicate predicateWithFormat:expression arguments:variadicArguments];
    va_end(variadicArguments);
    
    [request setPredicate:predicate];
    
    return [self executeFetchRequest:request error:nil];
}

- (NSArray *)objectsFromFetchRequestTemplateWithName:(NSString *)fetchRequestTemplateName
                             substitutionVariables:(NSDictionary *)substitutionVariables
{
    NSManagedObjectModel *managedObjectModel = [[self persistentStoreCoordinator] managedObjectModel];
    NSFetchRequest *fetchRequest = [managedObjectModel fetchRequestFromTemplateWithName:fetchRequestTemplateName
                                                                  substitutionVariables:substitutionVariables];
    
    return [self executeFetchRequest:fetchRequest error:nil];
}

@end
