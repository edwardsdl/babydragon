#import "CoreDataHelper.h"
#import "DefaultItemData+Management.h"
#import "NSManagedObjectContext+Management.h"

@implementation DefaultItemData (Management)

static NSString *entityName = @"DefaultItemData";

+ (NSArray *)allDefaultItemData
{
    NSManagedObjectContext *managedObjectContext = [[CoreDataHelper sharedInstance] managedObjectContext];
    
    return [managedObjectContext objectsForEntityName:entityName];
}

+ (DefaultItemData *)defaultMonsterDataWithName:(NSString *)name
{
    NSManagedObjectContext *managedObjectContext = [[CoreDataHelper sharedInstance] managedObjectContext];
    
    NSArray * results = [managedObjectContext objectsFromFetchRequestTemplateWithName:@"GetDefaultItemDataWithName"
                                                                substitutionVariables:@{@"NAME": name}];
    
    return [results count] > 0
    ? (DefaultItemData *)[results objectAtIndex:0]
    : nil;
}

+ (DefaultItemData *)insertDefaultItemDataWithName:(NSString *)name
{
    NSManagedObjectContext *managedObjectContext = [[CoreDataHelper sharedInstance] managedObjectContext];
    
    DefaultItemData *defaultItemData = [NSEntityDescription insertNewObjectForEntityForName:entityName
                                                                     inManagedObjectContext:managedObjectContext];
    [defaultItemData setName:name];
    
    return defaultItemData;
}

+ (void)removeAll
{
    NSManagedObjectContext *managedObjectContext = [[CoreDataHelper sharedInstance] managedObjectContext];
    
    for (DefaultItemData *defaultItemData in [self allDefaultItemData])
    {
        [managedObjectContext deleteObject:defaultItemData];
    }
    
    NSError *error = nil;
    [managedObjectContext save:&error];
}

@end
