//
//  DefaultEquipmentData+Management.h
//  BabyDragon
//
//  Created by Eric Stenborg on 4/20/14.
//  Copyright (c) 2014 First Light Games. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DefaultEquipmentData.h"

@interface DefaultEquipmentData (Management)

+ (NSArray *)allDefaultEquipmentData;
+ (DefaultEquipmentData *)defaultEquipmentDataWithUUID:(NSString *)uuid;
+ (DefaultEquipmentData *)insertDefaultEquipmentData;
+ (void)removeAll;

@end
