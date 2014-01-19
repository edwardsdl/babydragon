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
    BOOL dragMap;
    
    MapNodeMenu* mapNodeMenu;
    int currentlySelectedWorldIndex;
}

//----------------------------------------------------------------------------------
//----------- Initialization Methods
//----------------------------------------------------------------------------------

-(id) init
{
	if( (self=[super init]) )
    {
        currentlySelectedWorldIndex = -1;
        
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

-(void) moveToX:(float) x andY:(float) y
{
    self.position = ccp(x, y);
}

-(void) scrollToX:(float) x andY:(float) y
{
    CCMoveTo* moveTo = [CCMoveTo actionWithDuration:0.2 position:ccp(x, y)];
    [self runAction:moveTo];
}

- (void) showNodeMenuForWorldIndex:(int) worldIndex
{
    [self closeMapNodeMenu];
    
    currentlySelectedWorldIndex = worldIndex;
    
    mapNodeMenu = [[MapNodeMenu alloc] initWithWorldIndex:worldIndex];
    MapNodeData* mapNode = [MapNodeData mapNodeForWorldIndex:worldIndex];
    mapNodeMenu.position = ccp(mapNode.xTouchPosition + 250, mapNode.yTouchPosition);
    [self addChild:mapNodeMenu];
}

-(void) closeMapNodeMenu
{
    if (mapNodeMenu != nil)
    {
        [self removeChild:mapNodeMenu];
        mapNodeMenu = nil;
        
        currentlySelectedWorldIndex = -1;
    }
}

-(void) focusMapOnMapNode:(MapNodeData*) mapNode
{
    //Determine the new position of the map
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    [self scrollToX:(screenSize.width/2) - mapNode.xTouchPosition - 125
             andY:(screenSize.height/2) - mapNode.yTouchPosition];
    
    //Show the node info menu
    [self showNodeMenuForWorldIndex:mapNode.worldIndex];
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
    dragMap = YES;
    
    //First, did the player touch a map node?
    for (MapNodeData* mapNode in [MapNodeData allMapNodes])
    {
        //Make a check for the position inside the circle of the map node
        if ([MathHelpers calcDistanceBetweenPointOne:ccp(mapNode.xTouchPosition, mapNode.yTouchPosition) andPointTwo:position] <= (mapNode.touchWidth / 2))
        {
            if (currentlySelectedWorldIndex != mapNode.worldIndex)
                [self focusMapOnMapNode:mapNode];
            else
                [self closeMapNodeMenu];
            
            dragMap = NO;
            return YES;
        }
    }

    return YES;
}

- (void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
    if (!dragMap)
        return;
    
    //Get touch position
    CGPoint position = [self convertTouchToNodeSpace:touch];
    
    //Move the map by the difference in this position and the last touch position
    [self moveByX:(position.x - touchBeginPosition.x) andY:(position.y - touchBeginPosition.y)];
    
    [self closeMapNodeMenu];
}


@end
