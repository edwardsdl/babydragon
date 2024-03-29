#import "AbilityData+Management.h"
#import "DefaultMonsterData+Management.h"
#import "EffectType.h"
#import "ElementType.h"
#import "MonsterData+Management.h"
#import "PartyData+Management.h"
#import "MapNodeData+Management.h"
#import "TargetType.h"
#import "DebugDataInitializer.h"
#import "CoreDataHelper.h"

@implementation DebugDataInitializer

+ (void)initializeData
{
    [DebugDataInitializer initializeMonsterData];
    [DebugDataInitializer initializeMonsterAbilities];
    [DebugDataInitializer initializePartyData];
    [DebugDataInitializer initializeMapNodeData];
}

+ (void)initializeMonsterData
{
    [MonsterData removeAll];
    
    [MonsterData insertMonsterWithType:@"Baby_Dragon" barcode:@"No Barcode"];
    [MonsterData insertMonsterWithType:@"Hard_Shell" barcode:@"No Barcode"];
    [MonsterData insertMonsterWithType:@"Ghost" barcode:@"No Barcode"];
    [MonsterData insertMonsterWithType:@"Rat" barcode:@"No Barcode"];
    [MonsterData insertMonsterWithType:@"Marblu" barcode:@"No Barcode"];
    [MonsterData insertMonsterWithType:@"Angler" barcode:@"No Barcode"];
    [MonsterData insertMonsterWithType:@"Fire_Elemental" barcode:@"No Barcode"];
    [MonsterData insertMonsterWithType:@"Wisp" barcode:@"No Barcode"];
    [MonsterData insertMonsterWithType:@"Imp" barcode:@"No Barcode"];
    [MonsterData insertMonsterWithType:@"Firebat" barcode:@"No Barcode"];
    [MonsterData insertMonsterWithType:@"Scorpion" barcode:@"No Barcode"];
    [MonsterData insertMonsterWithType:@"Skeleton" barcode:@"No Barcode"];
    [MonsterData insertMonsterWithType:@"Caterpillar" barcode:@"No Barcode"];
    [MonsterData insertMonsterWithType:@"Crab" barcode:@"No Barcode"];
    [MonsterData insertMonsterWithType:@"Small_Blob" barcode:@"No Barcode"];
    [MonsterData insertMonsterWithType:@"Viper" barcode:@"No Barcode"];
    [MonsterData insertMonsterWithType:@"Bear" barcode:@"No Barcode"];
    [MonsterData insertMonsterWithType:@"Fox" barcode:@"No Barcode"];
    
    [[CoreDataHelper sharedInstance] save];
}

+ (void)initializeMonsterAbilities
{
    /*[[MonsterData anyMonsterWithName:@"Fox"] addAbilities:[NSSet setWithArray:@[
        [AbilityData abilityDataWithName:@"Cure" andLevel:[NSNumber numberWithInt:1]],
        [AbilityData abilityDataWithName:@"Revive" andLevel:[NSNumber numberWithInt:1]],
        [AbilityData abilityDataWithName:@"Slow" andLevel:[NSNumber numberWithInt:1]],
        [AbilityData abilityDataWithName:@"Haste" andLevel:[NSNumber numberWithInt:1]]
    ]]];
 
    [[MonsterData anyMonsterWithName:@"Baby Dragon"] addAbilities:[NSSet setWithArray:@[
        [AbilityData abilityDataWithName:@"Flame_Shield" andLevel:[NSNumber numberWithInt:1]]
    ]]];*/
    
    [[MonsterData anyMonsterWithName:@"Fox"] assignAbilitiesForLevel:1];
    [[MonsterData anyMonsterWithName:@"Baby Dragon"] assignAbilitiesForLevel:1];
    [[MonsterData anyMonsterWithName:@"Fire Elemental"] assignAbilitiesForLevel:1];
    [[MonsterData anyMonsterWithName:@"Viper"] assignAbilitiesForLevel:1];
    [[MonsterData anyMonsterWithName:@"Hard Shell"] assignAbilitiesForLevel:1];
    [[MonsterData anyMonsterWithName:@"Firebat"] assignAbilitiesForLevel:1];
    [[MonsterData anyMonsterWithName:@"Imp"] assignAbilitiesForLevel:1];
    [[MonsterData anyMonsterWithName:@"Bear"] assignAbilitiesForLevel:1];
    [[MonsterData anyMonsterWithName:@"Marblu"] assignAbilitiesForLevel:1];
    [[MonsterData anyMonsterWithName:@"Crab"] assignAbilitiesForLevel:1];
    
    [[CoreDataHelper sharedInstance] save];
}

+ (void)initializePartyData
{
    [PartyData removeAll];
    
    NSArray *monsters = @[[MonsterData anyMonsterWithName:@"Bear"],
                          [MonsterData anyMonsterWithName:@"Marblu"],
                          [MonsterData anyMonsterWithName:@"Fox"]];
    
    [PartyData insertPartyWithName:@"Player Party" monsters:monsters];
    
    monsters = @[[MonsterData anyMonsterWithName:@"Bear"],
                 [MonsterData anyMonsterWithName:@"Marblu"],
                 [MonsterData anyMonsterWithName:@"Crab"]];
    
    [PartyData insertPartyWithName:@"AI Party" monsters:monsters];
    
    [[CoreDataHelper sharedInstance] save];
}

+ (void) initializeMapNodeData
{
    MapNodeData* mapNode;
    float defaultTouchWidth = 32;
    float defaultTouchHeight = 32;
    
    mapNode = [MapNodeData insertMapNode];
    mapNode.worldIndex = 0;
    mapNode.name = @"Plains of Anger";
    mapNode.xTouchPosition = -241;
    mapNode.yTouchPosition = -69.5;
    mapNode.touchWidth = defaultTouchWidth;
    mapNode.touchHeight = defaultTouchHeight;
    
    mapNode = [MapNodeData insertMapNode];
    mapNode.worldIndex = 1;
    mapNode.name = @"Crags of Doom";
    mapNode.xTouchPosition = 36;
    mapNode.yTouchPosition = -162.5;
    mapNode.touchWidth = defaultTouchWidth;
    mapNode.touchHeight = defaultTouchHeight;
    
    mapNode = [MapNodeData insertMapNode];
    mapNode.worldIndex = 2;
    mapNode.name = @"Forest of Agony";
    mapNode.xTouchPosition = 233;
    mapNode.yTouchPosition = 11.5;
    mapNode.touchWidth = defaultTouchWidth;
    mapNode.touchHeight = defaultTouchHeight;
    
    mapNode = [MapNodeData insertMapNode];
    mapNode.worldIndex = 3;
    mapNode.name = @"Dallas' House";
    mapNode.xTouchPosition = 170.5;
    mapNode.yTouchPosition = 191.5;
    mapNode.touchWidth = defaultTouchWidth;
    mapNode.touchHeight = defaultTouchHeight;
    
    mapNode = [MapNodeData insertMapNode];
    mapNode.worldIndex = 4;
    mapNode.name = @"Mountains of Unbridled Anguish";
    mapNode.xTouchPosition = -60.5;
    mapNode.yTouchPosition = 331.5;
    mapNode.touchWidth = defaultTouchWidth;
    mapNode.touchHeight = defaultTouchHeight;
    
    [[CoreDataHelper sharedInstance] save];
}

@end
