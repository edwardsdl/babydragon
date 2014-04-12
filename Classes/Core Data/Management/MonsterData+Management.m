#import "BaseData+Management.h"
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
#import "ElementType.h"

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
    
    return results.count > 0
        ? (MonsterData *)[results objectAtIndex:0]
        : nil;
}

+ (MonsterData *)insertMonsterWithType:(NSString *)type barcode:(NSString *)barcode
{
    NSManagedObjectContext *managedObjectContext = [[CoreDataHelper sharedInstance] managedObjectContext];
    
    MonsterData *monsterData = [NSEntityDescription insertNewObjectForEntityForName:entityName
                                                             inManagedObjectContext:managedObjectContext];
    DefaultMonsterData *defaultMonsterData = [DefaultMonsterData defaultMonsterDataForType:type];
    // TODO: Blow up if default monster data is nil.
    
    // TODO: Set abilities
    monsterData.abilityPoints = defaultMonsterData.abilityPoints;
    monsterData.attackType = defaultMonsterData.attackType;
    monsterData.barcode = barcode;
    monsterData.courage = defaultMonsterData.courage;
    monsterData.defense = defaultMonsterData.defense;
    monsterData.elementType = defaultMonsterData.elementType;
    monsterData.experiencePoints = 0;
    monsterData.healthPoints = defaultMonsterData.healthPoints;
    monsterData.isTranslucent = defaultMonsterData.isTranslucent;
    monsterData.isFlying = defaultMonsterData.isFlying;
    monsterData.scalePercent = defaultMonsterData.scalePercent;
    monsterData.level = 1;
    monsterData.name = [type stringByReplacingOccurrencesOfString:@"_" withString:@" "];
    monsterData.speed = defaultMonsterData.speed;
    monsterData.power = defaultMonsterData.power;
    monsterData.type = type;
    monsterData.willpower = defaultMonsterData.willpower;
    
    return monsterData;
}

+ (MonsterData *)monsterWithUUID:(NSString *)uuid
{
    return (MonsterData *)[self baseDataWithUUID:uuid];
}

+ (void)removeAll
{
    NSManagedObjectContext *managedObjectContext = [[CoreDataHelper sharedInstance] managedObjectContext];
    
    for (MonsterData *monsterData in [self allMonsters])
    {
        [managedObjectContext deleteObject:monsterData];
    }
    
    [[CoreDataHelper sharedInstance] save];
}

- (int)trueCourage
{
    return floor(self.courage);
}

- (int)trueDefense
{
    return floor(self.defense);
}

- (int)trueSpeed
{
    return floor(self.speed);
}

- (int)truePower
{
    return floor(self.power);
}

- (int)trueWillpower
{
    return floor(self.willpower);
}

- (void)levelUp
{
    [self levelUp:1];
}

- (void)levelUp:(int)levelsGained
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
    
    [[CoreDataHelper sharedInstance] save];
}

