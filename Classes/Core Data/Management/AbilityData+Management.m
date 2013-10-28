#import "AbilityData+Management.h"
#import "CoreDataHelper.h"
#import "NSManagedObjectContext+Management.h"

@implementation AbilityData (Management)

static NSString *entityName = @"AbilityData";

+ (NSArray *)allAbilities
{
    NSManagedObjectContext *managedObjectContext = [[CoreDataHelper sharedInstance] managedObjectContext];
    
    return [managedObjectContext objectsForEntityName:entityName];
}

+ (AbilityData *)insertAbilityForMonster:(MonsterData *)monster
{
    NSManagedObjectContext *managedObjectContext = [[CoreDataHelper sharedInstance] managedObjectContext];
    
    AbilityData *abilityData = [NSEntityDescription insertNewObjectForEntityForName:entityName
                                                             inManagedObjectContext:managedObjectContext];
    [abilityData setMonster:monster];
    
    return abilityData;
}

+ (void)removeAll
{
    NSManagedObjectContext *managedObjectContext = [[CoreDataHelper sharedInstance] managedObjectContext];
    
    for (AbilityData *abilityData in [self allAbilities])
    {
        [managedObjectContext deleteObject:abilityData];
    }
    
    NSError *error = nil;
    [managedObjectContext save:&error];
}

@end
