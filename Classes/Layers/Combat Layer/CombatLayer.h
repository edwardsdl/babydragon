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

typedef NS_ENUM(NSInteger, CombatState) {
    TurnCounting,
    ProcessingTurns,
    PlayerSelectingAction
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
    
    CombatInfoNode *combatInfo;
}

+(CCScene *) sceneWithPartyOne:(PartyData*) party1 andPartyTwo:(PartyData*) party2 withBackgroundNamed:(NSString*) backgroundName;

-(id) initWithPartyOne:(PartyData*) party1 andPartyTwo:(PartyData*) party2 withBackgroundNamed:(NSString*) backgroundName;

-(void) monsterWasTouched:(CombatMonsterNode*) monster;

@end
