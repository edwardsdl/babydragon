//
//  CombatLayer.h
//  BabyDragon
//
//  Created by Eric Stenborg on 11/7/13.
//  Copyright 2013 First Light Games. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "PartyData.h"
#import "CombatMonsterNode.h"
#import "CombatInfoNode.h"
#import "CombatMenuNode.h"
#import "CombatStatusNode.h"
#import "CombatConfirmNode.h"
#import "CombatHelper.h"
#import "MainMenuLayer.h"

typedef NS_ENUM(NSInteger, CombatState) {
    TurnCounting,
    ProcessingTurns,
    PlayerSelectingAction,
    PlayerSelectingEnemy,
    ActionInProgress
};

typedef NS_ENUM(NSInteger, ActionSelected) {
    Fight
};

@interface CombatLayer : CCLayer
{
    CGSize winSize;
    
    NSMutableArray *monsters;
    NSMutableArray *monstersReadyForTurn;
    
    CombatMonsterNode *activeMonster;
    CombatMonsterNode *infoMonster;
    CombatMonsterNode *targetMonster;
    
    CombatState state;
    ActionSelected actionSelected;
    
    CCSprite* hitSprite;
    
    CombatInfoNode *combatInfo;
    CombatMenuNode *combatMenu;
    CombatStatusNode *combatStatus;
    CombatConfirmNode *combatConfirm;
}

+(CCScene *) sceneWithPartyOne:(PartyData*) party1 andPartyTwo:(PartyData*) party2 withBackgroundNamed:(NSString*) backgroundName;

-(id) initWithPartyOne:(PartyData*) party1 andPartyTwo:(PartyData*) party2 withBackgroundNamed:(NSString*) backgroundName;

-(void) beginPlayerSelectingEnemy;

-(void) monsterWasTouched:(CombatMonsterNode*) monster;

-(void) confirmWasTouched;

@end
