//
//  LevelLayer.m
//  BabyDragon
//
//  Created by Eric Stenborg on 3/16/14.
//  Copyright (c) 2014 First Light Games. All rights reserved.
//

#import "LevelLayer.h"

@class CombatLevel;

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

+(CCScene*) sceneWithNewLevel:(Level*) level
{
	CCScene *scene = [CCScene node];
	LevelLayer *layer = [[LevelLayer alloc] initWithNewLevel:level];
	[scene addChild: layer];
	return scene;
}

+(CCScene*) sceneWithExistingLevelState
{
    CCScene *scene = [CCScene node];
	LevelLayer *layer = [[LevelLayer alloc] initWithExistingLevelState];
	[scene addChild: layer];
	return scene;
}

-(id) initWithNewLevel:(Level*) level
{
    if( (self=[super init]) )
    {
        currentLevelState = [LevelState new];
        currentLevelState.Level = level;
        currentLevelState.PlayerFloor = 0;
        currentLevelState.PlayerTile = ccp(4, 4); //Just start at 4, 4 right now
        
        self = [self initWithExistingLevelState];
    }
    return self;
}

-(id) initWithExistingLevelState
{
    if( (self=[super init]) )
    {
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
    currentLevelState.PlayerTile = floorRenderContainer.playerTile;
    [self checkForCombat];
}

-(void) movePlayerDown
{
    [floorRenderContainer MovePlayerDown];
    currentLevelState.PlayerTile = floorRenderContainer.playerTile;
    [self checkForCombat];
}

-(void) movePlayerLeft
{
    [floorRenderContainer MovePlayerLeft];
    currentLevelState.PlayerTile = floorRenderContainer.playerTile;
    [self checkForCombat];
}

-(void) movePlayerRight
{
    [floorRenderContainer MovePlayerRight];
    currentLevelState.PlayerTile = floorRenderContainer.playerTile;
    [self checkForCombat];
}

-(void) checkForCombat
{
    //Crude logic for now: 10% change of combat per move
    int combatRoll = arc4random() % 100;
    if (combatRoll < 10)
    {
        //This one is purely for debug
        PartyData *partyOne = [PartyData anyPartyWithName:@"Player Party"];
        PartyData *partyTwo = [PartyData anyPartyWithName:@"AI Party"];
        
        [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0
                                                    scene:[CombatLayer sceneWithPartyOne:partyOne
                                                            andPartyTwo:partyTwo
                                                            withBackgroundNamed:@"Test"
                                                            nextLayer:CombatNextLayerLevel]]];
    }
}

@end
