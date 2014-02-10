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
#import "AttackType.h"
#import "ElementType.h"

@interface CombatHelper : NSObject

+(int) CalculateFightDamageWithAttacker:(MonsterData*) attacker
                            andDefender:(MonsterData*) defender;

+(int) CalculateAttackAbilityDamageWithAbility:(AbilityData*) ability
                                   AndAttacker:(MonsterData*) attacker
                                   andDefender:(MonsterData*) defender;

+(int) CalculateHealingWithAbility:(AbilityData*) ability
                         AndHealer:(MonsterData*) healer
                         AndTarget:(MonsterData*) target;

@end
