//
//  DefaultMonsterData.h
//  BabyDragon
//
//  Created by Eric Stenborg on 2/26/14.
//  Copyright (c) 2014 First Light Games. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "BaseData.h"


@interface DefaultMonsterData : BaseData

@property (nonatomic) int32_t abilityPoints;
@property (nonatomic) float abilityPointsLevelMultiplier;
@property (nonatomic) int32_t attackType;
@property (nonatomic) int32_t courage;
@property (nonatomic) float courageLevelMultiplier;
@property (nonatomic) int32_t defense;
@property (nonatomic) float defenseLevelMultiplier;
@property (nonatomic) int32_t elementType;
@property (nonatomic) int32_t healthPoints;
@property (nonatomic) float healthPointsLevelMultiplier;
@property (nonatomic) BOOL isFlying;
@property (nonatomic) BOOL isTranslucent;
@property (nonatomic) int32_t power;
@property (nonatomic) float powerLevelMultiplier;
@property (nonatomic) float probability;
@property (nonatomic) float scalePercent;
@property (nonatomic) int32_t speed;
@property (nonatomic) float speedLevelMultiplier;
@property (nonatomic, retain) NSString * type;
@property (nonatomic) int32_t willpower;
@property (nonatomic) float willpowerLevelMultiplier;
@property (nonatomic) int32_t roleTypePrimary;
@property (nonatomic) int32_t roleTypeSecondary;

@end
