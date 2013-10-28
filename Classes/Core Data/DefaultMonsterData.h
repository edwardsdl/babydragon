//
//  DefaultMonsterData.h
//  BabyDragon
//
//  Created by Dallas Edwards on 10/21/13.
//  Copyright (c) 2013 First Light Games. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "BaseData.h"


@interface DefaultMonsterData : BaseData

@property (nonatomic) int32_t abilityPoints;
@property (nonatomic) float abilityPointsLevelMultiplier;
@property (nonatomic) int32_t courage;
@property (nonatomic) float courageLevelMultiplier;
@property (nonatomic) int32_t defense;
@property (nonatomic) float defenseLevelMultiplier;
@property (nonatomic) int32_t healthPoints;
@property (nonatomic) float healthPointsLevelMultiplier;
@property (nonatomic) int32_t intellect;
@property (nonatomic) float intellectLevelMultiplier;
@property (nonatomic) BOOL isTranslucent;
@property (nonatomic) float probability;
@property (nonatomic) int32_t speed;
@property (nonatomic) float speedLevelMultiplier;
@property (nonatomic) int32_t strength;
@property (nonatomic) float strengthLevelMultiplier;
@property (nonatomic, retain) NSString * type;
@property (nonatomic) int32_t willpower;
@property (nonatomic) float willpowerLevelMultiplier;

@end
