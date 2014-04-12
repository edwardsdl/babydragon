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
        
        //Set the current player tile to the start tile of the floor
        currentLevelState.PlayerTile = [self findTileOfType:Start];
        
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
    
    if (![self checkForFloorTransition])
        [self checkForCombat];
}

-(void) movePlayerDown
{
    [floorRenderContainer MovePlayerDown];
    currentLevelState.PlayerTile = floorRenderContainer.playerTile;
    
    if (![self checkForFloorTransition])
        [self checkForCombat];
}

-(void) movePlayerLeft
{
    [floorRenderContainer MovePlayerLeft];
    currentLevelState.PlayerTile = floorRenderContainer.playerTile;
    
    if (![self checkForFloorTransition])
        [self checkForCombat];
}

-(void) movePlayerRight
{
    [floorRenderContainer MovePlayerRight];
    currentLevelState.PlayerTile = floorRenderContainer.playerTile;
    
    if (![self checkForFloorTransition])
        [self checkForCombat];
}

-(BOOL) checkForFloorTransition
{
    //Get the tile
    Tile* tile = [self getPlayersCurrentTile];
    
    //Check for an end tile
    if (tile.tileType == End && currentLevelState.PlayerFloor + 1 != [currentLevelState.Level.floors count])
    {
        //Update the player floor, find the new tile on the new floor then transition
        currentLevelState.PlayerFloor++;
        currentLevelState.PlayerTile = [self findTileOfType:Start];
        [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.5 scene:[LevelLayer sceneWithExistingLevelState] ]];
        return YES;
    }
    
    //Check for a start tile
    if (tile.tileType == Start && currentLevelState.PlayerFloor != 0)
    {
        //Update the player floor, find the new tile on the new floor then transition
        currentLevelState.PlayerFloor--;
        currentLevelState.PlayerTile = [self findTileOfType:End];
        [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.5 scene:[LevelLayer sceneWithExistingLevelState] ]];
        return YES;
    }

    
    return NO;
}

-(void) checkForCombat
{
    return;
    
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

-(CGPoint) findTileOfType:(TileType) type
{
    Floor* floor = [self getPlayersCurrentFloor];
    for (int x = 0; x < [floor.tiles count]; x++)
    {
        NSMutableArray* columnArray = [floor.tiles objectAtIndex:x];
        for (int y = 0; y < [columnArray count]; y++)
        {
            Tile* tile = [columnArray objectAtIndex:y];
            if (tile.tileType == Start)
            {
                return ccp(x, y);
            }
        }
    }
    
    return ccp(-1, -1);
}

-(Tile*) getTileAtX:(int) x Y:(int) y
{
    Floor* floor = [self getPlayersCurrentFloor];
    NSMutableArray* columnArray = [floor.tiles objectAtIndex:x];
    return [columnArray objectAtIndex:y];
}

-(Floor*) getPlayersCurrentFloor
{
    return [currentLevelState.Level.floors objectAtIndex:currentLevelState.PlayerFloor];
}

-(Tile*) getPlayersCurrentTile
{
    return [self getTileAtX:currentLevelState.PlayerTile.x Y:currentLevelState.PlayerTile.y];
}

@end
