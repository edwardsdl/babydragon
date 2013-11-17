#import "CoreDataHelper.h"
#import "DefaultMonsterData+Management.h"
#import "NSManagedObjectContext+Management.h"
#import "MonsterData+Management.h"
#import "UUIDHelper.h"

@implementation MonsterData (Management)

static NSString *entityName = @"MonsterData";

+ (NSArray *)allMonsters
{
    NSManagedObjectContext *managedObjectContext = [[CoreDataHelper sharedInstance] managedObjectContext];
    
    return [managedObjectContext objectsForEntityName:entityName];
}

+ (MonsterData *)insertMonsterWithType:(NSString *)type barcode:(NSString *)barcode
{
    NSManagedObjectContext *managedObjectContext = [[CoreDataHelper sharedInstance] managedObjectContext];
    
    MonsterData *monsterData = [NSEntityDescription insertNewObjectForEntityForName:entityName
                                                             inManagedObjectContext:managedObjectContext];
    
    DefaultMonsterData *defaultMonsterData = [DefaultMonsterData defaultMonsterDataForType:type];
    
    // TODO: Set abilities
    [monsterData setAbilityPoints:[defaultMonsterData abilityPoints]];
    [monsterData setBarcode:barcode];
    [monsterData setCourage:[defaultMonsterData courage]];
    [monsterData setDefense:[defaultMonsterData defense]];
    [monsterData setElementType:[defaultMonsterData elementType]];
    [monsterData setExperiencePoints:0];
    [monsterData setHealthPoints:[defaultMonsterData healthPoints]];
    [monsterData setIntellect:[defaultMonsterData intellect]];
    [monsterData setIsTranslucent:[defaultMonsterData isTranslucent]];
    // TODO: Set latitude
    [monsterData setLevel:1];
    // TODO: Set longitude
    [monsterData setName:[type stringByReplacingOccurrencesOfString:@"_" withString:@" "]];
    [monsterData setSpeed:[defaultMonsterData speed]];
    [monsterData setStrength:[defaultMonsterData strength]];
    // TODO: Set traits
    [monsterData setType:type];
    [monsterData setUuid:[UUIDHelper createUUIDString]];
    [monsterData setWillpower:[defaultMonsterData willpower]];
    
    return monsterData;
}

+ (MonsterData *)monsterWithName:(NSString *)name
{
    NSManagedObjectContext *managedObjectContext = [[CoreDataHelper sharedInstance] managedObjectContext];
    
    NSArray *monsters = [managedObjectContext objectsForEntityName:entityName withExpression:@"name == %@", name];
    return (MonsterData *)[monsters objectAtIndex:0];
}

+ (void)removeAll
{
    NSManagedObjectContext *managedObjectContext = [[CoreDataHelper sharedInstance] managedObjectContext];
    
    for (MonsterData *monsterData in [self allMonsters])
    {
        [managedObjectContext deleteObject:monsterData];
    }
    
    NSError *error = nil;
    [managedObjectContext save:&error];
}

- (int) trueCourage
{
    return floor(self.courage);
}

- (int) trueDefense
{
    return floor(self.defense);
}

- (int) trueIntellect
{
    return floor(self.intellect);
}

- (int) trueSpeed
{
    return floor(self.speed);
}

- (int) trueStrength
{
    return floor(self.strength);
}

- (int) trueWillpower
{
    return floor(self.willpower);
}

- (void) levelUp
{
    [self levelUp:1];
}

- (void) levelUp:(int) levelsGained
{
    //Get the default monster data so we know how much to increase each stat
    DefaultMonsterData *defaultMonsterData = [DefaultMonsterData defaultMonsterDataForType:self.type];
    self.healthPoints += defaultMonsterData.healthPointsLevelMultiplier * levelsGained;
    self.abilityPoints += defaultMonsterData.abilityPointsLevelMultiplier * levelsGained;
    self.courage += defaultMonsterData.courageLevelMultiplier * levelsGained;
    self.defense += defaultMonsterData.defenseLevelMultiplier * levelsGained;
    self.intellect += defaultMonsterData.intellectLevelMultiplier * levelsGained;
    self.speed += defaultMonsterData.speedLevelMultiplier * levelsGained;
    self.willpower += defaultMonsterData.willpowerLevelMultiplier * levelsGained;
    self.level += levelsGained;
    
    [[CoreDataHelper.sharedInstance managedObjectContext] save:nil];
}

@end
