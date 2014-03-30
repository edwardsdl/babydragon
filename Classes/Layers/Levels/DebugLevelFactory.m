//
//  DebugLevelFactory.m
//  BabyDragon
//
//  Created by Eric Stenborg on 3/30/14.
//  Copyright (c) 2014 First Light Games. All rights reserved.
//

#import "DebugLevelFactory.h"

@implementation DebugLevelFactory

+(Level*) createDebugLevel
{
    Level* level = [[Level alloc] initWithFloorCount:0];
    
    //Create the debug floor
    Floor* floor = [[Floor new] initWithSize:CGSizeMake(50, 50)];
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
    
    [level.floors addObject:floor];
    
    return level;
}

@end
