//
//  DefaultEquipmentData+Management.m
//  BabyDragon
//
//  Created by Eric Stenborg on 4/20/14.
//  Copyright (c) 2014 First Light Games. All rights reserved.
//

#import "DefaultEquipmentData+Management.h"
#import "BaseData+Management.h"
#import "CoreDataHelper.h"
#import "NSManagedObjectContext+Management.h"

@implementation DefaultEquipmentData (Management)

static NSString *entityName = @"DefaultEquipmentData";

+ (NSArray *)allDefaultEquipmentData
{
    NSManagedObjectContext *managedObjectContext = [[CoreDataHelper sharedInstance] managedObjectContext];
    
    return [managedObjectContext objectsForEntityName:entityName];
}

+ (DefaultEquipmentData *)defaultEquipmentDataWithUUID:(NSString *)uuid
{
    return (DefaultEquipmentData *)[self baseDataWithUUID:uuid];
}

+ (DefaultEquipmentData *)insertDefaultEquipmentData
{
    NSManagedObjectContext *managedObjectContext = [[CoreDataHelper sharedInstance] managedObjectContext];
    
    DefaultEquipmentData *defaultEquipmentData = [NSEntityDescription insertNewObjectForEntityForName:entityName
                                                                     inManagedObjectContext:managedObjectContext];
    
    return defaultEquipmentData;
}

+ (void)removeAll
{
    NSManagedObjectContext *managedObjectContext = [[CoreDataHelper sharedInstance] managedObjectContext];
    
    for (DefaultEquipmentData *defaultEquipmentData in [self allDefaultEquipmentData])
    {
        [managedObjectContext deleteObject:defaultEquipmentData];
    }
    
    [[CoreDataHelper sharedInstance] save];
}

@end
