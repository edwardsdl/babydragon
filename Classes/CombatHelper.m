//
//  CombatHelper.m
//  BabyDragon
//
//  Created by Eric Stenborg on 9/30/13.
//  Copyright (c) 2013 First Light Games. All rights reserved.
//

#import "CombatHelper.h"
#import "AbilityResult.h"
#import "MonsterData+Management.h"

@implementation CombatHelper

+(int) CalculatePhysicalDamageWithAttacker:(CombatMonsterNode*) attacker andDefender:(CombatMonsterNode*) defender andMultiplier:(float) multiplier
{
    //Base values for the defense percent range
    int upperDefensePercent = 45;
    int lowerDefensePercent = 30;
    int defensePercentPerLevel = 5;
    
    //Update the percentages for the level gap between the monsters
    upperDefensePercent = upperDefensePercent + ((defender.monsterData.level - attacker.monsterData.level) * defensePercentPerLevel);
    lowerDefensePercent = lowerDefensePercent + ((defender.monsterData.level - attacker.monsterData.level) * defensePercentPerLevel);
    
    //Randomize a value for the final defense percent and convert to float decimal value
    float defensePercent = (float)((arc4random() % (upperDefensePercent - lowerDefensePercent)) + lowerDefensePercent) / 100.0f;
    
    //Calculate the modified defense
    float modifiedDefense = (float)[defender.monsterData trueDefense] * defensePercent;
    
    //The damage value is the stength of the attack minus the modified defense value
    float damage = (float)[attacker.monsterData truePower] - modifiedDefense;
    
    //Now apply the multiplier that was passed in, and take the floor of the final value
    int finalDamage = floor(damage * multiplier);
    
    //Damage cant be less than 1
    if (finalDamage < 1)
        finalDamage = 1;
    
    return finalDamage;
}

+(int) CalculateFightDamageWithAttacker:(CombatMonsterNode*) attacker andDefender:(CombatMonsterNode*) defender
{
    return [self CalculatePhysicalDamageWithAttacker:attacker andDefender:defender andMultiplier:1.0f];
}

+(AbilityResult*) RunAbility:(AbilityData*) ability ofMonster:(CombatMonsterNode*) owner onMonster:(CombatMonsterNode*) target
{
    AbilityResult *result = [AbilityResult new];
    result.targetMonster = target;
    result.effectType = (EffectType)ability.effectType;
    
    if (ability.effectType == Damage)
    {
        result.value = [CombatHelper CalculatePhysicalDamageWithAttacker:owner andDefender:target andMultiplier:ability.value];
        result.statusText = [NSString stringWithFormat:@"%@ used %@ on %@ for %d damage", owner.monsterData.name, ability.name, target.monsterData.name, result.value];
    }
    else if ((EffectType)ability.effectType == Heal)
    {
        result.value = ability.value;
        result.statusText = [NSString stringWithFormat:@"%@ healed %@ for %d health using %@", owner.monsterData.name, target.monsterData.name, result.value, ability.name];
    }
    
    return result;
}

+(int) GetXpNeededForLevel:(int) level
{
    return 0;
}

@end
