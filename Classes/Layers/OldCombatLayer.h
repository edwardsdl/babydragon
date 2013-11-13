//
//  MyCocos2DClass.h
//  BabyDragon
//
//  Created by Eric Stenborg on 9/9/13.
//  Copyright 2013 First Light Games. All rights reserved.
//

#import "cocos2d.h"
#import "PartyData.h"
#import "MonsterData.h"
#import "CombatMonsterEntity.h"
#import "FLRadialMenu.h"
#import "OldCombatMenu.h"
#import "AbilityData.h"

@interface OldCombatLayer : CCLayer

typedef NS_ENUM(NSInteger, CombatState) {
    TurnCounting,
    CheckIfMonsterReadyForTurn,
    MonsterSelectAction,
    MonsterSelectingTarget,
    MonsterSelectingFriendlyTarget,
    ActionInProgress
};

@property CGSize winSize;

//@property (nonatomic, retain) NSMutableDictionary *monstersInCombat;

@property (nonatomic, retain) NSMutableArray *partyOneMonsters;

@property (nonatomic, retain) NSMutableArray *partyTwoMonsters;

@property CombatState state;

@property SEL callAfterTouch;

@property (nonatomic, retain) NSMutableArray *monstersReadyForTurn;

@property (nonatomic, retain) CombatMonsterEntity *activeMonster;

@property (nonatomic, retain) CombatMonsterEntity *targetMonster;

@property (nonatomic, retain) AbilityData *selectedAbility;

@property (nonatomic, retain) OldCombatMenu *combatMenu;

@property (nonatomic, retain) CCSprite *statusBarBackgroundSprite;

@property (nonatomic, retain) CCLabelTTF *statusBarLabel;

@property (nonatomic, retain) CCSprite *hitSprite;

@property CGPoint attackPosition;

+(CCScene *) sceneWithPartyOne:(PartyData*) party1 andPartyTwo:(PartyData*) party2 withBackgroundNamed:(NSString*) backgroundName;

-(id) initWithPartyOne:(PartyData*) party1 andPartyTwo:(PartyData*) party2 withBackgroundNamed:(NSString*) backgroundName;

@end
