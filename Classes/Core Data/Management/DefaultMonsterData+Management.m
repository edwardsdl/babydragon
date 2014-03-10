#import "CoreDataHelper.h"
#import "DefaultMonsterData+Management.h"
#import "NSManagedObjectContext+Management.h"

@implementation DefaultMonsterData (Management)

static NSString *entityName = @"DefaultMonsterData";

+ (NSArray *)allDefaultMonsterData
{
    NSManagedObjectContext *managedObjectContext = [[CoreDataHelper sharedInstance] managedObjectContext];
    
    return [managedObjectContext objectsForEntityName:entityName];
}

+ (DefaultMonsterData *)defaultMonsterDataForType:(NSString *)type
{
    NSManagedObjectContext *managedObjectContext = [[CoreDataHelper sharedInstance] managedObjectContext];
    
    NSArray * results = [managedObjectContext objectsFromFetchRequestTemplateWithName:@"GetDefaultMonsterAttributesForType"
                                                              substitutionVariables:@{@"TYPE": type}];
    
    return results.count > 0
        ? (DefaultMonsterData *)[results objectAtIndex:0]
        : nil;
}

+ (DefaultMonsterData *)insertDefaultMonsterAttributesForType:(NSString *)type
{
    NSManagedObjectContext *managedObjectContext = [[CoreDataHelper sharedInstance] managedObjectContext];
    
    DefaultMonsterData *defaultMonsterData = [NSEntityDescription insertNewObjectForEntityForName:entityName
                                                                           inManagedObjectContext:managedObjectContext];
    defaultMonsterData.type = type;
    
    return defaultMonsterData;
}

+ (void)removeAll
{
    NSManagedObjectContext *managedObjectContext = [[CoreDataHelper sharedInstance] managedObjectContext];
    
    for (DefaultMonsterData *defaultMonsterData in [self allDefaultMonsterData])
    {
        [managedObjectContext deleteObject:defaultMonsterData];
    }
    
    [[CoreDataHelper sharedInstance] save];
}

@end
