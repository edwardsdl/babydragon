//
//  CombatMonsterNode.h
//  BabyDragon
//
//  Created by Eric Stenborg on 11/7/13.
//  Copyright 2013 First Light Games. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "MonsterData.h"
#import "MathHelpers.h"

@interface CombatMonsterNode : CCNode <CCTouchOneByOneDelegate>
{
    CCSprite *shadowSprite;
    CCSprite *monsterSprite;
    
    CCProgressTimer *healthBar;
    CCProgressTimer *actionBar;
    CCProgressTimer *turnBar;
    
    int turnCounter;
    
    float yShadowOffset;
};

@property (nonatomic, retain) MonsterData *monsterData;

@property int currentHealthPoints;

@property int currentAbilityPoints;

@property int partyNumber;

@property (nonatomic, retain) NSMutableArray* statusEffects;

-(id) init:(MonsterData*) data partyNumber:(int) partyNum;

-(BOOL) isKoed;

-(BOOL) isReadyForTurn;

-(void) updateHealthByValue:(int)value;

-(void) updateAPByValue:(int)value;

-(void) updateTurnCounter;

-(void) beginPulse;

-(void) endPulse;

-(void) jumpTo:(CGPoint) newPosition;

-(void) jumpBack;

-(void) changeSprite:(NSString*) spriteName;

-(void) resetTurnCounter;

@end
