//
//  MyCocos2DClass.m
//  BabyDragon
//
//  Created by Eric Stenborg on 9/9/13.
//  Copyright 2013 First Light Games. All rights reserved.
//

#import "OldCombatLayer.h"
#import "PartyData.h"
#import "MonsterData.h"
#import "CombatMonsterEntity.h"
#import "Player.h"
#import "MathHelpers.h"
#import "MainMenuLayer.h"
#import "CombatHelper.h"
#import "AbilityData.h"
#import "AbilityResult.h"
#import "TargetType.h"


@implementation OldCombatLayer

+(CCScene *) sceneWithPartyOne:(PartyData*) party1 andPartyTwo:(PartyData*) party2 withBackgroundNamed:(NSString*) backgroundName
{
	CCScene *scene = [CCScene node];
	OldCombatLayer *layer = [[OldCombatLayer alloc] initWithPartyOne: party1 andPartyTwo: party2 withBackgroundNamed:backgroundName];
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
        
        // ask director for the window size
        self.winSize = [[CCDirector sharedDirector] winSize];
        
        //Create and display the background
        CCSprite *backgroundSprite = [CCSprite spriteWithFile:[NSString stringWithFormat:@"BattleBackground_%@.png", backgroundName]];
        backgroundSprite.position = ccp(self.winSize.width/2, self.winSize.height/2);
        [self addChild:backgroundSprite z:0];
        
        //Create the party arrays
        self.partyOneMonsters = [NSMutableArray array];
        if ([party1.monsters count] > 0)
            [self addMonster:[party1.monsters.allObjects objectAtIndex:0] toParty:self.partyOneMonsters];
        if ([party1.monsters count] > 1)
            [self addMonster:[party1.monsters.allObjects objectAtIndex:1] toParty:self.partyOneMonsters];
        if ([party1.monsters count] > 2)
            [self addMonster:[party1.monsters.allObjects objectAtIndex:2] toParty:self.partyOneMonsters];
        
        self.partyTwoMonsters = [NSMutableArray array];
        if ([party2.monsters count] > 0)
            [self addMonster:[party2.monsters.allObjects objectAtIndex:0] toParty:self.partyTwoMonsters];
        if ([party2.monsters count] > 1)
            [self addMonster:[party2.monsters.allObjects objectAtIndex:1] toParty:self.partyTwoMonsters];
        if ([party2.monsters count] > 2)
            [self addMonster:[party2.monsters.allObjects objectAtIndex:2] toParty:self.partyTwoMonsters];
        
        //Setup the combat menu
        self.combatMenu = [[OldCombatMenu alloc] initWithLayer:self fightSelector:@selector(performFightAction) abilitySelector:@selector(performAbilityWithIndex:)];
        
        //Setup state info
        self.state = TurnCounting;
        self.monstersReadyForTurn = [NSMutableArray array];
        
        //Setup the status bar
        self.statusBarBackgroundSprite = [CCSprite spriteWithFile:@"StatusBarBackground.png"];
        self.statusBarBackgroundSprite.position = ccp(self.winSize.width / 2, self.winSize.height - (37.5 / 2));
        [self addChild:self.statusBarBackgroundSprite z:10];
        
        self.statusBarLabel = [CCLabelTTF labelWithString:@"" fontName:@"Arial Rounded MT Bold" fontSize:16];
        self.statusBarLabel.color = ccc3(0, 0, 0);
        self.statusBarLabel.position = ccp(self.winSize.width / 2, self.winSize.height - (37.5 / 2));
        [self addChild:self.statusBarLabel z:15];
        
        //Determine the jump to attack position
        self.attackPosition = ccp(self.winSize.width / 2, (self.winSize.height / 2) - (37.5 / 2));
        
        //Create misc sprite
        self.hitSprite = [CCSprite spriteWithFile:@"HIt.png"];
        self.hitSprite.visible = NO;
        [self addChild:self.hitSprite z:95];
        
        //Begin the game loop
        [self schedule:@selector(update:) interval:0];
        
        [self resumeSchedulerAndActions];
    }
    
    return self;
}

