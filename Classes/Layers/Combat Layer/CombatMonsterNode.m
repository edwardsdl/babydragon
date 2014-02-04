//
//  CombatMonsterNode.m
//  BabyDragon
//
//  Created by Eric Stenborg on 11/7/13.
//  Copyright 2013 First Light Games. All rights reserved.
//

#import "CombatMonsterNode.h"
#import "CombatLayer.h"

@class CombatLayer;
@implementation CombatMonsterNode

-(id) init:(MonsterData*) data partyNumber:(int) partyNum
{
    if( (self=[super init]))
    {
        float yBarBorderOffset = -40.0;
        float yBarSpacing = -5.5;
        self->yShadowOffset = -33;
        
        self.monsterData = data;
        self.partyNumber = partyNum;
        self.currentHealthPoints = self.monsterData.healthPoints;
        self.currentAbilityPoints = self.monsterData.abilityPoints;
        
        //Draw the shadow sprite
        self->shadowSprite = [CCSprite spriteWithFile:@"MonsterShadow.png"];
        self->shadowSprite.position = ccp(0, yShadowOffset);
        if (self.monsterData.isTranslucent)
            self->shadowSprite.opacity = 90;
        else
            self->shadowSprite.opacity = 150;
        self->shadowSprite.scale = 1.1f;
        [self addChild:self->shadowSprite];
        
        //Draw the monster sprite
        self->monsterSprite = [CCSprite spriteWithFile:[NSString stringWithFormat:@"%@_Standing.png", self.monsterData.type]];
        if (self.partyNumber == 1)
            self->monsterSprite.scaleX *= -1;
        if (self.monsterData.isTranslucent)
            self->monsterSprite.opacity = 200;
        [self addChild:self->monsterSprite];
        
        //Draw the health bar
        self->healthBar = [CCProgressTimer progressWithSprite:[CCSprite spriteWithFile:@"HealthBarFull.png"]];
        self->healthBar.type = kCCProgressTimerTypeBar;
        self->healthBar.midpoint = ccp(0, 0);
        self->healthBar.barChangeRate = ccp(1, 0);
        self->healthBar.percentage = 100;
        self->healthBar.position = ccp(0, yBarBorderOffset);
        [self addChild:self->healthBar];
        
        //Draw the action bar
        self->actionBar = [CCProgressTimer progressWithSprite:[CCSprite spriteWithFile:@"ActionBarFull.png"]];
        self->actionBar.type = kCCProgressTimerTypeBar;
        self->actionBar.midpoint = ccp(0, 0);
        self->actionBar.barChangeRate = ccp(1, 0);
        self->actionBar.percentage = 100;
        self->actionBar.position = ccp(0, yBarBorderOffset + yBarSpacing);
        [self addChild:self->actionBar];
        
        //Draw the turn bar
        self->turnBar = [CCProgressTimer progressWithSprite:[CCSprite spriteWithFile:@"TurnBarFull.png"]];
        self->turnBar.type = kCCProgressTimerTypeBar;
        self->turnBar.midpoint = ccp(0, 0);
        self->turnBar.barChangeRate = ccp(1, 0);
        self->turnBar.percentage = 100;
        self->turnBar.position = ccp(0, yBarBorderOffset + (yBarSpacing * 2));
        [self addChild:self->turnBar];
        
        //Draw the bar border sprites
        CCSprite *barBackgroundSprite = [CCSprite spriteWithFile:@"BarBackground.png"];
        barBackgroundSprite.position = ccp(0, yBarBorderOffset);
        [self addChild:barBackgroundSprite];
        
        barBackgroundSprite = [CCSprite spriteWithFile:@"BarBackground.png"];
        barBackgroundSprite.position = ccp(0, yBarBorderOffset + yBarSpacing);
        [self addChild:barBackgroundSprite];
        
        barBackgroundSprite = [CCSprite spriteWithFile:@"BarBackground.png"];
        barBackgroundSprite.position = ccp(0, yBarBorderOffset + (yBarSpacing * 2));
        [self addChild:barBackgroundSprite];
    }
    return self;
}

