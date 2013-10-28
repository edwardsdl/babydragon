//
//  CombatHelper.h
//  BabyDragon
//
//  Created by Eric Stenborg on 9/30/13.
//  Copyright (c) 2013 First Light Games. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CombatMonsterEntity.h"
#import "AbilityData.h"
#import "AbilityResult.h"

@interface CombatHelper : NSObject

+(int) CalculatePhysicalDamageWithAttacker:(CombatMonsterEntity*) attacker andDefender:(CombatMonsterEntity*) defender andMultiplier:(float) multiplier;

+(int) CalculateFightDamageWithAttacker:(CombatMonsterEntity*) attacker andDefender:(CombatMonsterEntity*) defender;

+(AbilityResult*) RunAbility:(AbilityData*) ability ofMonster:(CombatMonsterEntity*) owner onMonster:(CombatMonsterEntity*) target;

+(int) GetXpNeededForLevel:(int) level;

@end