-(void) addMonster:(MonsterData*) monsterData toParty:(NSMutableArray*) partyArray
{
    int yOffset = 15;
    
    //Determine positioning based on battle index
    CGPoint position = ccp(0, 0);
    if (partyArray == self.partyOneMonsters && [partyArray count] == 0)
        position = ccp(60, (self.winSize.height / 2) - yOffset);
    else if (partyArray == self.partyOneMonsters && [partyArray count] == 1)
        position = ccp(60, ((self.winSize.height / 2) + 85) - yOffset);
    else if (partyArray == self.partyOneMonsters && [partyArray count] == 2)
        position = ccp(60, ((self.winSize.height / 2) - 85) - yOffset);
    else if (partyArray == self.partyTwoMonsters && [partyArray count] == 0)
        position = ccp(self.winSize.width - 60, (self.winSize.height / 2) - yOffset);
    else if (partyArray == self.partyTwoMonsters && [partyArray count] == 1)
        position = ccp(self.winSize.width - 60, ((self.winSize.height / 2) + 85) - yOffset);
    else if (partyArray == self.partyTwoMonsters && [partyArray count] == 2)
        position = ccp(self.winSize.width - 60, ((self.winSize.height / 2) - 85) - yOffset);
    
    //Create the entity and add to the correct party array
    Party party = PartyOne;
    if (partyArray == self.partyTwoMonsters)
        party = PartyTwo;
    CombatMonsterEntity *combatMonsterEntity =
        [[CombatMonsterEntity alloc] initWithMonsterData:monsterData withIndex:[partyArray count] andPosition:position andLayer:self inParty:party];
    [partyArray addObject:combatMonsterEntity];
}

//-----------------------------------------------------------------------
// Update Methods
//-----------------------------------------------------------------------

-(void) update:(ccTime)dt
{
    if ([self checkForAllKo:self.partyOneMonsters] || [self checkForAllKo:self.partyTwoMonsters])
        [self endCombat];
    
    if (self.state == TurnCounting)
    {
        [self updatePartyMonsters:self.partyOneMonsters];
        [self updatePartyMonsters:self.partyTwoMonsters];
    }
    else if (self.state == CheckIfMonsterReadyForTurn)
    {
        //If there are no monsters who can take a turn then return to turn counting
        if ([self.monstersReadyForTurn count] == 0)
        {
            self.state = TurnCounting;
            return;
        }
        
        [self chooseMonsterToTakeTurn];
    }
}

-(void) updatePartyMonsters:(NSMutableArray*) partyMonsters
{
    //Iterate through all the monsters and add to all turn counters
    for (CombatMonsterEntity *combatMonsterEntity in partyMonsters)
        if (combatMonsterEntity.isKoed == NO)
        {
            [self updateMonsterTurnCounter:combatMonsterEntity];
        }
}

-(BOOL) checkForAllKo:(NSMutableArray*) partyMonsters
{
    BOOL allKoed = YES;
    
    //Iterate through all the monsters and add to all turn counters
    for (CombatMonsterEntity *combatMonsterEntity in partyMonsters)
        if (combatMonsterEntity.isKoed == NO)
        {
            allKoed = NO;
        }
    
    return allKoed;
}

-(void) updateMonsterTurnCounter:(CombatMonsterEntity*) combatMonsterEntity
{
    [combatMonsterEntity updateTurnCounter];
    
    if (combatMonsterEntity.turnCounter >= 1000)
    {
        //Reset counter
        combatMonsterEntity.turnCounter = 0;
        
        //Add this monster to the list of monsters who can go now
        [self.monstersReadyForTurn addObject:combatMonsterEntity];
        
        //Change to the next state
        self.state = CheckIfMonsterReadyForTurn;
    }
}

