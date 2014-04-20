//
//  DefaultEquipmentData.h
//  BabyDragon
//
//  Created by Eric Stenborg on 4/20/14.
//  Copyright (c) 2014 First Light Games. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "BaseData.h"


@interface DefaultEquipmentData : BaseData

@property (nonatomic, retain) NSString * name;
@property (nonatomic) int32_t effect;
@property (nonatomic) int32_t elementType;
@property (nonatomic) int32_t value;
@property (nonatomic) int32_t cost;
@property (nonatomic) int32_t probability;
@property (nonatomic, retain) NSString * descriptionText;

@end
