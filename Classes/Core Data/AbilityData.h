//
//  AbilityData.h
//  BabyDragon
//
//  Created by Dallas Edwards on 3/10/14.
//  Copyright (c) 2014 First Light Games. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "BaseData.h"


@interface AbilityData : BaseData

@property (nonatomic) int32_t apCost;
@property (nonatomic) int32_t attackType;
@property (nonatomic) int32_t effectType;
@property (nonatomic) int32_t elementType;
@property (nonatomic) int32_t level;
@property (nonatomic, retain) NSString * name;
@property (nonatomic) int32_t targetType;
@property (nonatomic) float value;

@end
