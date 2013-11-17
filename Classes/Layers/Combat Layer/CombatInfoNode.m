//
//  CombatInfoNode.m
//  BabyDragon
//
//  Created by Eric Stenborg on 11/10/13.
//  Copyright 2013 First Light Games. All rights reserved.
//

#import "CombatInfoNode.h"


@implementation CombatInfoNode

+(CombatInfoNode*) Create
{
    CombatInfoNode *node = [[CombatInfoNode alloc] initWithDimensions:CGSizeMake(225, 75)];
    node.visible = NO;
    return node;
}

-(void) showInfoForMonster:(CombatMonsterNode*) monster
{
    [self removeAllChildren];
    self->currentMonster = monster;
    
    //Show the icon frame
    CCSprite* iconFrameSprite = [CCSprite spriteWithFile:@"IconFrame.png"];
    iconFrameSprite.position = ccp(((self->dimensions.width / 2)  * -1) + 22, (self->dimensions.height / 2) - 22);
    [self addChild:iconFrameSprite];
    
    //Show the monster's standing sprite in the top left
    CCSprite* monsterSprite = [CCSprite spriteWithFile:[NSString stringWithFormat:@"%@_Standing.png", self->currentMonster.monsterData.type]];
    monsterSprite.scaleY = 0.45f;
    monsterSprite.scaleX = -0.45f;
    monsterSprite.position = ccp(((self->dimensions.width / 2)  * -1) + 22, (self->dimensions.height / 2) - 22);
    [self addChild:monsterSprite];
    
    //Name
    [self addLabel:self->currentMonster.monsterData.name color:ccc3(255, 255, 255) position:ccp(((self->dimensions.width / 2)  * -1) + 10 + iconFrameSprite.boundingBox.size.width, (self->dimensions.height / 2) - 22) size:18 centerAnchor:NO];
    
    //Level
    [self addLabel:@"Level" color:ccc3(255, 255, 255) position:ccp(((self->dimensions.width / 2)  * -1) + 10 + iconFrameSprite.boundingBox.size.width, (self->dimensions.height / 2) - 38) size:14 centerAnchor:NO];
    
    //Level value
    [self addLabel:[NSString stringWithFormat:@"%d", self->currentMonster.monsterData.level] color:ccc3(255, 255, 255) position:ccp(((self->dimensions.width / 2)  * -1) + 75 + iconFrameSprite.boundingBox.size.width, (self->dimensions.height / 2) - 38) size:14 centerAnchor:NO];
    
    //Health
    [self addLabel:@"Health" color:ccc3(190, 255, 190) position:ccp(((self->dimensions.width / 2)  * -1) + 10 + iconFrameSprite.boundingBox.size.width, (self->dimensions.height / 2) - 54) size:14 centerAnchor:NO];
    
    //Health value
    [self addLabel:[NSString stringWithFormat:@"%d / %d", self->currentMonster.currentHealthPoints, self->currentMonster.monsterData.healthPoints] color:ccc3(190, 255, 190) position:ccp(((self->dimensions.width / 2)  * -1) + 75 + iconFrameSprite.boundingBox.size.width, (self->dimensions.height / 2) - 54) size:14 centerAnchor:NO];
    
    //Ability
    [self addLabel:@"Ability" color:ccc3(190, 190, 255) position:ccp(((self->dimensions.width / 2)  * -1) + 10 + iconFrameSprite.boundingBox.size.width, (self->dimensions.height / 2) - 70) size:14 centerAnchor:NO];
    
    //Ability value
    [self addLabel:[NSString stringWithFormat:@"%d / %d", self->currentMonster.currentAbilityPoints, self->currentMonster.monsterData.abilityPoints] color:ccc3(190, 190, 255) position:ccp(((self->dimensions.width / 2)  * -1) + 75 + iconFrameSprite.boundingBox.size.width, (self->dimensions.height / 2) - 70) size:14 centerAnchor:NO];
}



@end
