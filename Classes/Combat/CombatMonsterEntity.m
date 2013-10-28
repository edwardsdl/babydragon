//
//  BattleMonster.m
//  BabyDragon
//
//  Created by Eric Stenborg on 9/15/13.
//  Copyright (c) 2013 First Light Games. All rights reserved.
//

#import "CombatMonsterEntity.h"
#import "MathHelpers.h"

@implementation CombatMonsterEntity

-(id) initWithMonsterData:(MonsterData *) monsterData withIndex:(int) index andPosition: (CGPoint) position andLayer:(CCLayer *) layer inParty:(Party) party
{
    if ((self = [super init]))
    {
        self.monsterData = monsterData;
        self.position = position;
        self.party = party;
        self.turnCounter = 0;
        self.layer = layer;
        
        self.currentHealthPoints = monsterData.healthPoints;
        
        //Determine z index from party index
        if (index == 0)
            self.zIndex = 50;
        else if (index == 1)
            self.zIndex = 30;
        else if (index == 2)
            self.zIndex = 70;
        
        //Create the standing sprite
        self.standingSprite = [CCSprite spriteWithFile:[NSString stringWithFormat:@"%@_Standing.png", monsterData.type]];
        self.standingSprite.position = position;
        [layer addChild:self.standingSprite z:self.zIndex];
        
        //Create the fighting sprite
        self.fightingSprite = [CCSprite spriteWithFile:[NSString stringWithFormat:@"%@_Fighting.png", monsterData.type]];
        self.fightingSprite.position = position;
        self.fightingSprite.visible = NO;
        [layer addChild:self.fightingSprite z:self.zIndex];
        
        //Create the KO sprite
        self.koSprite = [CCSprite spriteWithFile:[NSString stringWithFormat:@"%@_KO.png", monsterData.type]];
        self.koSprite.position = position;
        self.koSprite.visible = NO;
        [layer addChild:self.koSprite z:self.zIndex];
        
        //Default the active sprite to the standing sprite
        self.activeSprite = self.standingSprite;
        
        //Create the shadow sprite
        self.shadowSprite = [CCSprite spriteWithFile:@"MonsterShadow.png"];
        self.shadowSprite.position = ccp(position.x, position.y - 37.5);
        [layer addChild:self.shadowSprite z:self.zIndex - 1];
        
        //Flip sprites on party one
        if (self.party == PartyOne)
        {
            self.standingSprite.scaleX *= -1;
            self.fightingSprite.scaleX *= -1;
            self.koSprite.scaleX *= -1;
        }
        
        //Are these sprites translucent?
        if (monsterData.isTranslucent)
        {
            self.standingSprite.opacity = 150;
            self.fightingSprite.opacity = 150;
            self.koSprite.opacity = 150;
            self.shadowSprite.opacity = 150;
        }
        
        //Create the background for the HP, AP and turn bars
        self.barsBackgroundSprite = [CCSprite spriteWithFile:@"BarsBackground.png"];
        self.barsBackgroundSprite.position = ccp(position.x, position.y - 40);
        [layer addChild:self.barsBackgroundSprite z:self.zIndex + 1];
        self.barsBackgroundSprite.opacity = 150;
        
        //Setup health bar
        self.healthBar = [CCProgressTimer progressWithSprite:[CCSprite spriteWithFile:@"HealthBarFull.png"]];
        self.healthBar.type = kCCProgressTimerTypeBar;
        self.healthBar.midpoint = ccp(0, 0);
        self.healthBar.barChangeRate = ccp(1, 0);
        self.healthBar.percentage = 100;
        self.healthBar.position = ccp(self.position.x, self.position.y - 36.5);
        [layer addChild:self.healthBar z:self.zIndex + 2];
        
        //Setup action bar
        self.actionBar = [CCProgressTimer progressWithSprite:[CCSprite spriteWithFile:@"ActionBarFull.png"]];
        self.actionBar.type = kCCProgressTimerTypeBar;
        self.actionBar.midpoint = ccp(0, 0);
        self.actionBar.barChangeRate = ccp(1, 0);
        self.actionBar.percentage = 100;
        self.actionBar.position = ccp(self.position.x, self.position.y - 41);
        [layer addChild:self.actionBar z:self.zIndex + 2];
        
        //Setup turn bar
        self.turnBar = [CCProgressTimer progressWithSprite:[CCSprite spriteWithFile:@"TurnBarFull.png"]];
        self.turnBar.type = kCCProgressTimerTypeBar;
        self.turnBar.midpoint = ccp(0, 0);
        self.turnBar.barChangeRate = ccp(1, 0);
        self.turnBar.percentage = 0;
        self.turnBar.position = ccp(self.position.x, self.position.y - 44.5);
        [layer addChild:self.turnBar z:self.zIndex + 2];
    }
    
    return self;
}

