#import "AbilityData+Management.h"
#import "CoreDataHelper.h"
#import "DefaultMonsterData+Management.h"
#import "EffectType.h"
#import "ElementType.h"
#import "MonsterData+Management.h"
#import "PartyData+Management.h"
#import "MapNodeData+Management.h"
#import "TargetType.h"

@interface CoreDataHelper ()

- (void)initializeDefaultMonsterData;
- (void)initializeMonsterData;
- (void)initializeAbilityData;
- (void)initializePartyData;

@end

@implementation CoreDataHelper

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

+ (CoreDataHelper *)sharedInstance
{
    static CoreDataHelper *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[CoreDataHelper alloc] init];
        // Do any other initialisation stuff here
    });
    return sharedInstance;
}

- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"BabyDragon" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"BabyDragon.sqlite"];
    
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
         
         Typical reasons for an error here include:
         * The persistent store is not accessible;
         * The schema for the persistent store is incompatible with current managed object model.
         Check the error message to determine what the actual problem was.
         
         
         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
         
         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
         
         * Performing automatic lightweight migration by passing the following dictionary as the options parameter:
         @{NSMigratePersistentStoresAutomaticallyOption:@YES, NSInferMappingModelAutomaticallyOption:@YES}
         
         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
         
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}

- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (void)initializePersistentObjectStore
{
    [self initializeDefaultMonsterData];
    [self initializeMonsterData];
    [self initializeAbilityData];
    [self initializePartyData];
    [self initializeMapNodeData];
}

