//
//  LevelState.h
//  BabyDragon
//
//  Created by Eric Stenborg on 3/17/14.
//  Copyright (c) 2014 First Light Games. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Level.h"

@interface LevelState : NSObject

@property (nonatomic, retain, strong) Level* Level;

@property (nonatomic) int PlayerFloor;

@property (nonatomic) CGPoint PlayerTile;

@end
