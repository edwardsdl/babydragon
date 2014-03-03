//
//  SinglePlayerContentData.h
//  BabyDragon
//
//  Created by Dallas Edwards on 3/2/14.
//  Copyright (c) 2014 First Light Games. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "AcquisitionData.h"


@interface SinglePlayerContentData : AcquisitionData

@property (nonatomic) int32_t environmentType;
@property (nonatomic) int32_t lootQuality;
@property (nonatomic) int32_t maximumMonsterLevel;
@property (nonatomic) int32_t minimumMonsterLevel;
@property (nonatomic) int32_t seed;

@end
