//
//  StatusEffect.h
//  BabyDragon
//
//  Created by Eric Stenborg on 2/14/14.
//  Copyright (c) 2014 First Light Games. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StatusEffectType.h"
#import "CombatMonsterNode.h"

@interface StatusEffect : NSObject

@property (nonatomic, retain) NSString* name;

@property (nonatomic) StatusEffectType type;

@property (nonatomic) float value;

@property (nonatomic) int turnsRemaining;

@property (nonatomic) CombatMonsterNode* shieldTarget;

@end
