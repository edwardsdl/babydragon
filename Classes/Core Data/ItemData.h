//
//  ItemData.h
//  BabyDragon
//
//  Created by Dallas Edwards on 3/3/14.
//  Copyright (c) 2014 First Light Games. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "AcquisitionData.h"


@interface ItemData : AcquisitionData

@property (nonatomic) int32_t attackType;
@property (nonatomic) int32_t effectType;
@property (nonatomic) int32_t elementType;
@property (nonatomic, retain) NSString * type;
@property (nonatomic) int32_t targetType;
@property (nonatomic) int32_t value;
@property (nonatomic) int32_t quantity;

@end