-(void) chooseMonsterToTakeTurn
{
    if ([self.monstersReadyForTurn count] == 0)
        return;
    
    //Pick a random index/monster
    NSUInteger randomIndex = arc4random() % [self.monstersReadyForTurn count];
    self.activeMonster = [self.monstersReadyForTurn objectAtIndex:randomIndex];
    
    //Begin the monsters turn if it's not KO'ed (its turn could have come up, then been KO'ed so this is possible)
    if (self.activeMonster.isKoed == NO)
    {
        //If the monster is in party one then the player is going to take action
        if ([self.partyOneMonsters containsObject:self.activeMonster])
        {
            //Show the combat menu
            [self.combatMenu openMenu:self.activeMonster.monsterData];
            
            //Begin the pulse on the active monster
            [self.activeMonster beginPulse];
            
            //Update the state
            self.state = MonsterSelectAction;
    
        }
        //Otherwise the AI will take action
        else
        {
            self.targetMonster = [self.partyOneMonsters objectAtIndex:0];
            if ([self.targetMonster isKoed])
                self.targetMonster = [self.partyOneMonsters objectAtIndex:1];
            if ([self.targetMonster isKoed])
                self.targetMonster = [self.partyOneMonsters objectAtIndex:2];
            
            [self completeFightAction];
        }
    }
    
    //Remove this monster from the array now
    [self.monstersReadyForTurn removeObject:self.activeMonster];
}

//-----------------------------------------------------------------------
// Touch Input Methods
//-----------------------------------------------------------------------

-(void) ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint position = [self convertTouchToNodeSpace:touch];
    
    //Throw the touch over to the combat menu always
    [self.combatMenu handleTouch:position];
    
    if (self.state == MonsterSelectingTarget)
    {
        for (CombatMonsterEntity *combatMonsterEntity in self.partyTwoMonsters)
        {
            if (combatMonsterEntity.isKoed == NO && CGRectContainsPoint(combatMonsterEntity.standingSprite.boundingBox, position))
            {
                self.targetMonster = combatMonsterEntity;
                [self performSelector:[self callAfterTouch]];
            }
        }
    }
    else if (self.state == MonsterSelectingFriendlyTarget)
    {
        for (CombatMonsterEntity *combatMonsterEntity in self.partyOneMonsters)
        {
            if (combatMonsterEntity.isKoed == NO && CGRectContainsPoint(combatMonsterEntity.standingSprite.boundingBox, position))
            {
                self.targetMonster = combatMonsterEntity;
                [self performSelector:[self callAfterTouch]];
            }
        }
    }
}

//-----------------------------------------------------------------------
// Action Methods
//-----------------------------------------------------------------------

-(void) performFightAction
{
    //Hide combat menu
    [self.combatMenu closeMenu];
    
    //Set the state to selecting target
    self.state = MonsterSelectingTarget;
    
    //Update the status bar
    [self updateStatusBarText:@"Tap a monster to fight..."];
    
    //Set a selector to call once the target monster is grabbed
    self.callAfterTouch = @selector(completeFightAction);
}

