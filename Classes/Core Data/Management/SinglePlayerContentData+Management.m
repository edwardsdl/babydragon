#import "CoreDataHelper.h"
#import "EnvironmentType.h"
#import "LootQualityType.h"
#import "NSManagedObjectContext+Management.h"
#import "SinglePlayerContentData+Management.h"

@implementation SinglePlayerContentData (Management)

static NSString *entityName = @"SinglePlayerContentData";

+ (NSArray *)allSinglePlayerContent
{
    NSManagedObjectContext *managedObjectContext = [[CoreDataHelper sharedInstance] managedObjectContext];
    
    return [managedObjectContext objectsForEntityName:entityName];
}

+ (SinglePlayerContentData *)insertSinglePlayerContentWithEnvironmentType:(EnvironmentType)environmentType
                                                              lootQuality:(LootQualityType)lootQuality
                                                      minimumMonsterLevel:(int)minimumMonsterLevel
                                                      maximumMonsterLevel:(int)maximumMonsterLevel
                                                                     seed:(int)seed
                                                                  barcode:(NSString *)barcode
{
    NSManagedObjectContext *managedObjectContext = [[CoreDataHelper sharedInstance] managedObjectContext];
    
    SinglePlayerContentData *singlePlayerContentData = [NSEntityDescription insertNewObjectForEntityForName:entityName
                                                                                     inManagedObjectContext:managedObjectContext];
    singlePlayerContentData.barcode = barcode;
    singlePlayerContentData.environmentType = environmentType;
    singlePlayerContentData.lootQuality = lootQuality;
    singlePlayerContentData.maximumMonsterLevel = maximumMonsterLevel;
    singlePlayerContentData.minimumMonsterLevel = minimumMonsterLevel;
    singlePlayerContentData.seed = seed;

    return singlePlayerContentData;
}

+ (void)removeAll
{
    NSManagedObjectContext *managedObjectContext = [[CoreDataHelper sharedInstance] managedObjectContext];
    
    for (SinglePlayerContentData *singlePlayerContent in [self allSinglePlayerContent])
    {
        [managedObjectContext deleteObject:singlePlayerContent];
    }
    
    NSError *error = nil;
    [managedObjectContext save:&error];
}

+ (SinglePlayerContentData *)singlePlayerContentWithSeed:(int)seed
{
    NSManagedObjectContext *managedObjectContext = [[CoreDataHelper sharedInstance] managedObjectContext];
    
    NSArray * results = [managedObjectContext objectsFromFetchRequestTemplateWithName:@"GetSinglePlayerContentWithSeed"
                                                                substitutionVariables:@{@"seed": [NSNumber numberWithInt:seed]}];
    
    return results.count > 0
    ? (SinglePlayerContentData *)[results objectAtIndex:0]
    : nil;
}

@end
