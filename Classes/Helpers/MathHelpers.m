//
//  MathHelpers.m
//  BabyDragon
//
//  Created by Eric Stenborg on 9/18/13.
//  Copyright (c) 2013 First Light Games. All rights reserved.
//

#import "MathHelpers.h"
#import "cocos2d.h"

@implementation MathHelpers

+(float) degreesToRadians:(float) angleInDegrees
{
    return (float)M_PI * angleInDegrees / 180.0f;
}

+(float) radiansToDegrees:(float) angleInRadians
{
    return angleInRadians * (180.0f / (float)M_PI);
}

+(float) calcAngleOfLineWithPointOne:(CGPoint) point1 andPointTwo:(CGPoint) point2
{
    return (float)(atan2(point2.y - point1.y, point2.x - point1.x));
}

+(CGPoint) calcMidpointOfLinrWithPointOone:(CGPoint) point1 andPointTwp:(CGPoint) point2
{
    return ccp((point1.x + point2.x) / 2.0f, (point1.y + point2.y) / 2.0f);
}

+(CGPoint) calcNewPointFromPoint:(CGPoint) point andAngle:(float) angle andDistance:(float) distance
{
    return ccp( (float)(point.x + (distance * cos(angle))), (float)(point.y + (distance * sin(angle))) );
}

+(float) calcDistanceBetweenPointOne:(CGPoint) point1 andPointTwo:(CGPoint) point2
{
    return (float)sqrt(pow((point2.x - point1.x), 2) + pow((point2.y - point1.y), 2));
}

+(CGPoint) calcRotationAround:(CGPoint) origin withAngle:(float) angle forPoint:(CGPoint) point
{
    CGPoint temp = ccp(
                       (point.x * (float)cos(angle)) -
                       (point.y * (float)sin(angle)),
                       (point.y * (float)cos(angle)) +
                       (point.x * (float)sin(angle)));
    
    return ccp(temp.x + origin.x, temp.y + origin.y);
}

@end
