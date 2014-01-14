//
//  MapNode.m
//  BabyDragon
//
//  Created by Eric Stenborg on 1/13/14.
//  Copyright 2014 First Light Games. All rights reserved.
//

#import "MapNode.h"


@implementation MapNode
{
    CCSprite* mapSprite;
    
    CGPoint touchBeginPosition;
}

//----------------------------------------------------------------------------------
//----------- Initialization Methods
//----------------------------------------------------------------------------------

-(id) init
{
	if( (self=[super init]) )
    {
        //Load the map sprite and add it to the node
        mapSprite = [CCSprite spriteWithFile:@"Map.png"];
        [self addChild:mapSprite];
    }
    return self;
}

- (void)onEnter
{
    [[[CCDirector sharedDirector] touchDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
    [super onEnter];
}

- (void)onExit
{
    [[[CCDirector sharedDirector] touchDispatcher] removeDelegate:self];
    [super onExit];
}

//----------------------------------------------------------------------------------
//----------- Map Handling Methods
//----------------------------------------------------------------------------------

- (void) moveByX:(float) x andY:(float) y
{
    self.position = ccp(self.position.x + x, self.position.y + y);
}

//----------------------------------------------------------------------------------
//----------- Touch Input Methods
//----------------------------------------------------------------------------------

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    //Get touch position
    CGPoint position = [self convertTouchToNodeSpace:touch];
    
    //Store the position of the touch as the last touch position
    touchBeginPosition = position;
    
    return YES;
}

- (void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
    //Get touch position
    CGPoint position = [self convertTouchToNodeSpace:touch];
    
    //Move the map by the difference in this position and the last touch position
    [self moveByX:(position.x - touchBeginPosition.x) andY:(position.y - touchBeginPosition.y)];
}


@end
