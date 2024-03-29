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
#import "PartyData.h"
#import "PartyData+Management.h"
#import "CombatLayer.h"
#import "CombatNextLayer.h"
#import "EnemyPartyFactory.h"
#import "CoreDataHelper.h"

@interface LevelLayer : CCLayer

+(CCScene*) sceneWithNewLevel:(Level*) level;
+(CCScene*) sceneWithExistingLevelStateAndXpGain:(int) xpGain;

-(id) initWithNewLevel:(Level*) level;
-(id) initWithExistingLevelStateAndXpGain:(int) xpGain;

@end
