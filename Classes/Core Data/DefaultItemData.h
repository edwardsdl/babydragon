//
//  DefaultItemData.h
//  BabyDragon
//
//  Created by Dallas Edwards on 2/17/14.
//  Copyright (c) 2014 First Light Games. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface DefaultItemData : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic) int32_t effectType;
@property (nonatomic) int32_t targetType;
@property (nonatomic) int32_t attackType;
@property (nonatomic) int32_t elementType;
@property (nonatomic) float value;

@end
