//
//  DefaultItemData.h
//  BabyDragon
//
//  Created by Eric Stenborg on 4/19/14.
//  Copyright (c) 2014 First Light Games. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "BaseData.h"


@interface DefaultItemData : BaseData

@property (nonatomic) int32_t itemId;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * descriptionText;
@property (nonatomic) float probability;
@property (nonatomic) int32_t effect;
@property (nonatomic, retain) NSString * type;
@property (nonatomic) int32_t cost;
@property (nonatomic) int32_t value;

@end
