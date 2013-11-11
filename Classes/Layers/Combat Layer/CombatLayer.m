//
//  CombatLayer.m
//  BabyDragon
//
//  Created by Eric Stenborg on 11/7/13.
//  Copyright 2013 First Light Games. All rights reserved.
//

#import "CombatLayer.h"


@implementation CombatLayer

+(CCScene *) sceneWithPartyOne:(PartyData*) party1 andPartyTwo:(PartyData*) party2 withBackgroundNamed:(NSString*) backgroundName
{
	CCScene *scene = [CCScene node];
	CombatLayer *layer = [[CombatLayer alloc] initWithPartyOne: party1 andPartyTwo: party2 withBackgroundNamed:backgroundName];
	[scene addChild: layer];
	return scene;
}

//-----------------------------------------------------------------------
// Initialization Methods
//-----------------------------------------------------------------------

-(id) initWithPartyOne:(PartyData*) party1 andPartyTwo:(PartyData*) party2 withBackgroundNamed:(NSString*) backgroundName
{
    if( (self=[super init]))
    {
        self.touchEnabled = true;
        
        //Store the window size
        self->winSize = [[CCDirector sharedDirector] winSize];
        
        //Create and display the background
        CCSprite *backgroundSprite = [CCSprite spriteWithFile:[NSString stringWithFormat:@"BattleBackground_%@.png", backgroundName]];
        backgroundSprite.position = ccp(self->winSize.width/2, self->winSize.height/2);
        [self addChild:backgroundSprite z:0];
        
        //Create the monster nodes
        self->monsters = [NSMutableArray array];
        self->monstersReadyForTurn = [NSMutableArray array];
        for (MonsterData *monsterData in party1.monsters)
            [self createMonsterNode:monsterData monsterIndex:[[party1.monsters allObjects] indexOfObject:monsterData] partyNumber:1];
        
        for (MonsterData *monsterData in party2.monsters)
            [self createMonsterNode:monsterData monsterIndex:[[party2.monsters allObjects] indexOfObject:monsterData] partyNumber:2];
        
        //Create and hide the combat info node
        self->combatInfo = [CombatInfoNode Create];
        self->combatInfo.position = ccp(self->winSize.width/2, self->winSize.height/2);
        [self addChild:self->combatInfo];
        
        //Begin a game loop
        [self schedule:@selector(update:) interval:0];
        self->state = TurnCounting;
    }
    
    return self;
}

-(void) createMonsterNode:(MonsterData*) monsterData monsterIndex:(int) index partyNumber:(int) partyNumber
{
    //Create the entity and add to the correct party array
    CombatMonsterNode *monsterNode = [[CombatMonsterNode alloc] init:monsterData partyNumber:partyNumber];
    [self addChild:monsterNode];
    
    //Add the new node to the monsters array
    [self->monsters addObject:monsterNode];
    
    
    float xDistanceFromEdge = 45.0;
    float yDistanceFromEdge = 65.0;
    
    //Determine positioning based on battle index
    if (index == 0 && partyNumber == 1)
        monsterNode.position = ccp(xDistanceFromEdge, self->winSize.height - yDistanceFromEdge);
    else if (index == 1 && partyNumber == 1)
        monsterNode.position = ccp(xDistanceFromEdge, self->winSize.height / 2);
    else if (index == 2 && partyNumber == 1)
        monsterNode.position = ccp(xDistanceFromEdge, yDistanceFromEdge);
    else if (index == 0 && partyNumber == 2)
        monsterNode.position = ccp(self->winSize.width - xDistanceFromEdge, self->winSize.height - yDistanceFromEdge);
    else if (index == 1 && partyNumber == 2)
        monsterNode.position = ccp(self->winSize.width - xDistanceFromEdge, self->winSize.height / 2);
    else if (index == 2 && partyNumber == 2)
        monsterNode.position = ccp(self->winSize.width - xDistanceFromEdge, yDistanceFromEdge);
}

