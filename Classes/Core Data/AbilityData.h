//
//  AbilityData.h
//  BabyDragon
//
//  Created by Eric Stenborg on 2/1/14.
//  Copyright (c) 2014 First Light Games. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "BaseData.h"

@class MonsterData;

@interface AbilityData : BaseData

@property (nonatomic) int32_t apCost;
@property (nonatomic) int32_t effectType;
@property (nonatomic) int32_t elementType;
@property (nonatomic, retain) NSString * name;
@property (nonatomic) int32_t targetType;
@property (nonatomic) float value;
@property (nonatomic) int32_t attackType;
@property (nonatomic) int32_t level;
@property (nonatomic, retain) MonsterData *monster;

@end
