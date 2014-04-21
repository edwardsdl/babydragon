#import "CoreDataHelper.h"
#import "NSManagedObjectContext+Management.h"
#import "SinglePlayerContentData+Management.h"

@implementation SinglePlayerContentData (Management)

static NSString *entityName = @"SinglePlayerContentData";

+ (NSArray *)allSinglePlayerContent
{
    NSManagedObjectContext *managedObjectContext = [[CoreDataHelper sharedInstance] managedObjectContext];
    
    return [managedObjectContext objectsForEntityName:entityName];
}

+ (SinglePlayerContentData *)insertSinglePlayerContentWithPrimaryElementType:(ElementType)primaryElementType
                                                        secondaryElementType:(ElementType)secondaryElementType
                                                              levelBonusType:(LevelBonusType)levelBonusType
                                                                        size:(LevelSizeType)levelSizeType
                                                                 lootDensity:(LootDensityType)lootDensityType
                                                                     barcode:(NSString *)barcode;
{
    NSManagedObjectContext *managedObjectContext = [[CoreDataHelper sharedInstance] managedObjectContext];
    
    SinglePlayerContentData *singlePlayerContentData = [NSEntityDescription insertNewObjectForEntityForName:entityName
                                                                                     inManagedObjectContext:managedObjectContext];
    singlePlayerContentData.barcode = barcode;
    singlePlayerContentData.primaryElementType = primaryElementType;
    singlePlayerContentData.secondaryElementType = secondaryElementType;
    singlePlayerContentData.levelBonusType = levelBonusType;
    singlePlayerContentData.levelSizeType = levelSizeType;
    singlePlayerContentData.lootDensityType = lootDensityType;

    return singlePlayerContentData;
}

+ (void)removeAll
{
    NSManagedObjectContext *managedObjectContext = [[CoreDataHelper sharedInstance] managedObjectContext];
    
    for (SinglePlayerContentData *singlePlayerContent in [self allSinglePlayerContent])
    {
        [managedObjectContext deleteObject:singlePlayerContent];
    }
    
    [[CoreDataHelper sharedInstance] save];
}

@end