-(void) completeFightAction
{
    self.state = ActionInProgress;
    
    //Turn off the sprite pulse
    [self.activeMonster endPulse];
    
    //Clear the status bar
    [self updateStatusBarText:@""];
    
    //Setup bezier curves
    ccBezierConfig bezierTo;
    bezierTo.endPosition = self.attackPosition;
    
    ccBezierConfig bezierBack;
    bezierBack.endPosition = self.activeMonster.position;
    
    //Determine bezier control points
    float angle = atan2(((bezierBack.endPosition.x - bezierTo.endPosition.x) * -1.0f), (bezierBack.endPosition.y - bezierTo.endPosition.y));
    if (self.activeMonster.party == PartyTwo)
        angle += [MathHelpers degreesToRadians:180.0f];
    CGPoint midpoint = [MathHelpers calcMidpointOfLinrWithPointOone:bezierBack.endPosition andPointTwp:bezierTo.endPosition];
    bezierTo.controlPoint_1 = ccp(midpoint.x + (40 * cos(angle)), midpoint.y + (40 * sin(angle)));
    bezierBack.controlPoint_1 = bezierTo.controlPoint_1;
    bezierTo.controlPoint_2 = bezierTo.controlPoint_1;
    bezierBack.controlPoint_2 = bezierTo.controlPoint_1;
    
    //Setup a sequence to jump out, assign damage, and jump back
    CCCallBlock *showFightSprite = [CCCallBlock actionWithBlock:^{
        self.activeMonster.standingSprite.visible = NO;
        self.activeMonster.fightingSprite.visible = YES;
    }];
    CCBezierTo *moveToCenter = [CCBezierTo actionWithDuration:0.3 bezier:bezierTo];
    CCCallBlock *assignDamage = [CCCallBlock actionWithBlock:^{
        int damage = [CombatHelper CalculateFightDamageWithAttacker:self.activeMonster andDefender:self.targetMonster];
        [self.targetMonster updateHealthByValue:damage * -1];
        [self updateStatusBarText:[NSString stringWithFormat:@"%@ hit %@ for %d damage", self.activeMonster.friendTypeName, self.targetMonster.friendTypeName, damage]];
        self.hitSprite.position = self.targetMonster.position;
        self.hitSprite.visible = YES;
        [self sendUpNumbers:damage position:self.targetMonster.position color:ccc3(255, 255, 255)];
        [self.activeMonster updateTurnCounter];
    }];
    CCDelayTime *delay = [CCDelayTime actionWithDuration:1.0f];
    CCCallBlock *hideHitSprite = [CCCallBlock actionWithBlock:^{ self.hitSprite.visible = NO; }];
    CCBezierTo *moveBack = [CCBezierTo actionWithDuration:0.3 bezier:bezierBack];
    CCCallBlock *endTurn = [CCCallBlock actionWithBlock:^ { [self endActiveMonsterTurn]; }];
    CCCallBlock *backToStanding = [CCCallBlock actionWithBlock:^{
        self.activeMonster.standingSprite.visible = YES;
        self.activeMonster.fightingSprite.visible = NO;
        [self updateStatusBarText:@""];
    }];
    
    //Setup a sequence for the shadow to follow
    CGPoint shadowStartPosition = self.activeMonster.shadowSprite.position;
    CCMoveTo *shadowMoveToCenter = [CCMoveTo actionWithDuration:0.3 position:ccp(self.attackPosition.x, self.attackPosition.y - 37.5)];
    CCCallBlock *shadowScaleDown = [CCCallBlock actionWithBlock:^{
        CCScaleTo *shadowScaleDown = [CCScaleTo actionWithDuration:0.15 scale:0.3];
        CCScaleTo *shadowScaleUp = [CCScaleTo actionWithDuration:0.15 scale:1.0];
        CCSequence *scaleSequence = [CCSequence actions:shadowScaleDown, shadowScaleUp, nil];
        [self.activeMonster.shadowSprite runAction:scaleSequence];
    }];
    CCDelayTime *shadowDelay = [CCDelayTime actionWithDuration:1.0];
    CCMoveTo *shadowMoveBack = [CCMoveTo actionWithDuration:0.3 position:shadowStartPosition];
    CCCallBlock *shadowScaleUp = [CCCallBlock actionWithBlock:^{
        CCScaleTo *shadowScaleDown = [CCScaleTo actionWithDuration:0.15 scale:0.3];
        CCScaleTo *shadowScaleUp = [CCScaleTo actionWithDuration:0.15 scale:1.0];
        CCSequence *scaleSequence = [CCSequence actions:shadowScaleDown, shadowScaleUp, nil];
        [self.activeMonster.shadowSprite runAction:scaleSequence];
    }];
    
    //Run the sequence;
    CCSequence *fightSequence = [CCSequence actions: showFightSprite, moveToCenter, assignDamage, delay, hideHitSprite, moveBack, endTurn, backToStanding, nil];
    [self.activeMonster.fightingSprite runAction:fightSequence];
    CCSequence *shadowSequence = [CCSequence actions: shadowScaleDown, shadowMoveToCenter, shadowDelay, shadowScaleUp, shadowMoveBack, nil];
    [self.activeMonster.shadowSprite runAction:shadowSequence];
}

