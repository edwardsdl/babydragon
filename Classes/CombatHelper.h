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
#import "AttackType.h"
#import "ElementType.h"

@interface CombatHelper : NSObject

+(int) CalculateFightDamageWithAttacker:(CombatMonsterNode*) attacker
                            andDefender:(CombatMonsterNode*) defender;

+(int) CalculateAttackAbilityDamageWithAbility:(AbilityData*) ability
                                   AndAttacker:(CombatMonsterNode*) attacker
                                   andDefender:(CombatMonsterNode*) defender;

+(int) CalculateHealingWithAbility:(AbilityData*) ability;

@end
