//
//  CombatHelper.h
//  BabyDragon
//
//  Created by Eric Stenborg on 9/30/13.
//  Copyright (c) 2013 First Light Games. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CombatMonsterNode.h"
#import "AbilityData.h"
#import "AbilityResult.h"

@interface CombatHelper : NSObject

+(int) CalculatePhysicalDamageWithAttacker:(CombatMonsterNode*) attacker andDefender:(CombatMonsterNode*) defender andMultiplier:(float) multiplier;

+(int) CalculateFightDamageWithAttacker:(CombatMonsterNode*) attacker andDefender:(CombatMonsterNode*) defender;

+(AbilityResult*) RunAbility:(AbilityData*) ability ofMonster:(CombatMonsterNode*) owner onMonster:(CombatMonsterNode*) target;

+(int) GetXpNeededForLevel:(int) level;

@end