//-----------------------------------------------------------------------
// Update Methods
//-----------------------------------------------------------------------

-(void) update:(ccTime)dt
{
    //TurnCounting - adding to each monsters turn counter
    if (self->state == TurnCounting)
    {
        //Update the turn counter for each monster as long as the monster is not KOed
        for(CombatMonsterNode *monster in self->monsters)
        {
            if ([monster isKoed] == false)
            {
                [monster updateTurnCounter];
                
                if ([monster isReadyForTurn])
                {
                    //Reset counter
                    [monster resetTurnCounter];
                    
                    //Add this monster to the list of monsters who are ready for turn
                    [self->monstersReadyForTurn addObject:monster];
                    
                    //Change to the next state to process monster turns
                    self->state = ProcessingTurns;
                }
            }
        }
    }
    //ProcessingTurns - one or more monsters is ready to go
    else if (self->state == ProcessingTurns)
    {
        //If there are no more monsters who can take a turn then return to turn counting
        if ([self->monstersReadyForTurn count] == 0)
        {
            self->state = TurnCounting;
            return;
        }
        
        [self chooseNextMonsterToTakeTurn];
    }
    //PlayerSelectingAction - poke monsters for info and choose action for active monster
    else if (self->state == PlayerSelectingAction)
    {
        
    }
}

-(void) chooseNextMonsterToTakeTurn
{
    if ([self->monstersReadyForTurn count] == 0)
        return;
    
    //Pick a random index/monster - TODO use courage to determine
    NSUInteger randomIndex = arc4random() % [self->monstersReadyForTurn count];
    self->activeMonster = [self->monstersReadyForTurn objectAtIndex:randomIndex];
    
    //Begin the monsters turn if it's not KO'ed (its turn could have come up, then been KO'ed so this is possible)
    if (self->activeMonster.isKoed == NO)
    {
        //If the monster is in party one then the player is going to take action
        if ([self isMonster:self->activeMonster inParty:1])
        {
            [self setNewInfoMonster:self->activeMonster];
            
            //Update the state
            self->state = PlayerSelectingAction;
        }
        //Otherwise the AI will take action
        else
        {
            /*self.targetMonster = [self.partyOneMonsters objectAtIndex:0];
            if ([self.targetMonster isKoed])
                self.targetMonster = [self.partyOneMonsters objectAtIndex:1];
            if ([self.targetMonster isKoed])
                self.targetMonster = [self.partyOneMonsters objectAtIndex:2];
            
            [self completeFightAction];*/
        }
    }
    
    //Remove this monster from the array now
    [self->monstersReadyForTurn removeObject:self->activeMonster];
}

//-----------------------------------------------------------------------
// Input Methods
//-----------------------------------------------------------------------

-(void) monsterWasTouched:(CombatMonsterNode*) monster
{
    if (self->state == PlayerSelectingAction)
    {
        [self setNewInfoMonster:monster];
    }
}

//-----------------------------------------------------------------------
// Utility Methods
//-----------------------------------------------------------------------

-(BOOL) isMonster:(CombatMonsterNode*) monster inParty:(int) partyNumber
{
    BOOL isInPartyOne;
    
    isInPartyOne = [self->monsters indexOfObject:monster] <= 2;
    
    if (partyNumber == 1)
        return isInPartyOne;
    else
        return !isInPartyOne;
}

-(void) setNewInfoMonster:(CombatMonsterNode*) monster
{
    //Stop any monster pulse
    if (self->infoMonster != nil)
        [self->infoMonster endPulse];
    
    //Show this monster's info first
    self->infoMonster = monster;
    
    //Show the combat info menu
    self->combatInfo.visible = true;
    [self->combatInfo showInfoForMonster:self->infoMonster];
    
    //Pulse the new info monster
    [self->infoMonster beginPulse];
}

@end