- (void)initializeDefaultMonsterData
{
    [DefaultMonsterData removeAll];
    
    DefaultMonsterData *monster;
    
    float common = 1.0f;
    float uncommon = 0.5f;
    float rare = 0.2f;
    float superRare = 0.1f;
    float ultraRare = 0.05f;
    
    //--------------------------------------------------------------------
    // **** COMMON ****
    //--------------------------------------------------------------------
    
    //--------------------------------------------------------------------
    //Marblu
    monster = [DefaultMonsterData insertDefaultMonsterAttributesForType:@"Marblu"];
    [monster setElementType:Light];
    [monster setProbability:common];
    
    [monster setHealthPoints:18];
    [monster setAbilityPoints:25];
    [monster setCourage:11];
    [monster setDefense:8];
    [monster setIntellect:13];
    [monster setSpeed:11];
    [monster setStrength:7];
    [monster setWillpower:12];
    
    [monster setHealthPointsLevelMultiplier:1.8];
    [monster setAbilityPointsLevelMultiplier:2.5];
    [monster setCourageLevelMultiplier:1.1];
    [monster setDefenseLevelMultiplier:0.8];
    [monster setIntellectLevelMultiplier:1.3];
    [monster setSpeedLevelMultiplier:1.1];
    [monster setStrengthLevelMultiplier:0.7];
    [monster setWillpowerLevelMultiplier:1.2];
    
    [monster setIsTranslucent:NO];
    //--------------------------------------------------------------------
    
    //--------------------------------------------------------------------
    //Rat
    monster = [DefaultMonsterData insertDefaultMonsterAttributesForType:@"Rat"];
    [monster setElementType:Darkness];
    [monster setProbability:common];
    
    [monster setHealthPoints:19];
    [monster setAbilityPoints:21];
    [monster setCourage:9];
    [monster setDefense:9];
    [monster setIntellect:11];
    [monster setSpeed:12];
    [monster setStrength:10];
    [monster setWillpower:11];
    
    [monster setHealthPointsLevelMultiplier:1.9];
    [monster setAbilityPointsLevelMultiplier:2.1];
    [monster setCourageLevelMultiplier:0.9];
    [monster setDefenseLevelMultiplier:0.9];
    [monster setIntellectLevelMultiplier:1.1];
    [monster setSpeedLevelMultiplier:1.2];
    [monster setStrengthLevelMultiplier:1.0];
    [monster setWillpowerLevelMultiplier:1.1];
    
    [monster setIsTranslucent:NO];
    //--------------------------------------------------------------------
    
    //--------------------------------------------------------------------
    //Imp
    monster = [DefaultMonsterData insertDefaultMonsterAttributesForType:@"Imp"];
    [monster setElementType:Fire];
    [monster setProbability:common];
    
    [monster setHealthPoints:19];
    [monster setAbilityPoints:22];
    [monster setCourage:9];
    [monster setDefense:9];
    [monster setIntellect:12];
    [monster setSpeed:13];
    [monster setStrength:11];
    [monster setWillpower:9];
    
    [monster setHealthPointsLevelMultiplier:1.9];
    [monster setAbilityPointsLevelMultiplier:2.2];
    [monster setCourageLevelMultiplier:0.9];
    [monster setDefenseLevelMultiplier:0.9];
    [monster setIntellectLevelMultiplier:1.2];
    [monster setSpeedLevelMultiplier:1.2];
    [monster setStrengthLevelMultiplier:1.1];
    [monster setWillpowerLevelMultiplier:0.9];
    
    [monster setIsTranslucent:NO];
    //--------------------------------------------------------------------
    
    //--------------------------------------------------------------------
    //Firebat
    monster = [DefaultMonsterData insertDefaultMonsterAttributesForType:@"Firebat"];
    [monster setElementType:Fire];
    [monster setProbability:common];
    
    [monster setHealthPoints:18];
    [monster setAbilityPoints:21];
    [monster setCourage:10];
    [monster setDefense:8];
    [monster setIntellect:11];
    [monster setSpeed:13];
    [monster setStrength:10];
    [monster setWillpower:9];
    
    [monster setHealthPointsLevelMultiplier:1.8];
    [monster setAbilityPointsLevelMultiplier:2.1];
    [monster setCourageLevelMultiplier:1.0];
    [monster setDefenseLevelMultiplier:0.8];
    [monster setIntellectLevelMultiplier:1.1];
    [monster setSpeedLevelMultiplier:1.3];
    [monster setStrengthLevelMultiplier:1.1];
    [monster setWillpowerLevelMultiplier:0.9];
    
    [monster setIsTranslucent:NO];
    //--------------------------------------------------------------------
    
    //--------------------------------------------------------------------
    //Scorpion
    monster = [DefaultMonsterData insertDefaultMonsterAttributesForType:@"Scorpion"];
    [monster setElementType:Forest];
    [monster setProbability:common];
    
    [monster setHealthPoints:19];
    [monster setAbilityPoints:22];
    [monster setCourage:12];
    [monster setDefense:10];
    [monster setIntellect:12];
    [monster setSpeed:13];
    [monster setStrength:8];
    [monster setWillpower:10];
    
    [monster setHealthPointsLevelMultiplier:1.9];
    [monster setAbilityPointsLevelMultiplier:2.2];
    [monster setCourageLevelMultiplier:1.2];
    [monster setDefenseLevelMultiplier:0.8];
    [monster setIntellectLevelMultiplier:1.2];
    [monster setSpeedLevelMultiplier:1.3];
    [monster setStrengthLevelMultiplier:0.7];
    [monster setWillpowerLevelMultiplier:1.0];
    
    [monster setIsTranslucent:NO];
    //--------------------------------------------------------------------
    
    //--------------------------------------------------------------------
    //Skeleton
    monster = [DefaultMonsterData insertDefaultMonsterAttributesForType:@"Skeleton"];
    [monster setElementType:Darkness];
    [monster setProbability:common];
    
    [monster setHealthPoints:20];
    [monster setAbilityPoints:21];
    [monster setCourage:13];
    [monster setDefense:10];
    [monster setIntellect:13];
    [monster setSpeed:8];
    [monster setStrength:7];
    [monster setWillpower:13];
    
    [monster setHealthPointsLevelMultiplier:2.0];
    [monster setAbilityPointsLevelMultiplier:2.1];
    [monster setCourageLevelMultiplier:1.3];
    [monster setDefenseLevelMultiplier:0.9];
    [monster setIntellectLevelMultiplier:1.3];
    [monster setSpeedLevelMultiplier:0.8];
    [monster setStrengthLevelMultiplier:0.7];
    [monster setWillpowerLevelMultiplier:1.2];
    
    [monster setIsTranslucent:NO];
    //--------------------------------------------------------------------
    
    //--------------------------------------------------------------------
    //Caterpillar
    monster = [DefaultMonsterData insertDefaultMonsterAttributesForType:@"Caterpillar"];
    [monster setElementType:Light];
    [monster setProbability:common];
    
    [monster setHealthPoints:17];
    [monster setAbilityPoints:23];
    [monster setCourage:9];
    [monster setDefense:8];
    [monster setIntellect:14];
    [monster setSpeed:11];
    [monster setStrength:7];
    [monster setWillpower:13];
    
    [monster setHealthPointsLevelMultiplier:1.7];
    [monster setAbilityPointsLevelMultiplier:2.3];
    [monster setCourageLevelMultiplier:0.9];
    [monster setDefenseLevelMultiplier:0.8];
    [monster setIntellectLevelMultiplier:1.4];
    [monster setSpeedLevelMultiplier:1.1];
    [monster setStrengthLevelMultiplier:0.7];
    [monster setWillpowerLevelMultiplier:1.3];
    
    [monster setIsTranslucent:NO];
    //--------------------------------------------------------------------
    
    //--------------------------------------------------------------------
    //Crab
    monster = [DefaultMonsterData insertDefaultMonsterAttributesForType:@"Crab"];
    [monster setElementType:Water];
    [monster setProbability:common];
    
    [monster setHealthPoints:22];
    [monster setAbilityPoints:19];
    [monster setCourage:11];
    [monster setDefense:15];
    [monster setIntellect:9];
    [monster setSpeed:10];
    [monster setStrength:9];
    [monster setWillpower:11];
    
    [monster setHealthPointsLevelMultiplier:2.2];
    [monster setAbilityPointsLevelMultiplier:1.9];
    [monster setCourageLevelMultiplier:1.1];
    [monster setDefenseLevelMultiplier:1.3];
    [monster setIntellectLevelMultiplier:0.9];
    [monster setSpeedLevelMultiplier:1.0];
    [monster setStrengthLevelMultiplier:0.9];
    [monster setWillpowerLevelMultiplier:1.0];
    
    [monster setIsTranslucent:NO];
    //--------------------------------------------------------------------
    
    //--------------------------------------------------------------------
    //Small Blob
    monster = [DefaultMonsterData insertDefaultMonsterAttributesForType:@"Small_Blob"];
    [monster setElementType:Forest];
    [monster setProbability:common];
    
    [monster setHealthPoints:23];
    [monster setAbilityPoints:19];
    [monster setCourage:9];
    [monster setDefense:14];
    [monster setIntellect:12];
    [monster setSpeed:8];
    [monster setStrength:8];
    [monster setWillpower:12];
    
    [monster setHealthPointsLevelMultiplier:2.3];
    [monster setAbilityPointsLevelMultiplier:1.9];
    [monster setCourageLevelMultiplier:0.9];
    [monster setDefenseLevelMultiplier:1.4];
    [monster setIntellectLevelMultiplier:1.1];
    [monster setSpeedLevelMultiplier:0.8];
    [monster setStrengthLevelMultiplier:0.8];
    [monster setWillpowerLevelMultiplier:1.2];
    
    [monster setIsTranslucent:NO];
    //--------------------------------------------------------------------

    
    //--------------------------------------------------------------------
    // **** UNCOMMON ****
    //--------------------------------------------------------------------
    
    //--------------------------------------------------------------------
    //Baby Dragon
    monster = [DefaultMonsterData insertDefaultMonsterAttributesForType:@"Baby_Dragon"];
    [monster setElementType:Fire];
    [monster setProbability:uncommon];
    
    [monster setHealthPoints:21];
    [monster setAbilityPoints:19];
    [monster setCourage:10];
    [monster setDefense:11];
    [monster setIntellect:8];
    [monster setSpeed:10];
    [monster setStrength:12];
    [monster setWillpower:10];
    
    [monster setHealthPointsLevelMultiplier:2.2];
    [monster setAbilityPointsLevelMultiplier:1.9];
    [monster setCourageLevelMultiplier:0.9];
    [monster setDefenseLevelMultiplier:0.2];
    [monster setIntellectLevelMultiplier:0.6];
    [monster setSpeedLevelMultiplier:1.1];
    [monster setStrengthLevelMultiplier:1.4];
    [monster setWillpowerLevelMultiplier:1.0];
    
    [monster setIsTranslucent:NO];
    //--------------------------------------------------------------------
    
    //--------------------------------------------------------------------
    //Hard Shell
    monster = [DefaultMonsterData insertDefaultMonsterAttributesForType:@"Hard_Shell"];
    [monster setElementType:Water];
    [monster setProbability:uncommon];
    
    [monster setHealthPoints:23];
    [monster setAbilityPoints:21];
    [monster setCourage:10];
    [monster setDefense:14];
    [monster setIntellect:11];
    [monster setSpeed:8];
    [monster setStrength:9];
    [monster setWillpower:11];
    
    [monster setHealthPointsLevelMultiplier:2.3];
    [monster setAbilityPointsLevelMultiplier:2.1];
    [monster setCourageLevelMultiplier:0.9];
    [monster setDefenseLevelMultiplier:1.4];
    [monster setIntellectLevelMultiplier:1.1];
    [monster setSpeedLevelMultiplier:0.8];
    [monster setStrengthLevelMultiplier:0.9];
    [monster setWillpowerLevelMultiplier:1.2];
    
    [monster setIsTranslucent:NO];
    //--------------------------------------------------------------------
    
    //--------------------------------------------------------------------
    //Ghost
    monster = [DefaultMonsterData insertDefaultMonsterAttributesForType:@"Ghost"];
    [monster setElementType:Darkness];
    [monster setProbability:uncommon];
    
    [monster setHealthPoints:19];
    [monster setAbilityPoints:23];
    [monster setCourage:12];
    [monster setDefense:9];
    [monster setIntellect:15];
    [monster setSpeed:10];
    [monster setStrength:8];
    [monster setWillpower:11];
    
    [monster setHealthPointsLevelMultiplier:1.9];
    [monster setAbilityPointsLevelMultiplier:2.3];
    [monster setCourageLevelMultiplier:1.1];
    [monster setDefenseLevelMultiplier:0.9];
    [monster setIntellectLevelMultiplier:1.4];
    [monster setSpeedLevelMultiplier:1];
    [monster setStrengthLevelMultiplier:0.8];
    [monster setWillpowerLevelMultiplier:1.1];
    
    //--------------------------------------------------------------------
    //Wisp
    monster = [DefaultMonsterData insertDefaultMonsterAttributesForType:@"Wisp"];
    [monster setElementType:Forest];
    [monster setProbability:uncommon];
    
    [monster setHealthPoints:18];
    [monster setAbilityPoints:23];
    [monster setCourage:11];
    [monster setDefense:8];
    [monster setIntellect:14];
    [monster setSpeed:11];
    [monster setStrength:8];
    [monster setWillpower:12];
    
    [monster setHealthPointsLevelMultiplier:1.8];
    [monster setAbilityPointsLevelMultiplier:2.3];
    [monster setCourageLevelMultiplier:1.1];
    [monster setDefenseLevelMultiplier:0.8];
    [monster setIntellectLevelMultiplier:1.4];
    [monster setSpeedLevelMultiplier:1.1];
    [monster setStrengthLevelMultiplier:0.8];
    [monster setWillpowerLevelMultiplier:1.1];
    
    [monster setIsTranslucent:NO];
    //--------------------------------------------------------------------
    
    //--------------------------------------------------------------------
    //Viper
    monster = [DefaultMonsterData insertDefaultMonsterAttributesForType:@"Viper"];
    [monster setElementType:Forest];
    [monster setProbability:uncommon];
    
    [monster setHealthPoints:19];
    [monster setAbilityPoints:22];
    [monster setCourage:11];
    [monster setDefense:8];
    [monster setIntellect:12];
    [monster setSpeed:12];
    [monster setStrength:8];
    [monster setWillpower:11];
    
    [monster setHealthPointsLevelMultiplier:1.9];
    [monster setAbilityPointsLevelMultiplier:2.2];
    [monster setCourageLevelMultiplier:1.1];
    [monster setDefenseLevelMultiplier:0.8];
    [monster setIntellectLevelMultiplier:1.2];
    [monster setSpeedLevelMultiplier:1.3];
    [monster setStrengthLevelMultiplier:0.8];
    [monster setWillpowerLevelMultiplier:1.1];
    
    [monster setIsTranslucent:NO];
    //--------------------------------------------------------------------
    
    //--------------------------------------------------------------------
    // **** RARE ****
    //--------------------------------------------------------------------
    
    //--------------------------------------------------------------------
    //Angler
    monster = [DefaultMonsterData insertDefaultMonsterAttributesForType:@"Angler"];
    [monster setElementType:Water];
    [monster setProbability:rare];
    
    [monster setHealthPoints:20];
    [monster setAbilityPoints:22];
    [monster setCourage:12];
    [monster setDefense:9];
    [monster setIntellect:13];
    [monster setSpeed:11];
    [monster setStrength:9];
    [monster setWillpower:10];
    
    [monster setHealthPointsLevelMultiplier:2.0];
    [monster setAbilityPointsLevelMultiplier:2.2];
    [monster setCourageLevelMultiplier:1.2];
    [monster setDefenseLevelMultiplier:0.9];
    [monster setIntellectLevelMultiplier:1.3];
    [monster setSpeedLevelMultiplier:1.1];
    [monster setStrengthLevelMultiplier:0.9];
    [monster setWillpowerLevelMultiplier:1.0];
    
    [monster setIsTranslucent:NO];
    //--------------------------------------------------------------------
    
    //--------------------------------------------------------------------
    //Fire Elemental
    monster = [DefaultMonsterData insertDefaultMonsterAttributesForType:@"Fire_Elemental"];
    [monster setElementType:Fire];
    [monster setProbability:rare];
    
    [monster setHealthPoints:19];
    [monster setAbilityPoints:21];
    [monster setCourage:10];
    [monster setDefense:9];
    [monster setIntellect:11];
    [monster setSpeed:11];
    [monster setStrength:13];
    [monster setWillpower:11];
    
    [monster setHealthPointsLevelMultiplier:1.9];
    [monster setAbilityPointsLevelMultiplier:2.1];
    [monster setCourageLevelMultiplier:1.0];
    [monster setDefenseLevelMultiplier:0.9];
    [monster setIntellectLevelMultiplier:1.1];
    [monster setSpeedLevelMultiplier:1.1];
    [monster setStrengthLevelMultiplier:1.3];
    [monster setWillpowerLevelMultiplier:1.0];
    
    [monster setIsTranslucent:NO];
    //--------------------------------------------------------------------
    
    //--------------------------------------------------------------------
    // **** SUPER RARE ****
    //--------------------------------------------------------------------

    //--------------------------------------------------------------------
    //Bear Cub
    monster = [DefaultMonsterData insertDefaultMonsterAttributesForType:@"Bear_Cub"];
    [monster setElementType:Forest];
    [monster setProbability:superRare];
    
    [monster setHealthPoints:24];
    [monster setAbilityPoints:17];
    [monster setCourage:13];
    [monster setDefense:14];
    [monster setIntellect:7];
    [monster setSpeed:8];
    [monster setStrength:12];
    [monster setWillpower:11];
    
    [monster setHealthPointsLevelMultiplier:2.4];
    [monster setAbilityPointsLevelMultiplier:1.7];
    [monster setCourageLevelMultiplier:1.3];
    [monster setDefenseLevelMultiplier:1.4];
    [monster setIntellectLevelMultiplier:0.7];
    [monster setSpeedLevelMultiplier:0.8];
    [monster setStrengthLevelMultiplier:1.2];
    [monster setWillpowerLevelMultiplier:1.1];
    
    [monster setIsTranslucent:NO];
    //--------------------------------------------------------------------
    
    //--------------------------------------------------------------------
    // **** ULTRA RARE ****
    //--------------------------------------------------------------------
    
    NSError *error = nil;
    [_managedObjectContext save:&error];
    
    if (error != nil)
    {
        NSLog(@"Failed to initialize default monster data.");
    }
}

