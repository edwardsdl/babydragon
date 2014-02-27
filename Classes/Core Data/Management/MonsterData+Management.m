#import "CoreDataHelper.h"
#import "DefaultMonsterData+Management.h"
#import "NSManagedObjectContext+Management.h"
#import "MonsterData+Management.h"
#import "UUIDHelper.h"
#import "RoleType.h"
#import "AbilityData.h"
#import "AbilityData+Management.h"
#import "EffectType.h"
#import "AttackType.h"

@implementation MonsterData (Management)

static NSString *entityName = @"MonsterData";

+ (NSArray *)allMonsters
{
    NSManagedObjectContext *managedObjectContext = [[CoreDataHelper sharedInstance] managedObjectContext];
    
    return [managedObjectContext objectsForEntityName:entityName];
}

+ (MonsterData *)anyMonsterWithName:(NSString *)name
{
    NSManagedObjectContext *managedObjectContext = [[CoreDataHelper sharedInstance] managedObjectContext];
    
    NSArray * results = [managedObjectContext objectsFromFetchRequestTemplateWithName:@"GetAnyMonsterWithName"
                                                                substitutionVariables:@{@"NAME": name}];
    
    return [results count] > 0
        ? (MonsterData *)[results objectAtIndex:0]
        : nil;
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
    [monsterData setIsTranslucent:[defaultMonsterData isTranslucent]];
    [monsterData setIsFlying:[defaultMonsterData isFlying]];
    [monsterData setScalePercent:[defaultMonsterData scalePercent]];
    // TODO: Set latitude
    [monsterData setLevel:1];
    // TODO: Set longitude
    [monsterData setName:[type stringByReplacingOccurrencesOfString:@"_" withString:@" "]];
    [monsterData setSpeed:[defaultMonsterData speed]];
    [monsterData setPower:[defaultMonsterData power]];
    [monsterData setType:type];
    [monsterData setUuid:[UUIDHelper createUUIDString]];
    [monsterData setWillpower:[defaultMonsterData willpower]];
    [monsterData setAttackType:[defaultMonsterData attackType]];
    
    return monsterData;
}

+ (MonsterData *)monsterWithUUID:(NSString *)uuid
{
    NSManagedObjectContext *managedObjectContext = [[CoreDataHelper sharedInstance] managedObjectContext];
    
    NSArray * results = [managedObjectContext objectsFromFetchRequestTemplateWithName:@"GetMonsterWithUUID"
                                                                substitutionVariables:@{@"UUID": uuid}];
    
    return [results count] > 0
        ? (MonsterData *)[results objectAtIndex:0]
        : nil;
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

- (int) trueSpeed
{
    return floor(self.speed);
}

- (int) truePower
{
    return floor(self.power);
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
    self.power += defaultMonsterData.powerLevelMultiplier * levelsGained;
    self.speed += defaultMonsterData.speedLevelMultiplier * levelsGained;
    self.willpower += defaultMonsterData.willpowerLevelMultiplier * levelsGained;
    self.level += levelsGained;
    
    [[CoreDataHelper.sharedInstance managedObjectContext] save:nil];
}

- (void) assignAbilitiesForLevel:(int) level
{
    //Get the default monster data so we can lookup role types
    DefaultMonsterData *defaultMonsterData = [DefaultMonsterData defaultMonsterDataForType:self.type];
    
    int rank = 0;
    
    //Assigning Direct Damage Primary
    if (defaultMonsterData.roleTypePrimary == RoleTypeDirectDamage)
    {
        //Assign 4 rank abilities
        if (level == 1)
            rank = 1;
        else if (level == 9)
            rank = 2;
        else if (level == 18)
            rank = 3;
        else if (level == 27)
            rank = 4;
        else
            rank = 0;
        
        if (rank != 0)
        {
            AbilityData* ability = [AbilityData abilityDataWithLevel:[NSNumber numberWithInt:rank]
                                            andElementType:[NSNumber numberWithInt:defaultMonsterData.elementType]
                                            andEffectType:[NSNumber numberWithInt:EffectTypeAttack]
                                            andAttackType:[NSNumber numberWithInt:defaultMonsterData.attackType]];
            [self addAbilitiesObject:ability];
        }
        
        //Assign 3 rank abilities for Magic type monsters
        if (defaultMonsterData.attackType == AttackTypeMagic)
        {
            if (level == 1)
                rank = 1;
            else if (level == 13)
                rank = 2;
            else if (level == 26)
                rank = 3;
            else
                rank = 0;
            
            if (rank != 0)
            {
                AbilityData* ability = [AbilityData abilityDataWithLevel:[NSNumber numberWithInt:rank]
                                                andElementType:[NSNumber numberWithInt:defaultMonsterData.elementType]
                                                andEffectType:[NSNumber numberWithInt:EffectTypeGroupAttack]
                                                andAttackType:[NSNumber numberWithInt:defaultMonsterData.attackType]];
                [self addAbilitiesObject:ability];
            }
        }
    }
    else if (defaultMonsterData.roleTypePrimary == RoleTypeDamageOverTime)
    {
        if (level == 1)
            rank = 1;
        else if (level == 13)
            rank = 2;
        else if (level == 26)
            rank = 3;
        else
            rank = 0;
        
        if (rank != 0)
        {
            AbilityData* ability = [AbilityData abilityDataWithLevel:[NSNumber numberWithInt:rank]
                                                    andElementType:[NSNumber numberWithInt:defaultMonsterData.elementType]
                                                    andEffectType:[NSNumber numberWithInt:EffectTypeDamageOverTime]
                                                    andAttackType:[NSNumber numberWithInt:defaultMonsterData.attackType]];
            [self addAbilitiesObject:ability];
        }
    }
    
}

@end
