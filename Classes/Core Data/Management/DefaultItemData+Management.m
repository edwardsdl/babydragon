#import "BaseData+Management.h"
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

+ (DefaultItemData *)defaultItemDataWithUUID:(NSString *)uuid
{
    return (DefaultItemData *)[self baseDataWithUUID:uuid];
}

+ (DefaultItemData *)insertDefaultItemDataForType:(NSString *)type
{
    NSManagedObjectContext *managedObjectContext = [[CoreDataHelper sharedInstance] managedObjectContext];
    
    DefaultItemData *defaultItemData = [NSEntityDescription insertNewObjectForEntityForName:entityName
                                                                     inManagedObjectContext:managedObjectContext];
    [defaultItemData setType:type];
    
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