-(BOOL) isKoed
{
    if (self.currentHealthPoints <= 0)
        return YES;
    else
        return NO;
}

-(void) updateHealthByValue:(int)value
{
    self.currentHealthPoints += value;
    
    if (self.currentHealthPoints < 0)
        self.currentHealthPoints = 0;
    
    if (self.currentHealthPoints > self.monsterData.healthPoints)
        self.currentHealthPoints = self.monsterData.healthPoints;
    
    if ([self isKoed])
    {
        self.standingSprite.visible = NO;
        self.koSprite.visible = YES;
        self.turnCounter = 0;
    }
    
    self.healthBar.percentage = ((float)self.currentHealthPoints / self.monsterData.healthPoints) * 100.0f;
}

-(void) updateTurnCounter
{
    //Increment the turn counter by the monster speed
    self.turnCounter += self.monsterData.speed;
    
    //Update the turn bar
    self.turnBar.percentage = (self.turnCounter / 1000.0f) * 100.0f;
}

-(void) beginPulse
{
    CCTintTo *tintIn = [CCTintTo actionWithDuration:0.5 red:80 green:80 blue:80];
    CCTintTo *tintOut = [CCTintTo actionWithDuration:0.5 red:255 green:255 blue:255];
    CCSequence *pulseSequence = [CCSequence actionOne:tintIn two:tintOut];
    CCRepeatForever *repeat = [CCRepeatForever actionWithAction:pulseSequence];
    [self.standingSprite runAction:repeat];
}

-(void) endPulse
{
    self.standingSprite.color = ccc3(255, 255, 255);
    [self.standingSprite stopAllActions];
}

-(NSString*) friendTypeName
{
    return [self.monsterData.type stringByReplacingOccurrencesOfString:@"_" withString:@" "];
}

-(void) flipToStandingSprite
{
    self.standingSprite.position = self.position;
    self.standingSprite.visible = YES;
    self.activeSprite = self.standingSprite;
    self.fightingSprite.visible = NO;
    self.koSprite.visible = NO;
}

-(void) flipToFightingSprite
{
    self.fightingSprite.position = self.position;
    self.fightingSprite.visible = YES;
    self.activeSprite = self.fightingSprite;
    self.standingSprite.visible = NO;
    self.koSprite.visible = NO;
}

-(void) flipToKoSprite
{
    self.koSprite.position = self.position;
    self.koSprite.visible = YES;
    self.activeSprite = self.koSprite;
    self.fightingSprite.visible = NO;
    self.standingSprite.visible = NO;
}

-(void) jumpToPosition: (CGPoint) newPosition over:(float) seconds runWhenComplete:(SEL) selector
{
    //Setup a bezier curve to take the monster to the new position
    ccBezierConfig bezier;
    bezier.endPosition = newPosition;
    float angle = atan2(((self.position.x - bezier.endPosition.x) * -1.0f), (self.position.y - bezier.endPosition.y));
    if (newPosition.x < self.position.x)
        angle += [MathHelpers degreesToRadians:180.0f];
    CGPoint midpoint = [MathHelpers calcMidpointOfLinrWithPointOone:self.position andPointTwp:bezier.endPosition];
    bezier.controlPoint_1 = ccp(midpoint.x + (40 * cos(angle)), midpoint.y + (40 * sin(angle)));
    bezier.controlPoint_2 = bezier.controlPoint_1;
    
    //Move and scale the shadow
    CCMoveTo *shadowMoveTo = [CCMoveTo actionWithDuration:seconds position:ccp(newPosition.x, newPosition.y - 37.5)];
    CCCallBlock *shadowScale = [CCCallBlock actionWithBlock:^{
        CCScaleTo *shadowScaleDown = [CCScaleTo actionWithDuration:seconds/2.0f scale:0.3];
        CCScaleTo *shadowScaleUp = [CCScaleTo actionWithDuration:seconds/2 scale:1.0];
        CCSequence *scaleSequence = [CCSequence actions:shadowScaleDown, shadowScaleUp, nil];
        [self.shadowSprite runAction:scaleSequence];
    }];
    [self.shadowSprite runAction:[CCSequence actions:shadowScale, shadowMoveTo, nil]];
    
    //Setup and run the sequence
    CCBezierTo *bezierTo = [CCBezierTo actionWithDuration:seconds bezier:bezier];
    CCCallBlock *runSelector = [CCCallBlock actionWithBlock:^{ [self.layer performSelector:selector]; }];
    [self.activeSprite runAction:[CCSequence actions: bezierTo, runSelector, nil]];
    
    
    
    //Keep position up to date
    self.position = newPosition;
}

@end
