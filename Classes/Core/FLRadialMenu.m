//
//  CombatRadialMenu.m
//  BabyDragon
//
//  Created by Eric Stenborg on 9/18/13.
//  Copyright (c) 2013 First Light Games. All rights reserved.
//

#import "FLRadialMenu.h"
#import "MathHelpers.h"
#import "FLRadialMenuItem.h"

@implementation FLRadialMenu

-(id) initToLayer:(CCLayer*) parentLayer
{
    if ((self = [super init]))
    {
        self.isOpen = NO;
        self.parentLayer = parentLayer;
        self.items = [NSMutableArray array];
        
        self.itemDistanceFromCenter = 50.0f;
    }
    
    return self;
}

-(void) addMenuItem:(FLRadialMenuItem*) item
{
    item.buttonSprite.visible = NO;
    [self.parentLayer addChild:item.buttonSprite z:100];
    [self.items addObject:item];
}

-(void) clearItems
{
    [self.items removeAllObjects];
}

-(void) openMenuAt:(CGPoint) position
{
    //Move each sprite to the home position and attach an action to move it out
    float angleVariance = 360.0f / (float)[self.items count];
    float currentAngle = 0;
    for (FLRadialMenuItem *item in self.items)
    {
        item.buttonSprite.position = position;
        item.buttonSprite.visible = YES;
        
        CCMoveTo *moveTo = [CCMoveTo actionWithDuration:0.15 position:[MathHelpers calcNewPointFromPoint:position andAngle:[MathHelpers degreesToRadians:(currentAngle + 90.0f)] andDistance:self.itemDistanceFromCenter]];
        [item.buttonSprite runAction:moveTo];
        
        currentAngle += angleVariance;
    }
    
    self.isOpen = YES;
}

-(void) closeMenu
{
    //Hide all the sprites
    for (FLRadialMenuItem *item in self.items)
    {
        item.buttonSprite.visible = NO;
    }
    
    self.isOpen = NO;
}

-(void) handleTouch:(CGPoint) location
{
    if (self.isOpen == NO) return;
    
    //See if the touch was on any of the items
    for (FLRadialMenuItem *item in self.items)
    {
        if (CGRectContainsPoint(item.buttonSprite.boundingBox, location))
        {
            [self.parentLayer performSelector:item.selector];
            return;
        }
    }
}

@end
