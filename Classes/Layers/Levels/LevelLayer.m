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

+(CCScene *) scene
{
	CCScene *scene = [CCScene node];
	LevelLayer *layer = [LevelLayer node];
	[scene addChild: layer];
	return scene;
}

-(id) init
{
	if( (self=[super init]) )
    {
        //Store the window size
        self->winSize = [[CCDirector sharedDirector] winSize];
        
        //Add a render container for the floor
        floorRenderContainer = [FloorRenderContainer new];
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
