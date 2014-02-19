//
//  CoreDataHelper.h
//  BabyDragon
//
//  Created by Eric Stenborg on 1/29/14.
//  Copyright (c) 2014 First Light Games. All rights reserved.
//

@interface CoreDataHelper : NSObject

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

typedef void (^ ErrorBlock)(NSError *);

+ (CoreDataHelper *)sharedInstance;

- (NSURL *)applicationDocumentsDirectory;
- (void)initializePersistentObjectStore;
- (void)saveWithErrorBlock:(ErrorBlock)errorBlock;

@end
