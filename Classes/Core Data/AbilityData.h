//
//  AbilityData.h
//  BabyDragon
//
//  Created by Dallas Edwards on 10/14/13.
//  Copyright (c) 2013 First Light Games. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "BaseData.h"

@class MonsterData;

@interface AbilityData : BaseData

@property (nonatomic) int32_t cost;
@property (nonatomic, retain) NSString * effectSprite;
@property (nonatomic) int32_t effectType;
@property (nonatomic) int32_t elementType;
@property (nonatomic, retain) NSString * iconSprite;
@property (nonatomic, retain) NSString * name;
@property (nonatomic) int32_t targetType;
@property (nonatomic) int32_t value;
@property (nonatomic, retain) MonsterData *monster;

@end
