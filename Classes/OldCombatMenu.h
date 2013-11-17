//
//  CombatMenu.h
//  BabyDragon
//
//  Created by Eric Stenborg on 10/4/13.
//  Copyright (c) 2013 First Light Games. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCSprite.h"
#import "CCLayer.h"
#import "MonsterData.h"

@interface OldCombatMenu : NSObject

@property (nonatomic, retain) NSArray *tier1Buttons;

@property (nonatomic, retain) NSArray *abilityButtons;

@property (nonatomic, retain) NSArray *backpackButtons;

@property CGPoint startingPosition;

@property BOOL isOpen;

@property BOOL isAbilitiesOpen;

@property BOOL isBackpackOpen;

-(id) initWithLayer:(CCLayer*) parentLayer fightSelector:(SEL) fightSelector abilitySelector:(SEL) abilitySelector;

-(void) openMenu:(MonsterData*) monsterData;

-(void) closeMenu;

-(void) handleTouch:(CGPoint) position;

@end