- (void)initializeMonsterData
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
    
    NSError *error = nil; 
    [_managedObjectContext save:&error];
    
    if (error != nil)
    {
        NSLog(@"Failed to initialize monster data.");
    }
}

- (void)initializeAbilityData
{
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
    
    NSError *error = nil;
    [_managedObjectContext save:&error];
    
    if (error != nil)
    {
        NSLog(@"Failed to initialize ability data.");
    }
}

- (void)initializePartyData
{
    [PartyData removeAll];
    
    NSArray *monsters = @[[MonsterData anyMonsterWithName:@"Baby Dragon"],
                          [MonsterData anyMonsterWithName:@"Viper"],
                          [MonsterData anyMonsterWithName:@"Skeleton"]];
    
    [PartyData insertPartyWithName:@"Player Party" monsters:monsters];
    
    monsters = @[[MonsterData anyMonsterWithName:@"Wisp"],
                 [MonsterData anyMonsterWithName:@"Scorpion"],
                 [MonsterData anyMonsterWithName:@"Crab"]];
    
    [PartyData insertPartyWithName:@"AI Party" monsters:monsters];
    
    NSError *error = nil;
    [_managedObjectContext save:&error];
    
    if (error != nil)
    {
        NSLog(@"Failed to initialize party data.");
    }
}

- (void) initializeMapNodeData
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
    [_managedObjectContext save:&error];
    
    if (error != nil)
    {
        NSLog(@"Failed to initialize map node data.");
    }
}

@end
