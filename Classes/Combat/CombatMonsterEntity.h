//
//  BattleMonster.h
//  BabyDragon
//
//  Created by Eric Stenborg on 9/15/13.
//  Copyright (c) 2013 First Light Games. All rights reserved.
//

#import "MonsterData.h"
#import "cocos2d.h"

@interface CombatMonsterEntity : NSObject
{
}

typedef NS_ENUM(NSInteger, Party) {
    PartyOne,
    PartyTwo
};

@property CGPoint position;

@property int zIndex;

@property int currentHealthPoints;

@property (nonatomic, retain) CCLayer *layer;

@property (nonatomic, retain) CCSprite *activeSprite;

@property (nonatomic, retain) CCSprite *standingSprite;

@property (nonatomic, retain) CCSprite *fightingSprite;

@property (nonatomic, retain) CCSprite *koSprite;

@property (nonatomic, retain) CCSprite *shadowSprite;

@property (nonatomic, retain) CCSprite *barsBackgroundSprite;

@property (nonatomic, retain) MonsterData *monsterData;

@property (nonatomic, retain) CCProgressTimer *healthBar;

@property (nonatomic, retain) CCProgressTimer *actionBar;

@property (nonatomic, retain) CCProgressTimer *turnBar;

@property (nonatomic) int turnCounter;

@property Party party;

-(id) initWithMonsterData:(MonsterData *) monsterData withIndex:(int) index andPosition: (CGPoint) position andLayer:(CCLayer *) layer inParty:(Party) party;

-(BOOL) isKoed;

-(void) updateHealthByValue:(int)value;

-(void) updateTurnCounter;

-(void) beginPulse;

-(void) endPulse;

-(NSString*) friendTypeName;

-(void) flipToStandingSprite;

-(void) flipToFightingSprite;

-(void) flipToKoSprite;

-(void) jumpToPosition: (CGPoint) newPosition over:(float) seconds runWhenComplete:(SEL) selector;

@end
