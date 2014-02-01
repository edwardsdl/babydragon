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

+ (void)initialize
{
    [DebugDataInitializer initializeMonsterData];
    [DebugDataInitializer initializeAbilityData];
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
    [MonsterData insertMonsterWithType:@"Bear_Cub" barcode:@"No Barcode"];
    [MonsterData insertMonsterWithType:@"Fox" barcode:@"No Barcode"];
    
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = [[CoreDataHelper sharedInstance] managedObjectContext];
    [managedObjectContext save:&error];
    
    if (error != nil)
    {
        NSLog(@"Failed to initialize monster data.");
    }
}

+ (void)initializeAbilityData
{
    /*
    [AbilityData removeAll];
    
    AbilityData *hardShellAbility = [AbilityData insertAbilityForMonster:[MonsterData anyMonsterWithName:@"Skeleton"]];
    [hardShellAbility setCost:8];
    [hardShellAbility setEffectSprite:@"No Sprite"];
    [hardShellAbility setEffectType:Heal];
    [hardShellAbility setElementType:Water];
    [hardShellAbility setIconSprite:@"AbilityIcon.png"];
    [hardShellAbility setName:@"Heal"];
    [hardShellAbility setTargetType:SingleFriendly];
    [hardShellAbility setValue:15];
    
    AbilityData *babyDragonAbility = [AbilityData insertAbilityForMonster:[MonsterData anyMonsterWithName:@"Baby Dragon"]];
    [babyDragonAbility setCost:8];
    [babyDragonAbility setEffectSprite:@"No Sprite"];
    [babyDragonAbility setEffectType:Damage];
    [babyDragonAbility setElementType:Fire];
    [babyDragonAbility setIconSprite:@"AbilityIcon.png"];
    [babyDragonAbility setName:@"Fireball"];
    [babyDragonAbility setTargetType:SingleHostile];
    [babyDragonAbility setValue:1.5];
     */
    
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = [[CoreDataHelper sharedInstance] managedObjectContext];
    [managedObjectContext save:&error];
    
    if (error != nil)
    {
        NSLog(@"Failed to initialize ability data.");
    }
}

+ (void)initializePartyData
{
    [PartyData removeAll];
    
    NSArray *monsters = @[[MonsterData anyMonsterWithName:@"Baby Dragon"],
                          [MonsterData anyMonsterWithName:@"Fox"],
                          [MonsterData anyMonsterWithName:@"Skeleton"]];
    
    [PartyData insertPartyWithName:@"Player Party" monsters:monsters];
    
    monsters = @[[MonsterData anyMonsterWithName:@"Fox"],
                 [MonsterData anyMonsterWithName:@"Scorpion"],
                 [MonsterData anyMonsterWithName:@"Crab"]];
    
    [PartyData insertPartyWithName:@"AI Party" monsters:monsters];
    
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = [[CoreDataHelper sharedInstance] managedObjectContext];
    [managedObjectContext save:&error];
    
    if (error != nil)
    {
        NSLog(@"Failed to initialize party data.");
    }
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
    
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = [[CoreDataHelper sharedInstance] managedObjectContext];
    [managedObjectContext save:&error];
    
    if (error != nil)
    {
        NSLog(@"Failed to initialize map node data.");
    }
}

@end
