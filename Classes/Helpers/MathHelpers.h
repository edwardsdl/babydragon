//
//  MathHelpers.h
//  BabyDragon
//
//  Created by Eric Stenborg on 9/18/13.
//  Copyright (c) 2013 First Light Games. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MathHelpers : NSObject

+(float) degreesToRadians:(float) angleInDegrees;

+(float) radiansToDegrees:(float) angleInRadians;

+(float) calcAngleOfLineWithPointOne:(CGPoint) point1 andPointTwo:(CGPoint) point2;

+(CGPoint) calcMidpointOfLinrWithPointOone:(CGPoint) point1 andPointTwp:(CGPoint) point2;

+(CGPoint) calcNewPointFromPoint:(CGPoint) point andAngle:(float) angle andDistance:(float) distance;

+(float) calcDistanceBetweenPointOne:(CGPoint) point1 andPointTwo:(CGPoint) point2;

+(CGPoint) calcRotationAround:(CGPoint) origin withAngle:(float) angle forPoint:(CGPoint) point;

@end