-(void) performAbilityWithIndex:(int) index
{
    //Get selected ability
    self.selectedAbility = [self.activeMonster.monsterData.abilities objectAtIndex:index];
    
    //Hide combat menu
    [self.combatMenu closeMenu];
    
    //Set the state to selecting target
    if (self.selectedAbility.targetType == SingleHostile)
        self.state = MonsterSelectingTarget;
    else if (self.selectedAbility.targetType == SingleFriendly)
        self.state = MonsterSelectingFriendlyTarget;
    
    //Update the status bar
    [self updateStatusBarText:[NSString stringWithFormat:@"Tap a monster to use %@ on...", self.selectedAbility.name]];
    
    //Set a selector to call once the target monster is grabbed
    self.callAfterTouch = @selector(completeAbilityAction);
}

-(void) completeAbilityAction
{
    self.state = ActionInProgress;
    
    [self.activeMonster endPulse];
    
    //Setup bezier curves
    ccBezierConfig bezierTo;
    bezierTo.endPosition = self.attackPosition;
    
    ccBezierConfig bezierBack;
    bezierBack.endPosition = self.activeMonster.position;
    
    //Determine bezier control points
    float angle = atan2(((bezierBack.endPosition.x - bezierTo.endPosition.x) * -1.0f), (bezierBack.endPosition.y - bezierTo.endPosition.y));
    if (self.activeMonster.party == PartyTwo)
        angle += [MathHelpers degreesToRadians:180.0f];
    CGPoint midpoint = [MathHelpers calcMidpointOfLinrWithPointOone:bezierBack.endPosition andPointTwp:bezierTo.endPosition];
    bezierTo.controlPoint_1 = ccp(midpoint.x + (40 * cos(angle)), midpoint.y + (40 * sin(angle)));
    bezierBack.controlPoint_1 = bezierTo.controlPoint_1;
    bezierTo.controlPoint_2 = bezierTo.controlPoint_1;
    bezierBack.controlPoint_2 = bezierTo.controlPoint_1;
    
    //Setup a sequence to jump out, assign damage, and jump back
    CCCallBlock *showFightSprite = [CCCallBlock actionWithBlock:^{
        self.activeMonster.standingSprite.visible = NO;
        self.activeMonster.fightingSprite.visible = YES;
    }];
    CCBezierTo *moveToCenter = [CCBezierTo actionWithDuration:0.3 bezier:bezierTo];
    CCCallBlock *runAbility = [CCCallBlock actionWithBlock:^{
        AbilityResult *result = [CombatHelper RunAbility:self.selectedAbility ofMonster:self.activeMonster onMonster:self.targetMonster];
        if (result.effectType == Damage)
        {
            [self.targetMonster updateHealthByValue:result.value * -1];
            [self sendUpNumbers:result.value position:self.targetMonster.position color:ccc3(255, 255, 255)];
        }
        else if (result.effectType == Heal)
        {
            [self.targetMonster updateHealthByValue:result.value];
            [self sendUpNumbers:result.value position:self.targetMonster.position color:ccc3(150, 255, 150)];
        }
        [self.activeMonster updateTurnCounter];
    }];
    CCDelayTime *delay = [CCDelayTime actionWithDuration:1.0f];
    CCBezierTo *moveBack = [CCBezierTo actionWithDuration:0.3 bezier:bezierBack];
    CCCallBlock *endTurn = [CCCallBlock actionWithBlock:^ { [self endActiveMonsterTurn]; }];
    CCCallBlock *backToStanding = [CCCallBlock actionWithBlock:^{
        self.activeMonster.standingSprite.visible = YES;
        self.activeMonster.fightingSprite.visible = NO;
        [self updateStatusBarText:@""];
    }];
    
    //Setup a sequence for the shadow to follow
    CGPoint shadowStartPosition = self.activeMonster.shadowSprite.position;
    CCMoveTo *shadowMoveToCenter = [CCMoveTo actionWithDuration:0.3 position:ccp(self.attackPosition.x, self.attackPosition.y - 37.5)];
    CCCallBlock *shadowScaleDown = [CCCallBlock actionWithBlock:^{
        CCScaleTo *shadowScaleDown = [CCScaleTo actionWithDuration:0.15 scale:0.3];
        CCScaleTo *shadowScaleUp = [CCScaleTo actionWithDuration:0.15 scale:1.0];
        CCSequence *scaleSequence = [CCSequence actions:shadowScaleDown, shadowScaleUp, nil];
        [self.activeMonster.shadowSprite runAction:scaleSequence];
    }];
    CCDelayTime *shadowDelay = [CCDelayTime actionWithDuration:1.0];
    CCMoveTo *shadowMoveBack = [CCMoveTo actionWithDuration:0.3 position:shadowStartPosition];
    CCCallBlock *shadowScaleUp = [CCCallBlock actionWithBlock:^{
        CCScaleTo *shadowScaleDown = [CCScaleTo actionWithDuration:0.15 scale:0.3];
        CCScaleTo *shadowScaleUp = [CCScaleTo actionWithDuration:0.15 scale:1.0];
        CCSequence *scaleSequence = [CCSequence actions:shadowScaleDown, shadowScaleUp, nil];
        [self.activeMonster.shadowSprite runAction:scaleSequence];
    }];
    
    //Run the sequence;
    CCSequence *fightSequence = [CCSequence actions: showFightSprite, moveToCenter, runAbility, delay, moveBack, endTurn, backToStanding, nil];
    [self.activeMonster.fightingSprite runAction:fightSequence];
    CCSequence *shadowSequence = [CCSequence actions: shadowScaleDown, shadowMoveToCenter, shadowDelay, shadowScaleUp, shadowMoveBack, nil];
    [self.activeMonster.shadowSprite runAction:shadowSequence];
}

