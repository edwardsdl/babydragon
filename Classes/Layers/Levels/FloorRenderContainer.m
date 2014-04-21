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
}

-(id) initWithFloor:(Floor*) floorToRender playerPosition:(CGPoint) startingPlayerTile
{
	if( (self=[super init]) )
    {
        isMoving = NO;
        self.playerTile = ccp(0, 0);
        
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
        [self JumpPlayerToTileX:startingPlayerTile.x Y:startingPlayerTile.y];
    }
    return self;
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
            else if (tile.tileType == Treasure)
            {
                CCSprite* sprite = [CCSprite spriteWithFile:@"TileSheet_Debug.png" rect:CGRectMake(64, 0, 32, 32)];
                sprite.position = ccp(i * 32, j * 32);
                [tilesSpriteBatch addChild:sprite];
            }
            else if (tile.tileType == Start)
            {
                CCSprite* sprite = [CCSprite spriteWithFile:@"TileSheet_Debug.png" rect:CGRectMake(96, 0, 32, 32)];
                sprite.position = ccp(i * 32, j * 32);
                [tilesSpriteBatch addChild:sprite];
            }
            else if (tile.tileType == End)
            {
                CCSprite* sprite = [CCSprite spriteWithFile:@"TileSheet_Debug.png" rect:CGRectMake(128, 0, 32, 32)];
                sprite.position = ccp(i * 32, j * 32);
                [tilesSpriteBatch addChild:sprite];
            }
        }
    }
}

-(void) JumpPlayerToTileX:(int) x Y:(int) y
{
    tilesSpriteBatch.position = ccp(((x * 32) * -1) + winSize.width / 2, ((y * 32) * -1)+ winSize.height / 2);
    self.playerTile = ccp(x, y);
}

-(void) MovePlayerUp
{
    if ([self GetTileAtPositionX:self.playerTile.x Y:self.playerTile.y + 1].tileType == Wall)
        return;
    
    [self MovePlayerToTileX:self.playerTile.x Y:self.playerTile.y + 1];
}

-(void) MovePlayerDown
{
    if ([self GetTileAtPositionX:self.playerTile.x Y:self.playerTile.y - 1].tileType == Wall)
        return;
    
    [self MovePlayerToTileX:self.playerTile.x Y:self.playerTile.y - 1];
}

-(void) MovePlayerLeft
{
    if ([self GetTileAtPositionX:self.playerTile.x - 1 Y:self.playerTile.y].tileType == Wall)
        return;
    
    [self MovePlayerToTileX:self.playerTile.x - 1 Y:self.playerTile.y];
}

-(void) MovePlayerRight
{
    if ([self GetTileAtPositionX:self.playerTile.x + 1 Y:self.playerTile.y].tileType == Wall)
        return;
    
    [self MovePlayerToTileX:self.playerTile.x + 1 Y:self.playerTile.y];
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

    self.playerTile = ccp(x, y);
}

-(Tile*) GetTileAtPositionX:(int) x Y:(int) y
{
    NSMutableArray* columnArray = [floor.tiles objectAtIndex:x];
    return [columnArray objectAtIndex:y];
}

@end
