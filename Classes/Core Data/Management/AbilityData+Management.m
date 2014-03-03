#import "AbilityData+Management.h"
#import "CoreDataHelper.h"
#import "NSManagedObjectContext+Management.h"
#import "ElementType.h"
#import "AttackType.h"
#import "EffectType.h"

@implementation AbilityData (Management)

static NSString *entityName = @"AbilityData";

+ (NSArray *)allAbilities
{
    NSManagedObjectContext *managedObjectContext = [[CoreDataHelper sharedInstance] managedObjectContext];
    
    return [managedObjectContext objectsForEntityName:entityName];
}

/*+ (AbilityData *)insertAbilityForMonster:(MonsterData *)monster
{
    NSManagedObjectContext *managedObjectContext = [[CoreDataHelper sharedInstance] managedObjectContext];
    
    AbilityData *abilityData = [NSEntityDescription insertNewObjectForEntityForName:entityName
                                                             inManagedObjectContext:managedObjectContext];
    [abilityData setMonster:monster];
    
    return abilityData;
}*/

+ (AbilityData *)abilityDataWithName:(NSString *)name andLevel:(NSNumber*) level
{
    NSManagedObjectContext *managedObjectContext = [[CoreDataHelper sharedInstance] managedObjectContext];
    
    NSArray * results = [managedObjectContext objectsFromFetchRequestTemplateWithName:@"GetAbilityWithNameAndLevel"
                                                                substitutionVariables:@{@"NAME": name, @"LEVEL": level}];
    
    return [results count] > 0
    ? (AbilityData *)[results objectAtIndex:0]
    : nil;
}

+ (AbilityData*) abilityDataWithLevel:(NSNumber*) level andElementType:(NSNumber*) elementType andEffectType:(NSNumber*) effectType andAttackType:(NSNumber*) attackType
{
    NSManagedObjectContext *managedObjectContext = [[CoreDataHelper sharedInstance] managedObjectContext];
    
    NSArray * results = [managedObjectContext objectsFromFetchRequestTemplateWithName:@"GetAbilityForAssignment"
                                                                substitutionVariables:@{@"LEVEL": level, @"ELEMENTTYPE": elementType, @"EFFECTTYPE": effectType, @"ATTACKTYPE": attackType }];
    
    return [results count] > 0
    ? (AbilityData *)[results objectAtIndex:0]
    : nil;
}

+ (AbilityData *)insertAbilityData
{
    NSManagedObjectContext *managedObjectContext = [[CoreDataHelper sharedInstance] managedObjectContext];
    
    AbilityData *abilityData = [NSEntityDescription insertNewObjectForEntityForName:entityName inManagedObjectContext:managedObjectContext];
    
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