- (void)assignAbilitiesForLevel:(int)level
{
    //Get the default monster data so we can lookup role types
    DefaultMonsterData *defaultMonsterData = [DefaultMonsterData defaultMonsterDataForType:self.type];
    
    NSNumber* rank;
    AbilityData* ability;
    
    float common = 1.0f;
    float uncommon = 0.5f;
    float rare = 0.2f;
    float superRare = 0.1f;
    float ultraRare = 0.05f;
    
    NSDictionary *primary4RankLevels = @{[NSNumber numberWithFloat:common] :
                                            @{[NSNumber numberWithInt:1] : [NSNumber numberWithInt:1],
                                              [NSNumber numberWithInt:9] : [NSNumber numberWithInt:2],
                                              [NSNumber numberWithInt:18] : [NSNumber numberWithInt:3],
                                              [NSNumber numberWithInt:27] : [NSNumber numberWithInt:4]},
                                         [NSNumber numberWithFloat:uncommon] :
                                             @{[NSNumber numberWithInt:1] : [NSNumber numberWithInt:1],
                                               [NSNumber numberWithInt:8] : [NSNumber numberWithInt:2],
                                               [NSNumber numberWithInt:17] : [NSNumber numberWithInt:3],
                                               [NSNumber numberWithInt:26] : [NSNumber numberWithInt:4]},
                                         [NSNumber numberWithFloat:rare] :
                                             @{[NSNumber numberWithInt:1] : [NSNumber numberWithInt:1],
                                               [NSNumber numberWithInt:7] : [NSNumber numberWithInt:2],
                                               [NSNumber numberWithInt:16] : [NSNumber numberWithInt:3],
                                               [NSNumber numberWithInt:25] : [NSNumber numberWithInt:4]},
                                         [NSNumber numberWithFloat:superRare] :
                                             @{[NSNumber numberWithInt:1] : [NSNumber numberWithInt:1],
                                               [NSNumber numberWithInt:6] : [NSNumber numberWithInt:2],
                                               [NSNumber numberWithInt:15] : [NSNumber numberWithInt:3],
                                               [NSNumber numberWithInt:24] : [NSNumber numberWithInt:4]},
                                         [NSNumber numberWithFloat:ultraRare] :
                                             @{[NSNumber numberWithInt:1] : [NSNumber numberWithInt:1],
                                               [NSNumber numberWithInt:5] : [NSNumber numberWithInt:2],
                                               [NSNumber numberWithInt:14] : [NSNumber numberWithInt:3],
                                               [NSNumber numberWithInt:23] : [NSNumber numberWithInt:4]}
                                         };
    
    NSDictionary *secondary4RankLevels = @{[NSNumber numberWithFloat:common] :
                                             @{[NSNumber numberWithInt:3] : [NSNumber numberWithInt:1],
                                               [NSNumber numberWithInt:12] : [NSNumber numberWithInt:2],
                                               [NSNumber numberWithInt:21] : [NSNumber numberWithInt:3],
                                               [NSNumber numberWithInt:30] : [NSNumber numberWithInt:4]},
                                         [NSNumber numberWithFloat:uncommon] :
                                             @{[NSNumber numberWithInt:3] : [NSNumber numberWithInt:1],
                                               [NSNumber numberWithInt:11] : [NSNumber numberWithInt:2],
                                               [NSNumber numberWithInt:20] : [NSNumber numberWithInt:3],
                                               [NSNumber numberWithInt:29] : [NSNumber numberWithInt:4]},
                                         [NSNumber numberWithFloat:rare] :
                                             @{[NSNumber numberWithInt:3] : [NSNumber numberWithInt:1],
                                               [NSNumber numberWithInt:10] : [NSNumber numberWithInt:2],
                                               [NSNumber numberWithInt:19] : [NSNumber numberWithInt:3],
                                               [NSNumber numberWithInt:28] : [NSNumber numberWithInt:4]},
                                         [NSNumber numberWithFloat:superRare] :
                                             @{[NSNumber numberWithInt:3] : [NSNumber numberWithInt:1],
                                               [NSNumber numberWithInt:9] : [NSNumber numberWithInt:2],
                                               [NSNumber numberWithInt:18] : [NSNumber numberWithInt:3],
                                               [NSNumber numberWithInt:27] : [NSNumber numberWithInt:4]},
                                         [NSNumber numberWithFloat:ultraRare] :
                                             @{[NSNumber numberWithInt:3] : [NSNumber numberWithInt:1],
                                               [NSNumber numberWithInt:8] : [NSNumber numberWithInt:2],
                                               [NSNumber numberWithInt:17] : [NSNumber numberWithInt:3],
                                               [NSNumber numberWithInt:26] : [NSNumber numberWithInt:4]}
                                         };
    
    
    
    NSDictionary *primary3RankLevels = @{[NSNumber numberWithFloat:common] :
                                             @{[NSNumber numberWithInt:1] : [NSNumber numberWithInt:1],
                                               [NSNumber numberWithInt:13] : [NSNumber numberWithInt:2],
                                               [NSNumber numberWithInt:26] : [NSNumber numberWithInt:3]},
                                         [NSNumber numberWithFloat:uncommon] :
                                             @{[NSNumber numberWithInt:1] : [NSNumber numberWithInt:1],
                                               [NSNumber numberWithInt:12] : [NSNumber numberWithInt:2],
                                               [NSNumber numberWithInt:25] : [NSNumber numberWithInt:3]},
                                         [NSNumber numberWithFloat:rare] :
                                             @{[NSNumber numberWithInt:1] : [NSNumber numberWithInt:1],
                                               [NSNumber numberWithInt:11] : [NSNumber numberWithInt:2],
                                               [NSNumber numberWithInt:24] : [NSNumber numberWithInt:3]},
                                         [NSNumber numberWithFloat:superRare] :
                                             @{[NSNumber numberWithInt:1] : [NSNumber numberWithInt:1],
                                               [NSNumber numberWithInt:10] : [NSNumber numberWithInt:2],
                                               [NSNumber numberWithInt:23] : [NSNumber numberWithInt:3]},
                                         [NSNumber numberWithFloat:ultraRare] :
                                             @{[NSNumber numberWithInt:1] : [NSNumber numberWithInt:1],
                                               [NSNumber numberWithInt:9] : [NSNumber numberWithInt:2],
                                               [NSNumber numberWithInt:22] : [NSNumber numberWithInt:3]}
                                         };
    
    NSDictionary *secondary3RankLevels = @{[NSNumber numberWithFloat:common] :
                                             @{[NSNumber numberWithInt:3] : [NSNumber numberWithInt:1],
                                               [NSNumber numberWithInt:16] : [NSNumber numberWithInt:2],
                                               [NSNumber numberWithInt:30] : [NSNumber numberWithInt:3]},
                                         [NSNumber numberWithFloat:uncommon] :
                                             @{[NSNumber numberWithInt:3] : [NSNumber numberWithInt:1],
                                               [NSNumber numberWithInt:15] : [NSNumber numberWithInt:2],
                                               [NSNumber numberWithInt:29] : [NSNumber numberWithInt:3]},
                                         [NSNumber numberWithFloat:rare] :
                                             @{[NSNumber numberWithInt:3] : [NSNumber numberWithInt:1],
                                               [NSNumber numberWithInt:14] : [NSNumber numberWithInt:2],
                                               [NSNumber numberWithInt:28] : [NSNumber numberWithInt:3]},
                                         [NSNumber numberWithFloat:superRare] :
                                             @{[NSNumber numberWithInt:3] : [NSNumber numberWithInt:1],
                                               [NSNumber numberWithInt:13] : [NSNumber numberWithInt:2],
                                               [NSNumber numberWithInt:27] : [NSNumber numberWithInt:3]},
                                         [NSNumber numberWithFloat:ultraRare] :
                                             @{[NSNumber numberWithInt:3] : [NSNumber numberWithInt:1],
                                               [NSNumber numberWithInt:12] : [NSNumber numberWithInt:2],
                                               [NSNumber numberWithInt:26] : [NSNumber numberWithInt:3]}
                                         };

    //-------------------------
    //Primary Roles
    //-------------------------
    
    //Assign Direct Damage Primary
    if (defaultMonsterData.roleTypePrimary == RoleTypeDirectDamage)
    {
        //Assign 4 rank ability
        rank = [[primary4RankLevels objectForKey:[NSNumber numberWithFloat:defaultMonsterData.probability]] objectForKey:[NSNumber numberWithInt:level]];
        if (rank != nil)
        {
            ability = [AbilityData abilityDataWithLevel:rank
                                         andElementType:[NSNumber numberWithInt:defaultMonsterData.elementType]
                                          andEffectType:[NSNumber numberWithInt:EffectTypeAttack]
                                          andAttackType:[NSNumber numberWithInt:defaultMonsterData.attackType]];
            [self addAbilitiesObject:ability];
        }
        
        //Assign the 3 rank ability for magic type DDs
        if (defaultMonsterData.attackType == AttackTypeMagic)
        {
            rank = [[primary3RankLevels objectForKey:[NSNumber numberWithFloat:defaultMonsterData.probability]] objectForKey:[NSNumber numberWithInt:level]];
            if (rank != nil)
            {
                ability = [AbilityData abilityDataWithLevel:rank
                                             andElementType:[NSNumber numberWithInt:defaultMonsterData.elementType]
                                              andEffectType:[NSNumber numberWithInt:EffectTypeGroupAttack]
                                              andAttackType:[NSNumber numberWithInt:defaultMonsterData.attackType]];
                [self addAbilitiesObject:ability];
            }
        }
    }
    //Assign Damage over Time Primary
    else if (defaultMonsterData.roleTypePrimary == RoleTypeDamageOverTime)
    {
        //Assign 3 rank ability
        rank = [[primary4RankLevels objectForKey:[NSNumber numberWithFloat:defaultMonsterData.probability]] objectForKey:[NSNumber numberWithInt:level]];
        if (rank != nil)
        {
            ability = [AbilityData abilityDataWithLevel:rank
                                         andElementType:[NSNumber numberWithInt:defaultMonsterData.elementType]
                                          andEffectType:[NSNumber numberWithInt:EffectTypeDamageOverTime]
                                          andAttackType:[NSNumber numberWithInt:defaultMonsterData.attackType]];
            [self addAbilitiesObject:ability];
        }
    }
    //Assign Heal Primary
    else if (defaultMonsterData.roleTypePrimary == RoleTypeHeal)
    {
        //First assign 4 ranks for Cure(Magic)/Invigorate(Physcial)
        rank = [[primary4RankLevels objectForKey:[NSNumber numberWithFloat:defaultMonsterData.probability]] objectForKey:[NSNumber numberWithInt:level]];
        if (rank != nil)
        {
            if (defaultMonsterData.attackType == AttackTypeMagic)
            {
                ability = [AbilityData abilityDataWithName:@"Cure" andLevel:rank];
                [self addAbilitiesObject:ability];
            }
            else
            {
                ability = [AbilityData abilityDataWithName:@"Invigorate" andLevel:rank];
                [self addAbilitiesObject:ability];
            }
        }
        
        //Next assign 3 ranks for Restore(Magic)/Rally(Physical)
        rank = [[primary3RankLevels objectForKey:[NSNumber numberWithFloat:defaultMonsterData.probability]] objectForKey:[NSNumber numberWithInt:level]];
        if (rank != nil)
        {
            if (defaultMonsterData.attackType == AttackTypeMagic)
            {
                ability = [AbilityData abilityDataWithName:@"Restore" andLevel:rank];
                [self addAbilitiesObject:ability];
            }
            else
            {
                ability = [AbilityData abilityDataWithName:@"Rally" andLevel:rank];
                [self addAbilitiesObject:ability];
            }
        }
        
        //Next assign 4 ranks for Revive, but this uses the secondary rank tables
        rank = [[secondary4RankLevels objectForKey:[NSNumber numberWithFloat:defaultMonsterData.probability]] objectForKey:[NSNumber numberWithInt:level]];
        if (rank != nil)
        {
            ability = [AbilityData abilityDataWithName:@"Revive" andLevel:rank];
            [self addAbilitiesObject:ability];
        }
    }
    //Assign Tank Primary
    else if (defaultMonsterData.roleTypePrimary == RoleTypeTank)
    {
        //Assign 4 rank ability
        rank = [[primary4RankLevels objectForKey:[NSNumber numberWithFloat:defaultMonsterData.probability]] objectForKey:[NSNumber numberWithInt:level]];
        if (rank != nil)
        {
            ability = [AbilityData abilityDataWithLevel:rank
                                         andElementType:[NSNumber numberWithInt:defaultMonsterData.elementType]
                                          andEffectType:[NSNumber numberWithInt:EffectTypeShield]
                                          andAttackType:[NSNumber numberWithInt:defaultMonsterData.attackType]];
            [self addAbilitiesObject:ability];
        }
    }
    //Assign Buffer Primary
    else if (defaultMonsterData.roleTypePrimary == RoleTypeBuff)
    {
        //Assign 4 rank ability
        rank = [[primary4RankLevels objectForKey:[NSNumber numberWithFloat:defaultMonsterData.probability]] objectForKey:[NSNumber numberWithInt:level]];
        if (rank != nil)
        {
            if (defaultMonsterData.elementType == ElementTypeFire)
            {
                ability = [AbilityData abilityDataWithName:@"Haste" andLevel:rank];
                [self addAbilitiesObject:ability];
            }
            else if (defaultMonsterData.elementType == ElementTypeEarth)
            {
                ability = [AbilityData abilityDataWithName:@"Toughen" andLevel:rank];
                [self addAbilitiesObject:ability];
            }
            else if (defaultMonsterData.elementType == ElementTypeWater)
            {
                ability = [AbilityData abilityDataWithName:@"Fortify" andLevel:rank];
                [self addAbilitiesObject:ability];
            }
            else if (defaultMonsterData.elementType == ElementTypeHoly)
            {
                ability = [AbilityData abilityDataWithName:@"Embolden" andLevel:rank];
                [self addAbilitiesObject:ability];
            }
            else if (defaultMonsterData.elementType == ElementTypeDarkness)
            {
                ability = [AbilityData abilityDataWithName:@"Enhance" andLevel:rank];
                [self addAbilitiesObject:ability];
            }
        }
    }
    //Assign Debuffer Primary
    else if (defaultMonsterData.roleTypePrimary == RoleTypeDebuff)
    {
        //Assign 4 rank ability
        rank = [[primary4RankLevels objectForKey:[NSNumber numberWithFloat:defaultMonsterData.probability]] objectForKey:[NSNumber numberWithInt:level]];
        if (rank != nil)
        {
            if (defaultMonsterData.elementType == ElementTypeFire)
            {
                ability = [AbilityData abilityDataWithName:@"Slow" andLevel:rank];
                [self addAbilitiesObject:ability];
            }
            else if (defaultMonsterData.elementType == ElementTypeEarth)
            {
                ability = [AbilityData abilityDataWithName:@"Diminish" andLevel:rank];
                [self addAbilitiesObject:ability];
            }
            else if (defaultMonsterData.elementType == ElementTypeWater)
            {
                ability = [AbilityData abilityDataWithName:@"Daze" andLevel:rank];
                [self addAbilitiesObject:ability];
            }
            else if (defaultMonsterData.elementType == ElementTypeHoly)
            {
                ability = [AbilityData abilityDataWithName:@"Intimidate" andLevel:rank];
                [self addAbilitiesObject:ability];
            }
            else if (defaultMonsterData.elementType == ElementTypeDarkness)
            {
                ability = [AbilityData abilityDataWithName:@"Weaken" andLevel:rank];
                [self addAbilitiesObject:ability];
            }
        }
    }
    
    //-------------------------
    //Secondary Roles
    //-------------------------
    
    //Assign Direct Damage Secondary
    if (defaultMonsterData.roleTypeSecondary == RoleTypeDirectDamage)
    {
        //Assign 4 rank ability
        rank = [[secondary4RankLevels objectForKey:[NSNumber numberWithFloat:defaultMonsterData.probability]] objectForKey:[NSNumber numberWithInt:level]];
        if (rank != nil)
        {
            ability = [AbilityData abilityDataWithLevel:rank
                                         andElementType:[NSNumber numberWithInt:defaultMonsterData.elementType]
                                          andEffectType:[NSNumber numberWithInt:EffectTypeAttack]
                                          andAttackType:[NSNumber numberWithInt:defaultMonsterData.attackType]];
            [self addAbilitiesObject:ability];
        }
        
        //Assign the 3 rank ability for magic type DDs
        if (defaultMonsterData.attackType == AttackTypeMagic)
        {
            rank = [[secondary3RankLevels objectForKey:[NSNumber numberWithFloat:defaultMonsterData.probability]] objectForKey:[NSNumber numberWithInt:level]];
            if (rank != nil)
            {
                ability = [AbilityData abilityDataWithLevel:rank
                                             andElementType:[NSNumber numberWithInt:defaultMonsterData.elementType]
                                              andEffectType:[NSNumber numberWithInt:EffectTypeGroupAttack]
                                              andAttackType:[NSNumber numberWithInt:defaultMonsterData.attackType]];
                [self addAbilitiesObject:ability];
            }
        }
    }
    //Assign Damage over Time Secondary
    else if (defaultMonsterData.roleTypeSecondary == RoleTypeDamageOverTime)
    {
        //Assign 3 rank ability
        rank = [[secondary4RankLevels objectForKey:[NSNumber numberWithFloat:defaultMonsterData.probability]] objectForKey:[NSNumber numberWithInt:level]];
        if (rank != nil)
        {
            ability = [AbilityData abilityDataWithLevel:rank
                                         andElementType:[NSNumber numberWithInt:defaultMonsterData.elementType]
                                          andEffectType:[NSNumber numberWithInt:EffectTypeDamageOverTime]
                                          andAttackType:[NSNumber numberWithInt:defaultMonsterData.attackType]];
            [self addAbilitiesObject:ability];
        }
    }
    //Assign Heal Secondary
    else if (defaultMonsterData.roleTypeSecondary == RoleTypeHeal)
    {
        //First assign 4 ranks for Cure(Magic)/Invigorate(Physcial)
        rank = [[secondary4RankLevels objectForKey:[NSNumber numberWithFloat:defaultMonsterData.probability]] objectForKey:[NSNumber numberWithInt:level]];
        if (rank != nil)
        {
            if (defaultMonsterData.attackType == AttackTypeMagic)
            {
                ability = [AbilityData abilityDataWithName:@"Cure" andLevel:rank];
                [self addAbilitiesObject:ability];
            }
            else
            {
                ability = [AbilityData abilityDataWithName:@"Invigorate" andLevel:rank];
                [self addAbilitiesObject:ability];
            }
        }
        
        //Next assign 3 ranks for Restore(Magic)/Rally(Physical)
        rank = [[secondary3RankLevels objectForKey:[NSNumber numberWithFloat:defaultMonsterData.probability]] objectForKey:[NSNumber numberWithInt:level]];
        if (rank != nil)
        {
            if (defaultMonsterData.attackType == AttackTypeMagic)
            {
                ability = [AbilityData abilityDataWithName:@"Restore" andLevel:rank];
                [self addAbilitiesObject:ability];
            }
            else
            {
                ability = [AbilityData abilityDataWithName:@"Rally" andLevel:rank];
                [self addAbilitiesObject:ability];
            }
        }
        
        //Secondary healers dont get Revive
    }
    //Assign Tank Secondary
    else if (defaultMonsterData.roleTypeSecondary == RoleTypeTank)
    {
        //Assign 4 rank ability
        rank = [[secondary4RankLevels objectForKey:[NSNumber numberWithFloat:defaultMonsterData.probability]] objectForKey:[NSNumber numberWithInt:level]];
        if (rank != nil)
        {
            ability = [AbilityData abilityDataWithLevel:rank
                                         andElementType:[NSNumber numberWithInt:defaultMonsterData.elementType]
                                          andEffectType:[NSNumber numberWithInt:EffectTypeShield]
                                          andAttackType:[NSNumber numberWithInt:defaultMonsterData.attackType]];
            [self addAbilitiesObject:ability];
        }
    }
    //Assign Buffer Secondary
    else if (defaultMonsterData.roleTypeSecondary == RoleTypeBuff)
    {
        //Assign 4 rank ability
        rank = [[secondary4RankLevels objectForKey:[NSNumber numberWithFloat:defaultMonsterData.probability]] objectForKey:[NSNumber numberWithInt:level]];
        if (rank != nil)
        {
            if (defaultMonsterData.elementType == ElementTypeFire)
            {
                ability = [AbilityData abilityDataWithName:@"Haste" andLevel:rank];
                [self addAbilitiesObject:ability];
            }
            else if (defaultMonsterData.elementType == ElementTypeEarth)
            {
                ability = [AbilityData abilityDataWithName:@"Toughen" andLevel:rank];
                [self addAbilitiesObject:ability];
            }
            else if (defaultMonsterData.elementType == ElementTypeWater)
            {
                ability = [AbilityData abilityDataWithName:@"Fortify" andLevel:rank];
                [self addAbilitiesObject:ability];
            }
            else if (defaultMonsterData.elementType == ElementTypeHoly)
            {
                ability = [AbilityData abilityDataWithName:@"Embolden" andLevel:rank];
                [self addAbilitiesObject:ability];
            }
            else if (defaultMonsterData.elementType == ElementTypeDarkness)
            {
                ability = [AbilityData abilityDataWithName:@"Enhance" andLevel:rank];
                [self addAbilitiesObject:ability];
            }
        }
    }
    //Assign Debuffer Secondary
    else if (defaultMonsterData.roleTypeSecondary== RoleTypeDebuff)
    {
        //Assign 4 rank ability
        rank = [[secondary4RankLevels objectForKey:[NSNumber numberWithFloat:defaultMonsterData.probability]] objectForKey:[NSNumber numberWithInt:level]];
        if (rank != nil)
        {
            if (defaultMonsterData.elementType == ElementTypeFire)
            {
                ability = [AbilityData abilityDataWithName:@"Slow" andLevel:rank];
                [self addAbilitiesObject:ability];
            }
            else if (defaultMonsterData.elementType == ElementTypeEarth)
            {
                ability = [AbilityData abilityDataWithName:@"Diminish" andLevel:rank];
                [self addAbilitiesObject:ability];
            }
            else if (defaultMonsterData.elementType == ElementTypeWater)
            {
                ability = [AbilityData abilityDataWithName:@"Daze" andLevel:rank];
                [self addAbilitiesObject:ability];
            }
            else if (defaultMonsterData.elementType == ElementTypeHoly)
            {
                ability = [AbilityData abilityDataWithName:@"Intimidate" andLevel:rank];
                [self addAbilitiesObject:ability];
            }
            else if (defaultMonsterData.elementType == ElementTypeDarkness)
            {
                ability = [AbilityData abilityDataWithName:@"Weaken" andLevel:rank];
                [self addAbilitiesObject:ability];
            }
        }
    }
}

@end
