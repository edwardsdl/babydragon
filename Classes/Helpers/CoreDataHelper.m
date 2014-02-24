#import "AbilityDataInitializer.h"
#import "CoreDataHelper.h"
#import "DebugDataInitializer.h"
#import "DefaultMonsterDataInitializer.h"

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
    });
    
    return sharedInstance;
}

- (void)addPersistentStore
{
    NSError *error = nil;
    if (![[self persistentStoreCoordinator] addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:[self persistentStoreURL] options:nil error:&error]) {
        if ([error code] == NSPersistentStoreIncompatibleVersionHashError)
        {
            [self reset];
        }
        else
        {
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (void)initializePersistentObjectStore
{
    [AbilityDataInitializer initializeData];
    [DefaultMonsterDataInitializer initializeData];
    [DebugDataInitializer initializeData];
}

- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil)
    {
        return _managedObjectContext;
    }
    
    _managedObjectContext = [[NSManagedObjectContext alloc] init];
    [_managedObjectContext setPersistentStoreCoordinator:[self persistentStoreCoordinator]];
    
    return _managedObjectContext;
}

- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil)
    {
        return _managedObjectModel;
    }
    
    NSURL *managedObjectModelURL = [[NSBundle mainBundle] URLForResource:@"BabyDragon" withExtension:@"momd"];
    
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:managedObjectModelURL];
    
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil)
    {
        return _persistentStoreCoordinator;
    }
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];

    [self addPersistentStore];
    
    return _persistentStoreCoordinator;
}

- (NSURL *)persistentStoreURL
{
    return [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"BabyDragon.sqlite"];
}

- (void)reset
{
    [[self managedObjectContext] lock];
    [[self managedObjectContext] reset];
    
    for (NSPersistentStore *persistentStore in [[self persistentStoreCoordinator] persistentStores])
    {
        NSError *error = nil;
        if(![[self persistentStoreCoordinator] removePersistentStore:persistentStore error:&error])
        {
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
    
    NSError *error = nil;
    if (![[NSFileManager defaultManager] removeItemAtURL:[self persistentStoreURL] error:&error])
    {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }

    [self addPersistentStore];

    [[self managedObjectContext] unlock];
}

- (void)save
{
    [self saveWithErrorBlock:^(NSError *error) {
        if (error != nil)
        {
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        }
    }];
}

- (void)saveWithErrorBlock:(ErrorBlock)errorBlock
{
    NSError *error = nil;
    [[self managedObjectContext] save:&error];
    
    errorBlock(error);
}

@end
