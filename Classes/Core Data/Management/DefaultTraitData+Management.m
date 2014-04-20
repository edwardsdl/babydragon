//
//  DefaultTraitData+Management.m
//  BabyDragon
//
//  Created by Eric Stenborg on 4/20/14.
//  Copyright (c) 2014 First Light Games. All rights reserved.
//

#import "DefaultTraitData+Management.h"
#import "BaseData+Management.h"
#import "CoreDataHelper.h"
#import "NSManagedObjectContext+Management.h"

@implementation DefaultTraitData (Management)

static NSString *entityName = @"DefaultTraitData";

+ (NSArray *)allDefaultTraitData
{
    NSManagedObjectContext *managedObjectContext = [[CoreDataHelper sharedInstance] managedObjectContext];
    
    return [managedObjectContext objectsForEntityName:entityName];
}

+ (DefaultTraitData *)defaultTraitDataWithUUID:(NSString *)uuid
{
    return (DefaultTraitData *)[self baseDataWithUUID:uuid];
}

+ (DefaultTraitData *)insertDefaultTraitData
{
    NSManagedObjectContext *managedObjectContext = [[CoreDataHelper sharedInstance] managedObjectContext];
    
    DefaultTraitData *defaultTraitData = [NSEntityDescription insertNewObjectForEntityForName:entityName
                                                                               inManagedObjectContext:managedObjectContext];
    
    return defaultTraitData;
}

+ (void)removeAll
{
    NSManagedObjectContext *managedObjectContext = [[CoreDataHelper sharedInstance] managedObjectContext];
    
    for (DefaultTraitData *defaultTraitData in [self allDefaultTraitData])
    {
        [managedObjectContext deleteObject:defaultTraitData];
    }
    
    [[CoreDataHelper sharedInstance] save];
}

@end
