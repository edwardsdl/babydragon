//
//  TileMapContainer.h
//  BabyDragon
//
//  Created by Eric Stenborg on 3/16/14.
//  Copyright (c) 2014 First Light Games. All rights reserved.
//

#import "cocos2d.h"
#import "Floor.h"
#import "Tile.h"
#import "TileType.h"

@interface FloorRenderContainer : CCNode
{

}

-(id) initWithFloor:(Floor*) floorToRender  playerPosition:(CGPoint) playerPosition;

-(void) MovePlayerUp;

-(void) MovePlayerDown;

-(void) MovePlayerLeft;

-(void) MovePlayerRight;

@end
