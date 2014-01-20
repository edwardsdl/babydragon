//
//  MapNodeData.h
//  BabyDragon
//
//  Created by Eric Stenborg on 1/19/14.
//  Copyright (c) 2014 First Light Games. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface MapNodeData : NSManagedObject

@property (nonatomic) int32_t worldIndex;
@property (nonatomic) float xTouchPosition;
@property (nonatomic) float yTouchPosition;
@property (nonatomic) float touchWidth;
@property (nonatomic) float touchHeight;
@property (nonatomic, retain) NSString * name;

@end
