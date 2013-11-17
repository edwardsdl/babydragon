//
//  CombatMenuNode.h
//  BabyDragon
//
//  Created by Eric Stenborg on 11/12/13.
//  Copyright 2013 First Light Games. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "CombatMenuButtonNode.h"

@interface CombatMenuNode : CCNode
{
    CombatMenuButtonNode* fightButton;
    CombatMenuButtonNode* abilitiesButton;
    CombatMenuButtonNode* backpackButton;
};

@property BOOL isOpen;

@property BOOL isActive;

+(CombatMenuNode*) Create;

-(id) init;

-(void) openMenu;

-(void) closeMenu;

-(void) resetPositions;

-(void) buttonWasTouched:(CombatMenuButtonNode*) button;

@end
