//
//  CombatHelper.m
//  BabyDragon
//
//  Created by Eric Stenborg on 9/30/13.
//  Copyright (c) 2013 First Light Games. All rights reserved.
//

#import "CombatHelper.h"
#import "MonsterData+Management.h"


@implementation CombatHelper

+(int) CalculateDamageWithAttacker:(CombatMonsterNode*) attacker
                        andDefender:(CombatMonsterNode*) defender
                        andAttackType:(AttackType) attackType
                        andMultiplier:(float) multiplier
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
    
    //Calculate the modified defense (defense for physical, willpower for magic)
    float modifiedDefense = 0.0f;
    if (attackType == AttackTypePhysical)
        modifiedDefense = (float)[defender adjustedDefense] * defensePercent;
    else
        modifiedDefense = (float)[defender adjustedWillpower] * defensePercent;
    
    //The damage value is the power of the attacker minus the modified defense value
    float damage = (float)[attacker adjustedPower] - modifiedDefense;
    
    //Now apply the multiplier that was passed in, and take the floor of the final value
    int finalDamage = floor(damage * multiplier);
    
    //Damage cant be less than 1
    if (finalDamage < 1)
        finalDamage = 1;
    
    return finalDamage;
}

+(bool) DoesAttacker:(CombatMonsterNode*) attacker HitDefender:(CombatMonsterNode*) defender
{
    float missPercent = 0.08 + ((defender.monsterData.level - attacker.monsterData.level) * 0.02);
    missPercent =(missPercent * 100.0f);
    float hitRoll = (arc4random() % 100);
    return (hitRoll > missPercent);
}

+(int) DetermineElementalMatchupForAttack:(CombatMonsterNode*) attacker AndDefender:(CombatMonsterNode*) defender
{
    if (attacker.monsterData.elementType == ElementTypeFire)
    {
        if (defender.monsterData.elementType == ElementTypeEarth)
            return 1;
        else if (defender.monsterData.elementType == ElementTypeWater)
            return -1;
    }
    
    if (attacker.monsterData.elementType == ElementTypeWater)
    {
        if (defender.monsterData.elementType == ElementTypeFire)
            return 1;
        else if (defender.monsterData.elementType == ElementTypeEarth)
            return -1;
    }
    
    if (attacker.monsterData.elementType == ElementTypeEarth)
    {
        if (defender.monsterData.elementType == ElementTypeWater)
            return 1;
        else if (defender.monsterData.elementType == ElementTypeFire)
            return -1;
    }
    
    if (attacker.monsterData.elementType == ElementTypeDarkness)
    {
        if (defender.monsterData.elementType == ElementTypeHoly)
            return 1;
    }
    
    if (attacker.monsterData.elementType == ElementTypeHoly)
    {
        if (defender.monsterData.elementType == ElementTypeDarkness)
            return 1;
    }
    
    //No elemental matchup
    return 0;
}

+(int) CalculateFightDamageWithAttacker:(CombatMonsterNode*) attacker andDefender:(CombatMonsterNode*) defender
{
    //Determine if the monster hit
    if ([self DoesAttacker:attacker HitDefender:defender] == NO)
        return -1;  //-1 signifies a miss
    
    int damage = [self CalculateDamageWithAttacker:attacker andDefender:defender andAttackType:AttackTypePhysical andMultiplier:1.0f];
    
    //Cut the fight damage of magic monsters in half
    if (attacker.monsterData.attackType == AttackTypeMagic)
    {
        damage = (int)((float)damage * 0.5f);
        
        //Damage cant be less than 1
        if (damage < 1)
            damage = 1;
    }
    
    return damage;
}

+(int) CalculateAttackAbilityDamageWithAbility:(AbilityData*) ability AndAttacker:(CombatMonsterNode*) attacker andDefender:(CombatMonsterNode*) defender
{
    //Determine if the monster hit, but only for physical abilities
    if (ability.attackType == AttackTypePhysical && [self DoesAttacker:attacker HitDefender:defender] == NO)
        return -1;  //-1 signifies a miss

    //Calculate base damage
    int damage = [self CalculateDamageWithAttacker:attacker andDefender:defender andAttackType:ability.attackType andMultiplier:ability.value];
    
    //Calculate elemental strength/weaknesses
    float percent = (float)((arc4random() % (15 - 10)) + 10) / 100.0f;
    int damageModifier = (int)((float)damage * percent) * [self DetermineElementalMatchupForAttack:attacker AndDefender:defender];
    damage += damageModifier;
    
    //Return final damage
    return damage;
}

+(int) CalculateHealingWithAbility:(AbilityData*) ability
{
    int upperPercent = 115;
    int lowerPercent = 85;
    
    float healing = ability.value *
        (float)((arc4random() % (upperPercent - lowerPercent)) + lowerPercent) / 100.0f;
    
    return floor(healing);
}

@end
