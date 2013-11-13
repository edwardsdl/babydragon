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
    CombatInfoNode *node = [[CombatInfoNode alloc] initWithDimensions:CGSizeMake(225, 250)];
    node.visible = NO;
    return node;
}

-(void) showInfoForMonster:(CombatMonsterNode*) monster
{
    [self removeAllChildren];
    //NSLog([NSString stringWithFormat:@"%lu",(unsigned long)[self.children count]]);
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
    [self addLabel:self->currentMonster.monsterData.name color:ccc3(255, 255, 255) position:ccp(((self->dimensions.width / 2)  * -1) + 10 + iconFrameSprite.boundingBox.size.width, (self->dimensions.height / 2) - 22) size:18];
    
    //Health
    [self addLabel:@"Health" color:ccc3(175, 255, 175) position:ccp(((self->dimensions.width / 2)  * -1) + 10 + iconFrameSprite.boundingBox.size.width, (self->dimensions.height / 2) - 40) size:14];
    
    //Health value
    [self addLabel:[NSString stringWithFormat:@"%d / %d", self->currentMonster.currentHealthPoints, self->currentMonster.monsterData.healthPoints] color:ccc3(175, 255, 175) position:ccp(((self->dimensions.width / 2)  * -1) + 75 + iconFrameSprite.boundingBox.size.width, (self->dimensions.height / 2) - 40) size:14];
    
    //Ability
    [self addLabel:@"Action" color:ccc3(175, 175, 255) position:ccp(((self->dimensions.width / 2)  * -1) + 10 + iconFrameSprite.boundingBox.size.width, (self->dimensions.height / 2) - 56) size:14];
    
    //Ability value
    [self addLabel:[NSString stringWithFormat:@"%d / %d", self->currentMonster.currentAbilityPoints, self->currentMonster.monsterData.abilityPoints] color:ccc3(175, 175, 255) position:ccp(((self->dimensions.width / 2)  * -1) + 75 + iconFrameSprite.boundingBox.size.width, (self->dimensions.height / 2) - 56) size:14];
}



@end
