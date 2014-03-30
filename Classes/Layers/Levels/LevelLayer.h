//
//  LevelLayer.h
//  BabyDragon
//
//  Created by Eric Stenborg on 3/16/14.
//  Copyright (c) 2014 First Light Games. All rights reserved.
//

#import "cocos2d.h"
#import "FloorRenderContainer.h"
#import "FLButton.h"
#import "LevelState.h"
#import "Level.h"

@interface LevelLayer : CCLayer

+(CCScene *) scene;

-(id) initWithLevelState:(LevelState*) levelState;

@end
