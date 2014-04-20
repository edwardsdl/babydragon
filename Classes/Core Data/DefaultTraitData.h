//
//  DefaultTraitData.h
//  BabyDragon
//
//  Created by Eric Stenborg on 4/20/14.
//  Copyright (c) 2014 First Light Games. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "BaseData.h"


@interface DefaultTraitData : BaseData

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * descriptionText;
@property (nonatomic) int32_t effect;
@property (nonatomic) int32_t value;

@end