-(void) sendUpNumbers:(int) value position:(CGPoint) position color:(ccColor3B) color
{
    CCLabelTTF *numbersLabel = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%d", value] fontName:@"Arial Rounded MT Bold" fontSize:14];
    numbersLabel.color = color;
    numbersLabel.position = position;
    [self addChild:numbersLabel z:100];
    
    ccBezierConfig bezier;
    bezier.endPosition = position;
    bezier.controlPoint_1 = ccp(position.x, position.y + 25);
    bezier.controlPoint_2 = bezier.controlPoint_1;
    CCBezierTo *bezierJump = [CCBezierTo actionWithDuration:0.5 bezier:bezier];
    
    CCDelayTime *delay = [CCDelayTime actionWithDuration:0.5];
    
    CCCallBlock *removeNumbers = [CCCallBlock actionWithBlock:^{ [self removeChild:numbersLabel]; }];
    
    CCSequence *sequence = [CCSequence actions:bezierJump, delay, removeNumbers, nil];
    [numbersLabel runAction:sequence];
}

-(void) endActiveMonsterTurn
{
    //Return to the checking if other monsters are ready state
    self.state = CheckIfMonsterReadyForTurn;
}

-(void) doNothing
{
    
}

//-----------------------------------------------------------------------
// Misc Utility
//-----------------------------------------------------------------------

-(void) updateStatusBarText:(NSString*) text
{
    self.statusBarLabel.string = text;
}

-(void) endCombat
{
    [self pauseSchedulerAndActions];
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.5 scene:[MainMenuLayer scene] ]];
}

@end
