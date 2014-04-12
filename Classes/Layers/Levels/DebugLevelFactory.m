//
//  DebugLevelFactory.m
//  BabyDragon
//
//  Created by Eric Stenborg on 3/30/14.
//  Copyright (c) 2014 First Light Games. All rights reserved.
//

#import "DebugLevelFactory.h"
#import "ElementType.h"

@implementation DebugLevelFactory

+(Level*) createDebugLevel
{
    Level* level = [[Level alloc] initWithFloorCount:0];
    level.elementType = ElementTypeFire;
    level.minLevel = 1;
    level.maxLevel = 2;
    
    //Create the debug floor 0
    Floor* floor = [[Floor new] initWithSize:CGSizeMake(20, 20)];
    for (int i = 0; i < [floor.tiles count]; i++)
    {
        NSMutableArray* columnArray = [floor.tiles objectAtIndex:i];
        for (int j = 0; j < [columnArray count]; j++)
        {
            Tile* tile = [columnArray objectAtIndex:j];
            
            if (i == 0 || j == 0 || i == 19 || j == 19)
                tile.tileType = Wall;
            else if (i == 4 && j == 4)
                tile.tileType = Start;
            else if (i == 12 && j == 17)
                tile.tileType = End;
            else
                tile.tileType = Open;
        }
    }
    
    [level.floors addObject:floor];
    
    //Create the debug floor 1
    floor = [[Floor new] initWithSize:CGSizeMake(8, 30)];
    for (int i = 0; i < [floor.tiles count]; i++)
    {
        NSMutableArray* columnArray = [floor.tiles objectAtIndex:i];
        for (int j = 0; j < [columnArray count]; j++)
        {
            Tile* tile = [columnArray objectAtIndex:j];
            
            if (i == 0 || j == 0 || i == 7 || j == 29)
                tile.tileType = Wall;
            else if (i == 4 && j == 4)
                tile.tileType = Start;
            else if (i == 5 && j == 28)
                tile.tileType = End;
            else
                tile.tileType = Open;
        }
    }
    
    [level.floors addObject:floor];
    
    return level;
}

@end
