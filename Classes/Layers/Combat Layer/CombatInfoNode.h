//
//  CombatInfoNode.h
//  BabyDragon
//
//  Created by Eric Stenborg on 11/10/13.
//  Copyright 2013 First Light Games. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "FLMenu.h"
#import "CombatMonsterNode.h"

@interface CombatInfoNode : FLMenu
{
    CombatMonsterNode* currentMonster;
};

+(CombatInfoNode*) Create;

-(void) showInfoForMonster:(CombatMonsterNode*) monster;

@end
