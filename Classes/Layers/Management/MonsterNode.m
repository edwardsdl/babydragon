//
//  MonsterNode.m
//  BabyDragon
//
//  Created by Eric Stenborg on 12/12/13.
//  Copyright 2013 First Light Games. All rights reserved.
//

#import "MonsterNode.h"


@implementation MonsterNode

+(MonsterNode*) Create
{
    //CGSize winSize = [[CCDirector sharedDirector] winSize];
    
    MonsterNode *node = [[MonsterNode alloc] initWithDimensions:CGSizeMake(260, 240)];
    node.visible = YES;
    return node;
}

-(void) showNewMonster:(MonsterData*) monster
{
    [self removeAllChildren];
    
    CCSprite* monsterSprite = [CCSprite spriteWithFile:[NSString stringWithFormat:@"%@_Standing.png", monster.type]];
    monsterSprite.scaleX = -1.0f;
    monsterSprite.position = ccp(-130 + 40, 120 - 40);
    [self addChild:monsterSprite];
    
    //Name
    [self addLabel:monster.name color:ccc3(255, 255, 255) position:ccp(((self->dimensions.width / 2)  * -1) + 10 + 85, (self->dimensions.height / 2) - 22) size:18 centerAnchor:NO];
    
    //Level
    [self addLabel:@"Level" color:ccc3(255, 255, 255) position:ccp(((self->dimensions.width / 2)  * -1) + 10 + 85, (self->dimensions.height / 2) - 38) size:14 centerAnchor:NO];
    
    //Level value
    [self addLabel:[NSString stringWithFormat:@"%d", monster.level] color:ccc3(255, 255, 255) position:ccp(((self->dimensions.width / 2)  * -1) + 75 + 85, (self->dimensions.height / 2) - 38) size:14 centerAnchor:NO];
    
    //Health
    [self addLabel:@"Health" color:ccc3(190, 255, 190) position:ccp(((self->dimensions.width / 2)  * -1) + 10 + 85, (self->dimensions.height / 2) - 54) size:14 centerAnchor:NO];
    
    //Health value
    [self addLabel:[NSString stringWithFormat:@"%d", monster.healthPoints] color:ccc3(190, 255, 190) position:ccp(((self->dimensions.width / 2)  * -1) + 75 + 85, (self->dimensions.height / 2) - 54) size:14 centerAnchor:NO];
    
    //Ability
    [self addLabel:@"Ability" color:ccc3(190, 190, 255) position:ccp(((self->dimensions.width / 2)  * -1) + 10 + 85, (self->dimensions.height / 2) - 70) size:14 centerAnchor:NO];
    
    //Ability value
    [self addLabel:[NSString stringWithFormat:@"%d", monster.abilityPoints] color:ccc3(190, 190, 255) position:ccp(((self->dimensions.width / 2)  * -1) + 75 + 85, (self->dimensions.height / 2) - 70) size:14 centerAnchor:NO];
    
    //Strength
    [self addLabel:@"Strength" color:ccc3(255, 255, 255) position:ccp(-130 + 3.5, 120 - 100) size:14 centerAnchor:NO];
    
    //Strength value
    [self addLabel:[NSString stringWithFormat:@"%i", (int)monster.strength] color:ccc3(255, 255, 255) position:ccp(-130 + 3.5 + 75, 120 - 100) size:14 centerAnchor:NO];
    
    //Defense
    [self addLabel:@"Defense" color:ccc3(255, 255, 255) position:ccp(-130 + 3.5, 120 - 100 - 16) size:14 centerAnchor:NO];
    
    //Defense value
    [self addLabel:[NSString stringWithFormat:@"%i", (int)monster.defense] color:ccc3(255, 255, 255) position:ccp(-130 + 3.5 + 75, 120 - 100 - 16) size:14 centerAnchor:NO];
    
    //Intellect
    [self addLabel:@"Intellect" color:ccc3(255, 255, 255) position:ccp(-130 + 3.5, 120 - 100 - (16*2)) size:14 centerAnchor:NO];
    
    //Intellect value
    [self addLabel:[NSString stringWithFormat:@"%i", (int)monster.intellect] color:ccc3(255, 255, 255) position:ccp(-130 + 3.5 + 75, 120 - 100 - (16*2)) size:14 centerAnchor:NO];
    
    //Willpower
    [self addLabel:@"Willpower" color:ccc3(255, 255, 255) position:ccp(-130 + 3.5, 120 - 100 - (16*3)) size:14 centerAnchor:NO];
    
    //Willpower value
    [self addLabel:[NSString stringWithFormat:@"%i", (int)monster.willpower] color:ccc3(255, 255, 255) position:ccp(-130 + 3.5 + 75, 120 - 100 - (16*3)) size:14 centerAnchor:NO];
    
    //Speed
    [self addLabel:@"Speed" color:ccc3(255, 255, 255) position:ccp(-130 + 3.5, 120 - 100 - (16*4)) size:14 centerAnchor:NO];
    
    //Speed value
    [self addLabel:[NSString stringWithFormat:@"%i", (int)monster.speed] color:ccc3(255, 255, 255) position:ccp(-130 + 3.5 + 75, 120 - 100 - (16*4)) size:14 centerAnchor:NO];
    
    //Courage
    [self addLabel:@"Courage" color:ccc3(255, 255, 255) position:ccp(-130 + 3.5, 120 - 100 - (16*5)) size:14 centerAnchor:NO];
    
    //Courage value
    [self addLabel:[NSString stringWithFormat:@"%i", (int)monster.courage] color:ccc3(255, 255, 255) position:ccp(-130 + 3.5 + 75, 120 - 100 - (16*5)) size:14 centerAnchor:NO];
}

@end