- (void)onEnter
{
    [[[CCDirector sharedDirector] touchDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
    [super onEnter];
}
- (void)onExit
{
    [[[CCDirector sharedDirector] touchDispatcher] removeDelegate:self];
    [super onExit];
}

-(BOOL) isKoed
{
    if (self.currentHealthPoints <= 0)
        return YES;
    else
        return NO;
}

-(BOOL) isReadyForTurn
{
    if (self->turnCounter >= 1000)
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
        [self changeSprite:@"KO"];
        
        [self setTurnCounter:0];
    }
    
    self->healthBar.percentage = ((float)self.currentHealthPoints / self.monsterData.healthPoints) * 100.0f;
}

-(void) updateAPByValue:(int)value
{
    self.currentAbilityPoints += value;
    
    if (self.currentAbilityPoints < 0)
        self.currentAbilityPoints = 0;
    
    if (self.currentAbilityPoints > self.monsterData.abilityPoints)
        self.currentAbilityPoints = self.monsterData.abilityPoints;
    
    self->actionBar.percentage = ((float)self.currentAbilityPoints / self.monsterData.abilityPoints) * 100.0f;
}

-(void) updateTurnCounter
{
    //Increment the turn counter by the monster speed
    [self setTurnCounter:self->turnCounter + self.monsterData.speed];
    
    //Don't let the counter go over 1000
    if (self->turnCounter > 1000)
    {
        self->turnCounter = 1000;
    }
}

-(void) setTurnCounter:(int) newValue
{
    self->turnCounter = newValue;
    
    //Update the turn bar
    self->turnBar.percentage = (self->turnCounter / 1000.0f) * 100.0f;
}

-(void) resetTurnCounter
{
    self->turnCounter = 0;
    self->turnBar.percentage = 0;
}

-(void) beginPulse
{
    CCTintTo *tintIn = [CCTintTo actionWithDuration:0.5 red:80 green:80 blue:80];
    CCTintTo *tintOut = [CCTintTo actionWithDuration:0.5 red:255 green:255 blue:255];
    CCSequence *pulseSequence = [CCSequence actionOne:tintIn two:tintOut];
    CCRepeatForever *repeat = [CCRepeatForever actionWithAction:pulseSequence];
    [self->monsterSprite runAction:repeat];
}

-(void) endPulse
{
    self->monsterSprite.color = ccc3(255, 255, 255);
    [self->monsterSprite stopAllActions];
}

-(void) jumpTo:(CGPoint) newPosition
{
    //Convert to node space
    newPosition = [self convertToNodeSpace:newPosition];
    
    //Setup bezier curve
    ccBezierConfig bezierTo;
    bezierTo.endPosition = newPosition;
    
    //Determine bezier control points
    float angle = atan2(((self->monsterSprite.position.x - bezierTo.endPosition.x) * -1.0f), (self->monsterSprite.position.y - bezierTo.endPosition.y));
    if (self.partyNumber == 2)
        angle += [MathHelpers degreesToRadians:180.0f];
    CGPoint midpoint = [MathHelpers calcMidpointOfLinrWithPointOone:self->monsterSprite.position andPointTwp:bezierTo.endPosition];
    bezierTo.controlPoint_1 = ccp(midpoint.x + (40 * cos(angle)), midpoint.y + (40 * sin(angle)));
    bezierTo.controlPoint_2 = bezierTo.controlPoint_1;
    
    //Run the bezier movement
    [self->monsterSprite runAction:[CCBezierTo actionWithDuration:0.3 bezier:bezierTo]];
    
    //Also move the shadow
    [self->shadowSprite runAction:[CCMoveTo actionWithDuration:0.3 position:ccp(newPosition.x, newPosition.y + self->yShadowOffset)]];
}

-(void) jumpBack
{
    //Setup bezier curve
    ccBezierConfig bezierTo;
    bezierTo.endPosition = ccp(0, 0);
    
    //Determine bezier control points
    float angle = atan2(((self->monsterSprite.position.x - bezierTo.endPosition.x) * -1.0f), (self->monsterSprite.position.y - bezierTo.endPosition.y));
    if (self.partyNumber == 1)
        angle += [MathHelpers degreesToRadians:180.0f];
    CGPoint midpoint = [MathHelpers calcMidpointOfLinrWithPointOone:self->monsterSprite.position andPointTwp:bezierTo.endPosition];
    bezierTo.controlPoint_1 = ccp(midpoint.x + (40 * cos(angle)), midpoint.y + (40 * sin(angle)));
    bezierTo.controlPoint_2 = bezierTo.controlPoint_1;
    
    //Run the bezier movement
    [self->monsterSprite runAction:[CCBezierTo actionWithDuration:0.3 bezier:bezierTo]];
    
    //Also move the shadow
    [self->shadowSprite runAction:[CCMoveTo actionWithDuration:0.3 position:ccp(0, self->yShadowOffset)]];
}

-(void) changeSprite:(NSString*) spriteName
{
    CCTexture2D* tex = [[CCTextureCache sharedTextureCache] addImage:[NSString stringWithFormat:@"%@_%@.png", self.monsterData.type, spriteName]];
    [self->monsterSprite setTexture: tex];
}

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    //Get touch position
    CGPoint position = [self convertTouchToNodeSpace:touch];
    
    //Ignore if not in the bounding box of the monster sprite
    if (CGRectContainsPoint(self->monsterSprite.boundingBox, position))
    {
        CombatLayer* parentLayer = (CombatLayer*)self.parent;
        [parentLayer monsterWasTouched:self];
        
        return YES;
    }
    
    return NO;
}

@end
