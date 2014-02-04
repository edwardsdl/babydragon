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
        
        //Create the combat info node
        self->combatInfo = [CombatInfoNode Create];
        self->combatInfo.position = ccp(self->winSize.width/2, (self->winSize.height/2) + 90);
        [self addChild:self->combatInfo];
        
        //Create the combat menu node
        self->combatMenu = [CombatMenuNode Create];
        self->combatMenu.position = ccp(self->winSize.width/2 - 112.5, (self->winSize.height/2) + (90 - 37.5 - 5));
        [self addChild:self->combatMenu];
        
        //Create the combat status node
        self->combatStatus = [CombatStatusNode Create];
        self->combatStatus.position = ccp(self->winSize.width/2, (self->winSize.height/2) - 120);
        [self addChild:self->combatStatus];
        
        //Create the confirm button
        self->combatConfirm = [CombatConfirmNode Create];
        self->combatConfirm.position = ccp(self->winSize.width / 2, self->winSize.height / 2);
        [self addChild:self->combatConfirm];
        
        //Create the hit sprite
        self->hitSprite = [CCSprite spriteWithFile:@"HIt.png"];
        self->hitSprite.visible = NO;
        [self addChild:self->hitSprite];
        
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
    //If either team is KOed then end the combat
    if ([self checkForAllKo:1] || [self checkForAllKo:2])
        [self endCombat];
    
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
        //Nothing to do but wait...
    }
}

-(void) chooseNextMonsterToTakeTurn
{
    if ([self->monstersReadyForTurn count] == 0)
        return;
    
    self->infoMonster = nil;
    
    //Pick a random index/monster - TODO use courage to determine
    NSUInteger randomIndex = arc4random() % [self->monstersReadyForTurn count];
    self->activeMonster = [self->monstersReadyForTurn objectAtIndex:randomIndex];
    
    //Begin the monsters turn if it's not KO'ed (its turn could have come up, then been KO'ed so this is possible)
    if (self->activeMonster.isKoed == NO)
    {
        //If the monster is in party one then the player is going to take action
        if ([self isMonster:self->activeMonster inParty:1])
        {
            [self->combatMenu resetPositions];
            [self setNewInfoMonster:self->activeMonster];
            
            //Tell the combat menu about the the new abilities list
            [self->combatMenu loadAbilities:self->activeMonster.monsterData];
            
            //Update the state
            self->state = PlayerSelectingAction;
        }
        //Otherwise the AI will take action
        else
        {
            self->targetMonster = [self->monsters objectAtIndex:0];
            if ([self->targetMonster isKoed])
                self->targetMonster = [self->monsters objectAtIndex:1];
            if ([self->targetMonster isKoed])
                self->targetMonster = [self->monsters objectAtIndex:2];
            
            [self runFight];
            [self->activeMonster resetTurnCounter];
        }
    }
    
    //Remove this monster from the array now
    [self->monstersReadyForTurn removeObject:self->activeMonster];
}

-(void) beginFight
{
    //Close up the menu and the info panel
    self->combatInfo.visible = false;
    [self->combatMenu closeMenu];
    [self->infoMonster endPulse];
    
    //Show a status message
    [self->combatStatus openAndShowLabel:[NSString stringWithFormat:@"Tap a monster for %@ to fight...", self->activeMonster.monsterData.name]];
    
    //Store that the player selected fight
    self->actionSelected = Fight;
    
    //Update the state
    self->state = PlayerSelectingEnemy;
}

-(void) beginAbility:(AbilityData*) ability
{
    //Close up the menu and the info panel
    self->combatInfo.visible = false;
    [self->combatMenu closeMenu];
    [self->infoMonster endPulse];
    
    //Show a status message
    [self->combatStatus openAndShowLabel:[NSString stringWithFormat:@"Select a target for %@", ability.name]];
    
    //Store that the player selected ability, and which ability is being used
    self->actionSelected = Ability;
    self->abilityInUse = ability;
    
    //Update the state
    if (ability.targetType == TargetTypeSingleHostile)
        self->state = PlayerSelectingEnemy;
    else if (ability.targetType == TargetTypeSingleFriendly)
        self->state = PlayerSelectingAlly;
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
    if (self->state == PlayerSelectingEnemy)
    {
        if ([self isMonster:monster inParty:2] && [monster isKoed] == NO)
        {
            [self setNewInfoMonster:monster];
            
            //Update the target monster
            self->targetMonster = monster;
            
            //Show the confirm button
            self->combatConfirm.visible = YES;
        }
    }
    if (self->state == PlayerSelectingAlly)
    {
        if ([self isMonster:monster inParty:1] && [monster isKoed] == NO)
        {
            [self setNewInfoMonster:monster];
            
            //Update the target monster
            self->targetMonster = monster;
            
            //Show the confirm button
            self->combatConfirm.visible = YES;
        }
    }
}

