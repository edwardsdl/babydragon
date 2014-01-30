#import "CoreDataHelper.h"
#import "DefaultMonsterDataInitializer.h"
#import "DefaultMonsterData.h"
#import "DefaultMonsterData+Management.h"
#import "ElementType.h"
#import "AttackType.h"

@implementation DefaultMonsterDataInitializer

+(void) initialize
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
    [monster setElementType:Earth];
    [monster setProbability:common];
    [monster setAttackType:Magic];
    
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
    
    //Imp
    monster = [DefaultMonsterData insertDefaultMonsterAttributesForType:@"Imp"];
    [monster setElementType:Fire];
    [monster setProbability:common];
    [monster setAttackType:Magic];
    
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
    
    //Baby Dragon
    monster = [DefaultMonsterData insertDefaultMonsterAttributesForType:@"Baby_Dragon"];
    [monster setElementType:Fire];
    [monster setProbability:uncommon];
    [monster setAttackType:Physical];
    
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
    
    //Firebat
    monster = [DefaultMonsterData insertDefaultMonsterAttributesForType:@"Firebat"];
    [monster setElementType:Fire];
    [monster setProbability:common];
    [monster setAttackType:Magic];
    
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
    
    //Fire Elemental
    monster = [DefaultMonsterData insertDefaultMonsterAttributesForType:@"Fire_Elemental"];
    [monster setElementType:Fire];
    [monster setProbability:rare];
    [monster setAttackType:Physical];
    
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
    
    //Scorpion
    monster = [DefaultMonsterData insertDefaultMonsterAttributesForType:@"Scorpion"];
    [monster setElementType:Earth];
    [monster setProbability:common];
    [monster setAttackType:Magic];
    
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
    
    [monster setIsTranslucent:YES];
    
    //Small Blob
    monster = [DefaultMonsterData insertDefaultMonsterAttributesForType:@"Small_Blob"];
    [monster setElementType:Earth];
    [monster setProbability:common];
    [monster setAttackType:Physical];
    
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
    
    //Viper
    monster = [DefaultMonsterData insertDefaultMonsterAttributesForType:@"Viper"];
    [monster setElementType:Earth];
    [monster setProbability:uncommon];
    [monster setAttackType:Magic];
    
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
    
    [monster setIsTranslucent:YES];
    
    //Wisp
    monster = [DefaultMonsterData insertDefaultMonsterAttributesForType:@"Wisp"];
    [monster setElementType:Earth];
    [monster setProbability:uncommon];
    [monster setAttackType:Magic];
    
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
    
    //Bear Cub
    monster = [DefaultMonsterData insertDefaultMonsterAttributesForType:@"Bear_Cub"];
    [monster setElementType:Earth];
    [monster setProbability:superRare];
    [monster setAttackType:Physical];
    
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
    
    [monster setIsTranslucent:YES];
    
    //Crab
    monster = [DefaultMonsterData insertDefaultMonsterAttributesForType:@"Crab"];
    [monster setElementType:Water];
    [monster setProbability:common];
    [monster setAttackType:Physical];
    
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
    
    [monster setIsTranslucent:YES];
    
    //Hard Shell
    monster = [DefaultMonsterData insertDefaultMonsterAttributesForType:@"Hard_Shell"];
    [monster setElementType:Water];
    [monster setProbability:uncommon];
    [monster setAttackType:Physical];
    
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
    
    //Angler
    monster = [DefaultMonsterData insertDefaultMonsterAttributesForType:@"Angler"];
    [monster setElementType:Water];
    [monster setProbability:rare];
    [monster setAttackType:Magic];
    
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
    
    //Caterpillar
    monster = [DefaultMonsterData insertDefaultMonsterAttributesForType:@"Caterpillar"];
    [monster setElementType:Holy];
    [monster setProbability:common];
    [monster setAttackType:Magic];
    
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
    
    //Marblu
    monster = [DefaultMonsterData insertDefaultMonsterAttributesForType:@"Marblu"];
    [monster setElementType:Holy];
    [monster setProbability:common];
    [monster setAttackType:Magic];
    
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
    
    [monster setIsTranslucent:YES];
    
    //Skeleton
    monster = [DefaultMonsterData insertDefaultMonsterAttributesForType:@"Skeleton"];
    [monster setElementType:Darkness];
    [monster setProbability:common];
    [monster setAttackType:Physical];
    
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
    
    //Rat
    monster = [DefaultMonsterData insertDefaultMonsterAttributesForType:@"Rat"];
    [monster setElementType:Darkness];
    [monster setProbability:common];
    [monster setAttackType:Physical];
    
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
    
    //Ghost
    monster = [DefaultMonsterData insertDefaultMonsterAttributesForType:@"Ghost"];
    [monster setElementType:Darkness];
    [monster setProbability:uncommon];
    [monster setAttackType:Magic];
    
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
    
    [monster setIsTranslucent:NO];
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = [[CoreDataHelper sharedInstance] managedObjectContext];
    [managedObjectContext save:&error];
    
    if (error != nil)
    {
        NSLog(@"Failed to initialize default monster data.");
    }
}

@end