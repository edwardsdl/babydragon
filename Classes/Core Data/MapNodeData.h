//
//  MapNodeData.h
//  BabyDragon
//
//  Created by Dallas Edwards on 3/2/14.
//  Copyright (c) 2014 First Light Games. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "BaseData.h"


@interface MapNodeData : BaseData

@property (nonatomic, retain) NSString * name;
@property (nonatomic) float touchHeight;
@property (nonatomic) float touchWidth;
@property (nonatomic) int32_t worldIndex;
@property (nonatomic) float xTouchPosition;
@property (nonatomic) float yTouchPosition;

@end
