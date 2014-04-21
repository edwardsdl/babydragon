//
//  SinglePlayerContentData.h
//  BabyDragon
//
//  Created by Dallas Edwards on 4/20/14.
//  Copyright (c) 2014 First Light Games. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "AcquisitionData.h"


@interface SinglePlayerContentData : AcquisitionData

@property (nonatomic) int32_t primaryElementType;
@property (nonatomic) int32_t lootDensityType;
@property (nonatomic) int32_t levelSizeType;
@property (nonatomic) int32_t secondaryElementType;
@property (nonatomic) int32_t levelBonusType;

@end
