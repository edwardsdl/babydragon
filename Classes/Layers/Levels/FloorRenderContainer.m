//
//  TileMapContainer.m
//  BabyDragon
//
//  Created by Eric Stenborg on 3/16/14.
//  Copyright (c) 2014 First Light Games. All rights reserved.
//

#import "FloorRenderContainer.h"

@implementation FloorRenderContainer
{
    CGSize winSize;
    Floor* floor;
    CCSpriteBatchNode *tilesSpriteBatch;
    CCSprite *playerSprite;
    BOOL isMoving;
    CGPoint playerTile;
}

-(id) initWithFloor:(Floor*) floorToRender playerPosition:(CGPoint) playerPosition
{
	if( (self=[super init]) )
    {
        isMoving = NO;
        playerTile = ccp(0, 0);
        
        //Store the window size
        self->winSize = [[CCDirector sharedDirector] winSize];
        
        //Store the floor
        self->floor = floorToRender;
        
        //Create the sprites and the sprite batch for drawing the tiles
        [self PrepareTileSprites];
        
        //Draw the player in the middle of the screen
        playerSprite = [CCSprite spriteWithFile:@"Player.png"];
        playerSprite.position = ccp(winSize.width/2, winSize.height/2);
        [self addChild:playerSprite];
        
        //Jump to the given player position
        [self JumpPlayerToTileX:playerPosition.x Y:playerPosition.y];
    }
    return self;
}

-(void) CreateFloor
{
    floor = [[Floor new] initWithSize:CGSizeMake(50, 50)];
    for (int i = 0; i < [floor.tiles count]; i++)
    {
        NSMutableArray* columnArray = [floor.tiles objectAtIndex:i];
        for (int j = 0; j < [columnArray count]; j++)
        {
            Tile* tile = [columnArray objectAtIndex:j];
            
            if (i == 0 || j == 0 || i == 49 || j == 49)
                tile.tileType = Wall;
            else
                tile.tileType = Open;
        }
    }
}

-(void) PrepareTileSprites
{
    tilesSpriteBatch = [CCSpriteBatchNode batchNodeWithFile:@"TileSheet_Debug.png"];
    [self addChild:tilesSpriteBatch];
    
    //Create a sprite per tile, but add it to the sprite batch
    for (int i = 0; i < [floor.tiles count]; i++)
    {
        NSMutableArray* columnArray = [floor.tiles objectAtIndex:i];
        for (int j = 0; j < [columnArray count]; j++)
        {
            Tile* tile = [columnArray objectAtIndex:j];
            
            if (tile.tileType == Open)
            {
                CCSprite* sprite = [CCSprite spriteWithFile:@"TileSheet_Debug.png" rect:CGRectMake(0, 0, 32, 32)];
                sprite.position = ccp(i * 32, j * 32);
                [tilesSpriteBatch addChild:sprite];
            }
            else if (tile.tileType == Wall)
            {
                CCSprite* sprite = [CCSprite spriteWithFile:@"TileSheet_Debug.png" rect:CGRectMake(32, 0, 32, 32)];
                sprite.position = ccp(i * 32, j * 32);
                [tilesSpriteBatch addChild:sprite];
            }
        }
    }
}

-(void) JumpPlayerToTileX:(int) x Y:(int) y
{
    tilesSpriteBatch.position = ccp(((x * 32) * -1) + winSize.width / 2, ((y * 32) * -1)+ winSize.height / 2);
    playerTile = ccp(x, y);
}

-(void) MovePlayerUp
{
    if ([self GetTileAtPositionX:playerTile.x Y:playerTile.y + 1].tileType == Wall)
        return;
    
    [self MovePlayerToTileX:playerTile.x Y:playerTile.y + 1];
}

-(void) MovePlayerDown
{
    if ([self GetTileAtPositionX:playerTile.x Y:playerTile.y - 1].tileType == Wall)
        return;
    
    [self MovePlayerToTileX:playerTile.x Y:playerTile.y - 1];
}

-(void) MovePlayerLeft
{
    if ([self GetTileAtPositionX:playerTile.x - 1 Y:playerTile.y].tileType == Wall)
        return;
    
    [self MovePlayerToTileX:playerTile.x - 1 Y:playerTile.y];
}

-(void) MovePlayerRight
{
    if ([self GetTileAtPositionX:playerTile.x + 1 Y:playerTile.y].tileType == Wall)
        return;
    
    [self MovePlayerToTileX:playerTile.x + 1 Y:playerTile.y];
}

-(void) MovePlayerToTileX:(int) x Y:(int) y
{
    if (isMoving)
        return;
    
    isMoving = YES;
    CCMoveTo* moveTo = [CCMoveTo actionWithDuration:0.3f position:ccp(((x * 32) * -1) + winSize.width / 2, ((y * 32) * -1)+ winSize.height / 2)];
    CCDelayTime* delay = [CCDelayTime actionWithDuration:0.3f];
    CCCallBlock* flipMovingFlag = [CCCallBlock actionWithBlock:^
                                   {
                                       isMoving = NO;
                                   }];
    
    [tilesSpriteBatch runAction:[CCSequence actions:moveTo, delay, flipMovingFlag, nil]];

    playerTile = ccp(x, y);
}

-(Tile*) GetTileAtPositionX:(int) x Y:(int) y
{
    NSMutableArray* columnArray = [floor.tiles objectAtIndex:x];
    return [columnArray objectAtIndex:y];
}

@end
