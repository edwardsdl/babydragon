#import "BaseData+Management.h"
#import "CoreDataHelper.h"
#import "DefaultItemData+Management.h"
#import "ItemData+Management.h"
#import "NSManagedObjectContext+Management.h"

@implementation ItemData (Management)

static NSString *entityName = @"ItemData";

+ (NSArray *)allItemData
{
    NSManagedObjectContext *managedObjectContext = [[CoreDataHelper sharedInstance] managedObjectContext];
    
    return [managedObjectContext objectsForEntityName:entityName];
}

+ (ItemData *)itemDataWithType:(NSString *)type
{
    return nil;
}

+ (ItemData *)itemDataWithUUID:(NSString *)uuid
{
    return (ItemData *)[self baseDataWithUUID:uuid];
}

+ (ItemData *)insertItemDataWithDefaultItemDataUUID:(NSString *)uuid
{
    DefaultItemData *defaultItemData = [DefaultItemData defaultItemDataWithUUID:uuid];
    
    NSManagedObjectContext *managedObjectContext = [[CoreDataHelper sharedInstance] managedObjectContext];
    
    ItemData *itemData = [NSEntityDescription insertNewObjectForEntityForName:entityName
                                                              inManagedObjectContext:managedObjectContext];
    itemData.attackType = defaultItemData.attackType;
    itemData.effectType = defaultItemData.effectType;
    itemData.elementType = defaultItemData.elementType;
    itemData.type = defaultItemData.type;
    itemData.quantity = 1;
    itemData.targetType = defaultItemData.targetType;
    itemData.value = defaultItemData.value;
    
    return itemData;
}

+ (void)removeAll
{
    NSManagedObjectContext *managedObjectContext = [[CoreDataHelper sharedInstance] managedObjectContext];
    
    for (DefaultItemData *defaultItemData in [self allItemData])
    {
        [managedObjectContext deleteObject:defaultItemData];
    }
    
    [[CoreDataHelper sharedInstance] save];
}

@end