-(void) confirmWasTouched
{
    if (self->state == PlayerSelectingEnemy || self->state == PlayerSelectingAlly)
    {
        //Close up UI elements
        self->combatInfo.visible = NO;
        [self->combatStatus close];
        self->combatConfirm.visible = NO;
        [self->targetMonster endPulse];
        
        //Reset counter
        [self->activeMonster resetTurnCounter];
        
        if (self->actionSelected == Fight)
        {
            [self runFight];
        }
        else if (self->actionSelected == Ability)
        {
            [self runAbility];
        }
    }
}

//-----------------------------------------------------------------------
// Action Methods
//-----------------------------------------------------------------------

-(void) runFight
{
    self->state = ActionInProgress;
    
    //Setup a sequence to perform the fight
    CCCallBlock* jumpOut = [CCCallBlock actionWithBlock:^
    {
        [self->activeMonster changeSprite:@"Fighting"];
        [self->activeMonster jumpTo:ccp(self->winSize.width / 2, self->winSize.height / 2)];
    }];
    
    CCDelayTime *delay1 = [CCDelayTime actionWithDuration:0.3f];
    
    CCCallBlock *assignDamage = [CCCallBlock actionWithBlock:^
    {
        int damage = [CombatHelper CalculateFightDamageWithAttacker:self->activeMonster.monsterData andDefender:self->targetMonster.monsterData];
        if (damage > 0)
        {
            [self->targetMonster updateHealthByValue:damage * -1];
            [self->combatStatus openAndShowLabel:[NSString stringWithFormat:@"%@ hit %@ for %d damage", self->activeMonster.monsterData.name, self->targetMonster.monsterData.name, damage]];
            [self showHitSprite:self->targetMonster.position];
            [self sendUpText:[NSString stringWithFormat:@"%d", damage] position:self->targetMonster.position color:ccc3(255, 255, 255)];
        }
        else
        {
            [self->combatStatus openAndShowLabel:@"Missed!"];
            [self sendUpText:@"Miss!" position:self->targetMonster.position color:ccc3(255, 255, 255)];
        }
    }];
    
    CCDelayTime *delay2 = [CCDelayTime actionWithDuration:1.25f];
    
    CCCallBlock* jumpBack = [CCCallBlock actionWithBlock:^
    {
        [self->activeMonster jumpBack];
        [self hideHitSprite];
        [self->combatStatus close];
    }];
    
    CCDelayTime *delay3 = [CCDelayTime actionWithDuration:0.3f];
    
    CCCallBlock *resumeProcessingTurns = [CCCallBlock actionWithBlock:^
    {
        [self->activeMonster changeSprite:@"Standing"];
        [self->activeMonster updateTurnCounter];
        self->state = ProcessingTurns;
    }];
    
    CCSequence* fightSequence = [CCSequence actions:jumpOut, delay1, assignDamage, delay2, jumpBack, delay3, resumeProcessingTurns, nil];
    [self runAction:fightSequence];
}

-(void) runAbility
{
    self->state = ActionInProgress;
    
    //Setup a sequence to perform the ability
    CCCallBlock* jumpOut = [CCCallBlock actionWithBlock:^
    {
        [self->activeMonster changeSprite:@"Fighting"];
        [self->activeMonster jumpTo:ccp(self->winSize.width / 2, self->winSize.height / 2)];
    }];
    
    CCDelayTime *delay1 = [CCDelayTime actionWithDuration:0.3f];
    
    CCCallBlock *performAbility = [CCCallBlock actionWithBlock:^
    {
        switch (self->abilityInUse.effectType)
        {
            case EffectTypeAttack:
            {
                int damage = [CombatHelper CalculateAttackAbilityDamageWithAbility:self->abilityInUse AndAttacker:self->activeMonster.monsterData andDefender:self->targetMonster.monsterData];
                if (damage > 0)
                {
                    [self->targetMonster updateHealthByValue:damage * -1];
                    [self->combatStatus openAndShowLabel:[NSString stringWithFormat:@"%@ hit %@ for %d damage", self->activeMonster.monsterData.name, self->targetMonster.monsterData.name, damage]];
                    [self showHitSprite:self->targetMonster.position];
                    [self sendUpText:[NSString stringWithFormat:@"%d", damage] position:self->targetMonster.position color:ccc3(255, 255, 255)];
                }
                else
                {
                    [self->combatStatus openAndShowLabel:@"Missed!"];
                    [self sendUpText:@"Miss!" position:self->targetMonster.position color:ccc3(255, 255, 255)];
                }
                break;
            }
            case EffectTypeGroupAttack:
                break;
            case EffectTypeDamageOverTime:
                break;
            case EffectTypeShield:
                break;
            case EffectTypeCure:
                break;
            case EffectTypeGroupCure:
                break;
            case EffectTypeRevive:
                break;
            case EffectTypeAlterSpeed:
                break;
            case EffectTypeAlterCourage:
                break;
            case EffectTypeAlterPower:
                break;
            case EffectTypeAlterDefense:
                break;
            case EffectTypeAlterWillpower:
                break;
        }
        
        /*
        AbilityResult* result = [CombatHelper RunAbility:self->abilityInUse ofMonster:self->activeMonster onMonster:self->targetMonster];
        
        if (result.effectType == Damage)
        {
            [self->targetMonster updateHealthByValue:result.value * -1];
            [self sendUpNumbers:result.value position:self->targetMonster.position color:ccc3(255, 255, 255)];
            [self showHitSprite:self->targetMonster.position];
        }
        else if (result.effectType == Heal)
        {
            [self->targetMonster updateHealthByValue:result.value];
            [self sendUpNumbers:result.value position:self->targetMonster.position color:ccc3(150, 255, 150)];
        }

        [self->combatStatus openAndShowLabel:result.statusText];
         */
        
        //Substract AP
        [self->activeMonster updateAPByValue:abilityInUse.apCost * -1];
    }];
    
    CCDelayTime *delay2 = [CCDelayTime actionWithDuration:1.25f];
    
    CCCallBlock* jumpBack = [CCCallBlock actionWithBlock:^
    {
        [self->activeMonster jumpBack];
        [self hideHitSprite];
        [self->combatStatus close];
    }];
    
    CCDelayTime *delay3 = [CCDelayTime actionWithDuration:0.3f];
    
    CCCallBlock *resumeProcessingTurns = [CCCallBlock actionWithBlock:^
    {
        [self->activeMonster changeSprite:@"Standing"];
        [self->activeMonster updateTurnCounter];
        self->state = ProcessingTurns;
    }];
    
    CCSequence* fightSequence = [CCSequence actions:jumpOut, delay1, performAbility, delay2, jumpBack, delay3, resumeProcessingTurns, nil];
    [self runAction:fightSequence];
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
    //Same monster, no change
    if (monster == self->infoMonster)
        return;
    
    //Stop any monster pulse
    if (self->infoMonster != nil)
        [self->infoMonster endPulse];
    
    //Show this monster's info first
    self->infoMonster = monster;
    
    //Show the combat info menu
    self->combatInfo.visible = true;
    [self->combatInfo showInfoForMonster:self->infoMonster];
    
    //Show the combat menu?
    if (self->infoMonster == self->activeMonster && self->state != PlayerSelectingAlly)
        [self->combatMenu openMenu];
    else
        [self->combatMenu closeMenu];
    
    //Pulse the new info monster
    [self->infoMonster beginPulse];
}

