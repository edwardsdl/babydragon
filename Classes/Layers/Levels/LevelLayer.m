//
//  LevelLayer.m
//  BabyDragon
//
//  Created by Eric Stenborg on 3/16/14.
//  Copyright (c) 2014 First Light Games. All rights reserved.
//

#import "LevelLayer.h"

@implementation LevelLayer
{
    CGSize winSize;
    FloorRenderContainer* floorRenderContainer;
    FLButton* upButton;
    FLButton* downButton;
    FLButton* leftButton;
    FLButton* rightButton;
}

static LevelState* currentLevelState = nil;

+(CCScene *) scene
{
	CCScene *scene = [CCScene node];
	LevelLayer *layer = [LevelLayer node];
	[scene addChild: layer];
	return scene;
}

-(id) initWithLevelState:(Level*) level
{
	if( (self=[super init]) )
    {
        //If a new level was passed in then create and store a new state for it,
        //otherwise just use the current one
        if (level != nil)
        {
            currentLevelState = [LevelState new];
            currentLevelState.Level = level;
            currentLevelState.PlayerFloor = 0;
            currentLevelState.PlayerTile = ccp(4, 4); //Just start at 4, 4 right now
        }
        
        //Store the window size
        self->winSize = [[CCDirector sharedDirector] winSize];
        
        //Add a render container for the floor
        floorRenderContainer = [[FloorRenderContainer alloc]
                                    initWithFloor:
                                        [currentLevelState.Level.floors objectAtIndex:currentLevelState.PlayerFloor]
                                    playerPosition:
                                        currentLevelState.PlayerTile];
        [self addChild:floorRenderContainer];
        
        //Add the invisible buttons that will trigger the player to move
        upButton = [[FLButton new] initWithDimensions:CGSizeMake(300, 100) parent:self selector:@selector(movePlayerUp)];
        upButton.position = ccp(winSize.width / 2, 265);
        [self addChild:upButton];
        
        downButton = [[FLButton new] initWithDimensions:CGSizeMake(300, 100) parent:self selector:@selector(movePlayerDown)];
        downButton.position = ccp(winSize.width / 2, 55);
        [self addChild:downButton];
        
        leftButton = [[FLButton new] initWithDimensions:CGSizeMake(100, 200) parent:self selector:@selector(movePlayerLeft)];
        leftButton.position = ccp(55, winSize.height / 2);
        [self addChild:leftButton];
        
        rightButton = [[FLButton new] initWithDimensions:CGSizeMake(100, 200) parent:self selector:@selector(movePlayerRight)];
        rightButton.position = ccp(510, winSize.height / 2);
        [self addChild:rightButton];
    }
    return self;
}

-(void) movePlayerUp
{
    [floorRenderContainer MovePlayerUp];
}

-(void) movePlayerDown
{
    [floorRenderContainer MovePlayerDown];
}

-(void) movePlayerLeft
{
    [floorRenderContainer MovePlayerLeft];
}
-(void) movePlayerRight
{
    [floorRenderContainer MovePlayerRight];
}

@end
