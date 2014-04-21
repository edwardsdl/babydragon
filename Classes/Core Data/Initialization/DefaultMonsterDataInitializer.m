#import "CoreDataHelper.h"
#import "DefaultMonsterDataInitializer.h"
#import "DefaultMonsterData.h"
#import "DefaultMonsterData+Management.h"
#import "ElementType.h"
#import "AttackType.h"
#import "RoleType.h"
#import "Rarity.h"

@implementation DefaultMonsterDataInitializer

+(void) initializeData
{
    [DefaultMonsterData removeAll];
    
    DefaultMonsterData *monster;
    
    float common = 1.0f;
    float uncommon = 0.5f;
    float rare = 0.2f;
    float superRare = 0.1f;
    float ultraRare = 0.05f;
    
    //Fox
    monster = [DefaultMonsterData insertDefaultMonsterAttributesForType:@"Fox"];
    [monster setElementType:ElementTypeFire];
    [monster setProbability:common];
    [monster setAttackType:AttackTypeMagic];
    [monster setRarity:Common];
    
    [monster setHealthPoints:16];
    [monster setAbilityPoints:24];
    [monster setCourage:9];
    [monster setDefense:8];
    [monster setSpeed:12];
    [monster setPower:13];
    [monster setWillpower:11];
    
    [monster setHealthPointsLevelMultiplier:1.6];
    [monster setAbilityPointsLevelMultiplier:2.4];
    [monster setCourageLevelMultiplier:0.9];
    [monster setDefenseLevelMultiplier:0.8];
    [monster setSpeedLevelMultiplier:1.2];
    [monster setPowerLevelMultiplier:1.3];
    [monster setWillpowerLevelMultiplier:1.1];
    
    [monster setIsTranslucent:NO];
    [monster setScalePercent:0.55];
    [monster setIsFlying:NO];
    [monster setRoleTypePrimary:RoleTypeDirectDamage];
    [monster setRoleTypeSecondary:RoleTypeBuff];
    
    //Imp
    monster = [DefaultMonsterData insertDefaultMonsterAttributesForType:@"Imp"];
    [monster setElementType:ElementTypeFire];
    [monster setProbability:common];
    [monster setAttackType:AttackTypeMagic];
    [monster setRarity:Common];
    
    [monster setHealthPoints:18];
    [monster setAbilityPoints:22];
    [monster setCourage:10];
    [monster setDefense:9];
    [monster setSpeed:13];
    [monster setPower:12];
    [monster setWillpower:9];
    
    [monster setHealthPointsLevelMultiplier:1.8];
    [monster setAbilityPointsLevelMultiplier:2.2];
    [monster setCourageLevelMultiplier:1];
    [monster setDefenseLevelMultiplier:0.9];
    [monster setSpeedLevelMultiplier:1.3];
    [monster setPowerLevelMultiplier:1.2];
    [monster setWillpowerLevelMultiplier:0.9];
    
    [monster setIsTranslucent:NO];
    [monster setScalePercent:0.6];
    [monster setIsFlying:YES];
    [monster setRoleTypePrimary:RoleTypeDamageOverTime];
    [monster setRoleTypeSecondary:RoleTypeDebuff];
    
    //Baby Dragon
    monster = [DefaultMonsterData insertDefaultMonsterAttributesForType:@"Baby_Dragon"];
    [monster setElementType:ElementTypeFire];
    [monster setProbability:uncommon];
    [monster setAttackType:AttackTypePhysical];
    [monster setRarity:Uncommon];
    
    [monster setHealthPoints:24];
    [monster setAbilityPoints:16];
    [monster setCourage:11];
    [monster setDefense:12];
    [monster setSpeed:9];
    [monster setPower:13];
    [monster setWillpower:9];
    
    [monster setHealthPointsLevelMultiplier:2.4];
    [monster setAbilityPointsLevelMultiplier:1.6];
    [monster setCourageLevelMultiplier:1.1];
    [monster setDefenseLevelMultiplier:1.2];
    [monster setSpeedLevelMultiplier:0.9];
    [monster setPowerLevelMultiplier:1.3];
    [monster setWillpowerLevelMultiplier:0.9];
    
    [monster setIsTranslucent:NO];
    [monster setScalePercent:0.7];
    [monster setIsFlying:NO];
    [monster setRoleTypePrimary:RoleTypeDirectDamage];
    [monster setRoleTypeSecondary:RoleTypeTank];
    
    //Firebat
    monster = [DefaultMonsterData insertDefaultMonsterAttributesForType:@"Firebat"];
    [monster setElementType:ElementTypeFire];
    [monster setProbability:common];
    [monster setAttackType:AttackTypeMagic];
    [monster setRarity:Common];
    
    [monster setHealthPoints:16];
    [monster setAbilityPoints:22];
    [monster setCourage:9];
    [monster setDefense:9];
    [monster setSpeed:13];
    [monster setPower:11];
    [monster setWillpower:12];
    
    [monster setHealthPointsLevelMultiplier:1.6];
    [monster setAbilityPointsLevelMultiplier:2.2];
    [monster setCourageLevelMultiplier:0.9];
    [monster setDefenseLevelMultiplier:0.9];
    [monster setSpeedLevelMultiplier:1.3];
    [monster setPowerLevelMultiplier:1.1];
    [monster setWillpowerLevelMultiplier:1.2];
    
    [monster setIsTranslucent:NO];
    [monster setScalePercent:0.65];
    [monster setIsFlying:YES];
    [monster setRoleTypePrimary:RoleTypeDirectDamage];
    [monster setRoleTypeSecondary:RoleTypeDebuff];
    
    //Fire Elemental
    monster = [DefaultMonsterData insertDefaultMonsterAttributesForType:@"Fire_Elemental"];
    [monster setElementType:ElementTypeFire];
    [monster setProbability:rare];
    [monster setAttackType:AttackTypePhysical];
    [monster setRarity:Rare];
    
    [monster setHealthPoints:20];
    [monster setAbilityPoints:22];
    [monster setCourage:10];
    [monster setDefense:10];
    [monster setSpeed:9];
    [monster setPower:14];
    [monster setWillpower:11];
    
    [monster setHealthPointsLevelMultiplier:2];
    [monster setAbilityPointsLevelMultiplier:2.2];
    [monster setCourageLevelMultiplier:1];
    [monster setDefenseLevelMultiplier:1];
    [monster setSpeedLevelMultiplier:0.9];
    [monster setPowerLevelMultiplier:1.4];
    [monster setWillpowerLevelMultiplier:1.1];
    
    [monster setIsTranslucent:NO];
    [monster setScalePercent:0.7];
    [monster setIsFlying:YES];
    [monster setRoleTypePrimary:RoleTypeDirectDamage];
    [monster setRoleTypeSecondary:RoleTypeHeal];
    
    //Scorpion
    monster = [DefaultMonsterData insertDefaultMonsterAttributesForType:@"Scorpion"];
    [monster setElementType:ElementTypeEarth];
    [monster setProbability:common];
    [monster setAttackType:AttackTypeMagic];
    [monster setRarity:Common];
    
    [monster setHealthPoints:18];
    [monster setAbilityPoints:24];
    [monster setCourage:11];
    [monster setDefense:8];
    [monster setSpeed:11];
    [monster setPower:12];
    [monster setWillpower:10];
    
    [monster setHealthPointsLevelMultiplier:1.8];
    [monster setAbilityPointsLevelMultiplier:2.4];
    [monster setCourageLevelMultiplier:1.1];
    [monster setDefenseLevelMultiplier:0.8];
    [monster setSpeedLevelMultiplier:1.1];
    [monster setPowerLevelMultiplier:1.2];
    [monster setWillpowerLevelMultiplier:1];
    
    [monster setIsTranslucent:NO];
    [monster setScalePercent:0.55];
    [monster setIsFlying:NO];
    [monster setRoleTypePrimary:RoleTypeDebuff];
    [monster setRoleTypeSecondary:RoleTypeDamageOverTime];
    
    //Small Blob
    monster = [DefaultMonsterData insertDefaultMonsterAttributesForType:@"Small_Blob"];
    [monster setElementType:ElementTypeEarth];
    [monster setProbability:common];
    [monster setAttackType:AttackTypePhysical];
    [monster setRarity:Common];
    
    [monster setHealthPoints:24];
    [monster setAbilityPoints:18];
    [monster setCourage:11];
    [monster setDefense:12];
    [monster setSpeed:9];
    [monster setPower:9];
    [monster setWillpower:11];
    
    [monster setHealthPointsLevelMultiplier:2.4];
    [monster setAbilityPointsLevelMultiplier:1.8];
    [monster setCourageLevelMultiplier:1.1];
    [monster setDefenseLevelMultiplier:1.2];
    [monster setSpeedLevelMultiplier:0.9];
    [monster setPowerLevelMultiplier:0.9];
    [monster setWillpowerLevelMultiplier:1.1];
    
    [monster setIsTranslucent:NO];
    [monster setScalePercent:0.6];
    [monster setIsFlying:NO];
    [monster setRoleTypePrimary:RoleTypeTank];
    [monster setRoleTypeSecondary:RoleTypeDamageOverTime];
    
    //Viper
    monster = [DefaultMonsterData insertDefaultMonsterAttributesForType:@"Viper"];
    [monster setElementType:ElementTypeEarth];
    [monster setProbability:uncommon];
    [monster setAttackType:AttackTypeMagic];
    [monster setRarity:Uncommon];
    
    [monster setHealthPoints:16];
    [monster setAbilityPoints:24];
    [monster setCourage:10];
    [monster setDefense:9];
    [monster setSpeed:13];
    [monster setPower:12];
    [monster setWillpower:10];
    
    [monster setHealthPointsLevelMultiplier:1.6];
    [monster setAbilityPointsLevelMultiplier:2.4];
    [monster setCourageLevelMultiplier:1];
    [monster setDefenseLevelMultiplier:0.9];
    [monster setSpeedLevelMultiplier:1.3];
    [monster setPowerLevelMultiplier:1.2];
    [monster setWillpowerLevelMultiplier:1];
    
    [monster setIsTranslucent:NO];
    [monster setScalePercent:0.6];
    [monster setIsFlying:NO];
    [monster setRoleTypePrimary:RoleTypeDamageOverTime];
    [monster setRoleTypeSecondary:RoleTypeBuff];
    
    //Wisp
    monster = [DefaultMonsterData insertDefaultMonsterAttributesForType:@"Wisp"];
    [monster setElementType:ElementTypeEarth];
    [monster setProbability:uncommon];
    [monster setAttackType:AttackTypeMagic];
    [monster setRarity:Uncommon];
    
    [monster setHealthPoints:16];
    [monster setAbilityPoints:28];
    [monster setCourage:10];
    [monster setDefense:8];
    [monster setSpeed:11];
    [monster setPower:14];
    [monster setWillpower:9];
    
    [monster setHealthPointsLevelMultiplier:1.6];
    [monster setAbilityPointsLevelMultiplier:2.8];
    [monster setCourageLevelMultiplier:1];
    [monster setDefenseLevelMultiplier:0.8];
    [monster setSpeedLevelMultiplier:1.1];
    [monster setPowerLevelMultiplier:1.4];
    [monster setWillpowerLevelMultiplier:0.9];
    
    [monster setIsTranslucent:NO];
    [monster setScalePercent:0.75];
    [monster setIsFlying:YES];
    [monster setRoleTypePrimary:RoleTypeHeal];
    [monster setRoleTypeSecondary:RoleTypeBuff];
    
    //Bear
    monster = [DefaultMonsterData insertDefaultMonsterAttributesForType:@"Bear"];
    [monster setElementType:ElementTypeEarth];
    [monster setProbability:superRare];
    [monster setAttackType:AttackTypePhysical];
    [monster setRarity:SuperRare];
    
    [monster setHealthPoints:26];
    [monster setAbilityPoints:16];
    [monster setCourage:12];
    [monster setDefense:14];
    [monster setSpeed:8];
    [monster setPower:11];
    [monster setWillpower:10];
    
    [monster setHealthPointsLevelMultiplier:2.6];
    [monster setAbilityPointsLevelMultiplier:1.6];
    [monster setCourageLevelMultiplier:1.2];
    [monster setDefenseLevelMultiplier:1.4];
    [monster setSpeedLevelMultiplier:0.8];
    [monster setPowerLevelMultiplier:1.1];
    [monster setWillpowerLevelMultiplier:1];
    
    [monster setIsTranslucent:NO];
    [monster setScalePercent:0.9];
    [monster setIsFlying:NO];
    [monster setRoleTypePrimary:RoleTypeTank];
    [monster setRoleTypeSecondary:RoleTypeDirectDamage];
    
    //Crab
    monster = [DefaultMonsterData insertDefaultMonsterAttributesForType:@"Crab"];
    [monster setElementType:ElementTypeWater];
    [monster setProbability:common];
    [monster setAttackType:AttackTypePhysical];
    [monster setRarity:Common];
    
    [monster setHealthPoints:24];
    [monster setAbilityPoints:16];
    [monster setCourage:10];
    [monster setDefense:13];
    [monster setSpeed:9];
    [monster setPower:11];
    [monster setWillpower:10];
    
    [monster setHealthPointsLevelMultiplier:2.4];
    [monster setAbilityPointsLevelMultiplier:1.6];
    [monster setCourageLevelMultiplier:1];
    [monster setDefenseLevelMultiplier:1.3];
    [monster setSpeedLevelMultiplier:0.9];
    [monster setPowerLevelMultiplier:1.1];
    [monster setWillpowerLevelMultiplier:1];
    
    [monster setIsTranslucent:NO];
    [monster setScalePercent:0.6];
    [monster setIsFlying:NO];
    [monster setRoleTypePrimary:RoleTypeTank];
    [monster setRoleTypeSecondary:RoleTypeDirectDamage];
    
    //Hard Shell
    monster = [DefaultMonsterData insertDefaultMonsterAttributesForType:@"Hard_Shell"];
    [monster setElementType:ElementTypeWater];
    [monster setProbability:uncommon];
    [monster setAttackType:AttackTypePhysical];
    [monster setRarity:Uncommon];
    
    [monster setHealthPoints:26];
    [monster setAbilityPoints:20];
    [monster setCourage:9];
    [monster setDefense:13];
    [monster setSpeed:8];
    [monster setPower:10];
    [monster setWillpower:11];
    
    [monster setHealthPointsLevelMultiplier:2.6];
    [monster setAbilityPointsLevelMultiplier:2];
    [monster setCourageLevelMultiplier:0.9];
    [monster setDefenseLevelMultiplier:1.3];
    [monster setSpeedLevelMultiplier:0.8];
    [monster setPowerLevelMultiplier:1];
    [monster setWillpowerLevelMultiplier:1.1];
    
    [monster setIsTranslucent:NO];
    [monster setScalePercent:0.6];
    [monster setIsFlying:NO];
    [monster setRoleTypePrimary:RoleTypeTank];
    [monster setRoleTypeSecondary:RoleTypeHeal];
    
    //Angler
    monster = [DefaultMonsterData insertDefaultMonsterAttributesForType:@"Angler"];
    [monster setElementType:ElementTypeWater];
    [monster setProbability:rare];
    [monster setAttackType:AttackTypeMagic];
    [monster setRarity:Rare];
    
    [monster setHealthPoints:20];
    [monster setAbilityPoints:24];
    [monster setCourage:10];
    [monster setDefense:8];
    [monster setSpeed:11];
    [monster setPower:13];
    [monster setWillpower:11];
    
    [monster setHealthPointsLevelMultiplier:2];
    [monster setAbilityPointsLevelMultiplier:2.4];
    [monster setCourageLevelMultiplier:1];
    [monster setDefenseLevelMultiplier:0.8];
    [monster setSpeedLevelMultiplier:1.1];
    [monster setPowerLevelMultiplier:1.3];
    [monster setWillpowerLevelMultiplier:1.1];
    
    [monster setIsTranslucent:NO];
    [monster setScalePercent:0.75];
    [monster setIsFlying:YES];
    [monster setRoleTypePrimary:RoleTypeBuff];
    [monster setRoleTypeSecondary:RoleTypeDirectDamage];
    
    //Caterpillar
    monster = [DefaultMonsterData insertDefaultMonsterAttributesForType:@"Caterpillar"];
    [monster setElementType:ElementTypeHoly];
    [monster setProbability:common];
    [monster setAttackType:AttackTypeMagic];
    [monster setRarity:Common];
    
    [monster setHealthPoints:20];
    [monster setAbilityPoints:24];
    [monster setCourage:10];
    [monster setDefense:8];
    [monster setSpeed:12];
    [monster setPower:8];
    [monster setWillpower:13];
    
    [monster setHealthPointsLevelMultiplier:2];
    [monster setAbilityPointsLevelMultiplier:2.4];
    [monster setCourageLevelMultiplier:1];
    [monster setDefenseLevelMultiplier:0.8];
    [monster setSpeedLevelMultiplier:1.2];
    [monster setPowerLevelMultiplier:0.8];
    [monster setWillpowerLevelMultiplier:1.3];
    
    [monster setIsTranslucent:NO];
    [monster setScalePercent:0.75];
    [monster setIsFlying:NO];
    [monster setRoleTypePrimary:RoleTypeBuff];
    [monster setRoleTypeSecondary:RoleTypeDebuff];
    
    //Marblu
    monster = [DefaultMonsterData insertDefaultMonsterAttributesForType:@"Marblu"];
    [monster setElementType:ElementTypeHoly];
    [monster setProbability:common];
    [monster setAttackType:AttackTypeMagic];
    [monster setRarity:Common];
    
    [monster setHealthPoints:20];
    [monster setAbilityPoints:22];
    [monster setCourage:11];
    [monster setDefense:9];
    [monster setSpeed:10];
    [monster setPower:12];
    [monster setWillpower:10];
    
    [monster setHealthPointsLevelMultiplier:2];
    [monster setAbilityPointsLevelMultiplier:2.2];
    [monster setCourageLevelMultiplier:1.1];
    [monster setDefenseLevelMultiplier:0.9];
    [monster setSpeedLevelMultiplier:1];
    [monster setPowerLevelMultiplier:1.2];
    [monster setWillpowerLevelMultiplier:1];
    
    [monster setIsTranslucent:NO];
    [monster setScalePercent:0.6];
    [monster setIsFlying:NO];
    [monster setRoleTypePrimary:RoleTypeHeal];
    [monster setRoleTypeSecondary:RoleTypeDirectDamage];
    
    //Skeleton
    monster = [DefaultMonsterData insertDefaultMonsterAttributesForType:@"Skeleton"];
    [monster setElementType:ElementTypeDarkness];
    [monster setProbability:common];
    [monster setAttackType:AttackTypePhysical];
    [monster setRarity:Common];
    
    [monster setHealthPoints:18];
    [monster setAbilityPoints:22];
    [monster setCourage:10];
    [monster setDefense:9];
    [monster setSpeed:10];
    [monster setPower:12];
    [monster setWillpower:12];
    
    [monster setHealthPointsLevelMultiplier:1.8];
    [monster setAbilityPointsLevelMultiplier:2.2];
    [monster setCourageLevelMultiplier:1];
    [monster setDefenseLevelMultiplier:0.9];
    [monster setSpeedLevelMultiplier:1];
    [monster setPowerLevelMultiplier:1.2];
    [monster setWillpowerLevelMultiplier:1.2];
    
    [monster setIsTranslucent:NO];
    [monster setScalePercent:0.85];
    [monster setIsFlying:NO];
    [monster setRoleTypePrimary:RoleTypeDamageOverTime];
    [monster setRoleTypeSecondary:RoleTypeDebuff];
    
    //Rat
    monster = [DefaultMonsterData insertDefaultMonsterAttributesForType:@"Rat"];
    [monster setElementType:ElementTypeDarkness];
    [monster setProbability:common];
    [monster setAttackType:AttackTypePhysical];
    [monster setRarity:Common];
    
    [monster setHealthPoints:20];
    [monster setAbilityPoints:22];
    [monster setCourage:10];
    [monster setDefense:8];
    [monster setSpeed:13];
    [monster setPower:10];
    [monster setWillpower:11];
    
    [monster setHealthPointsLevelMultiplier:2];
    [monster setAbilityPointsLevelMultiplier:2.2];
    [monster setCourageLevelMultiplier:1];
    [monster setDefenseLevelMultiplier:0.8];
    [monster setSpeedLevelMultiplier:1.3];
    [monster setPowerLevelMultiplier:1];
    [monster setWillpowerLevelMultiplier:1.1];
    
    [monster setIsTranslucent:NO];
    [monster setScalePercent:0.65];
    [monster setIsFlying:NO];
    [monster setRoleTypePrimary:RoleTypeDamageOverTime];
    [monster setRoleTypeSecondary:RoleTypeDirectDamage];
    
    //Ghost
    monster = [DefaultMonsterData insertDefaultMonsterAttributesForType:@"Ghost"];
    [monster setElementType:ElementTypeDarkness];
    [monster setProbability:uncommon];
    [monster setAttackType:AttackTypeMagic];
    [monster setRarity:Uncommon];
    
    [monster setHealthPoints:18];
    [monster setAbilityPoints:24];
    [monster setCourage:10];
    [monster setDefense:9];
    [monster setSpeed:11];
    [monster setPower:12];
    [monster setWillpower:11];
    
    [monster setHealthPointsLevelMultiplier:1.8];
    [monster setAbilityPointsLevelMultiplier:2.4];
    [monster setCourageLevelMultiplier:1];
    [monster setDefenseLevelMultiplier:0.9];
    [monster setSpeedLevelMultiplier:1.1];
    [monster setPowerLevelMultiplier:1.2];
    [monster setWillpowerLevelMultiplier:1.1];
    
    [monster setIsTranslucent:YES];
    [monster setScalePercent:0.75];
    [monster setIsFlying:YES];
    [monster setRoleTypePrimary:RoleTypeHeal];
    [monster setRoleTypeSecondary:RoleTypeDamageOverTime];
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = [[CoreDataHelper sharedInstance] managedObjectContext];
    [managedObjectContext save:&error];
    
    if (error != nil)
    {
        NSLog(@"Failed to initialize default monster data.");
    }
}

@end