//
//  CoreDataHelper.h
//  BabyDragon
//
//  Created by Dallas Edwards on 10/9/13.
//  Copyright (c) 2013 First Light Games. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CoreDataHelper : NSObject

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

+ (CoreDataHelper *)sharedInstance;
- (NSURL *)applicationDocumentsDirectory;
- (void)initializePersistentObjectStore;

@end
