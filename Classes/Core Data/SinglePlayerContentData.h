//
//  SinglePlayerContentData.h
//  BabyDragon
//
//  Created by Dallas Edwards on 12/16/13.
//  Copyright (c) 2013 First Light Games. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "AcquisitionData.h"


@interface SinglePlayerContentData : AcquisitionData

@property (nonatomic) int32_t environmentType;
@property (nonatomic) int32_t worldPositionIndex;
@property (nonatomic) int32_t seed;

@end