-(void) showHitSprite:(CGPoint) position
{
    self->hitSprite.position = position;
    self->hitSprite.visible = YES;
}

-(void) hideHitSprite
{
    self->hitSprite.visible = NO;
}

-(void) sendUpText:(NSString*) text position:(CGPoint) position color:(ccColor3B) color
{
    CCLabelTTF *numbersLabel = [CCLabelTTF labelWithString:text fontName:@"Georgia" fontSize:14];
    numbersLabel.color = color;
    numbersLabel.position = position;
    [self addChild:numbersLabel z:100];
    
    CCLabelTTF *numbersLabelShadow = [CCLabelTTF labelWithString:text fontName:@"Georgia" fontSize:14];
    numbersLabelShadow.color = ccc3(0, 0, 0);
    numbersLabelShadow.position = ccp(position.x + 1, position.y -1);
    [self addChild:numbersLabelShadow z:99];
    
    ccBezierConfig bezier;
    bezier.endPosition = position;
    bezier.controlPoint_1 = ccp(position.x, position.y + 25);
    bezier.controlPoint_2 = bezier.controlPoint_1;
    CCBezierTo *bezierJump = [CCBezierTo actionWithDuration:0.5 bezier:bezier];
    
    ccBezierConfig bezierShadow;
    bezierShadow.endPosition = ccp(position.x + 1, position.y -1);
    bezierShadow.controlPoint_1 = ccp(bezierShadow.endPosition.x, bezierShadow.endPosition.y + 25);
    bezierShadow.controlPoint_2 = bezier.controlPoint_1;
    CCBezierTo *bezierJumpShadow = [CCBezierTo actionWithDuration:0.5 bezier:bezierShadow];
    
    CCDelayTime *delay = [CCDelayTime actionWithDuration:0.75];
    
    CCCallBlock *removeNumbers = [CCCallBlock actionWithBlock:^{ [self removeChild:numbersLabel]; [self removeChild:numbersLabelShadow]; }];
    
    CCSequence *sequence = [CCSequence actions:bezierJump, delay, removeNumbers, nil];
    [numbersLabel runAction:sequence];

    [numbersLabelShadow runAction:bezierJumpShadow];
}

-(BOOL) checkForAllKo:(int) partyNumber
{
    if (partyNumber == 1)
        return ((CombatMonsterNode*)[self->monsters objectAtIndex:0]).isKoed && ((CombatMonsterNode*)[self->monsters objectAtIndex:1]).isKoed && ((CombatMonsterNode*)[self->monsters objectAtIndex:2]).isKoed;
    else
        return ((CombatMonsterNode*)[self->monsters objectAtIndex:3]).isKoed && ((CombatMonsterNode*)[self->monsters objectAtIndex:4]).isKoed && ((CombatMonsterNode*)[self->monsters objectAtIndex:5]).isKoed;
}

-(void) endCombat
{
    [self pauseSchedulerAndActions];
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.5 scene:[MapLayer scene] ]];
}

@end
