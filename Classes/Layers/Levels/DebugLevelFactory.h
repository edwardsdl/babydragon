//
//  DebugLevelFactory.h
//  BabyDragon
//
//  Created by Eric Stenborg on 3/30/14.
//  Copyright (c) 2014 First Light Games. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Level.h"
#import "Floor.h"
#import "Tile.h"

@interface DebugLevelFactory : NSObject

+(Level*) createDebugLevel;

@end
