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

+(int) CalculateDamageWithAttacker:(MonsterData*) attacker
                        andDefender:(MonsterData*) defender
                        andAttackType:(AttackType) attackType
                        andMultiplier:(float) multiplier
{
    //Base values for the defense percent range
    int upperDefensePercent = 45;
    int lowerDefensePercent = 30;
    int defensePercentPerLevel = 5;
    
    //Update the percentages for the level gap between the monsters
    upperDefensePercent = upperDefensePercent + ((defender.level - attacker.level) * defensePercentPerLevel);
    lowerDefensePercent = lowerDefensePercent + ((defender.level - attacker.level) * defensePercentPerLevel);
    
    //Randomize a value for the final defense percent and convert to float decimal value
    float defensePercent = (float)((arc4random() % (upperDefensePercent - lowerDefensePercent)) + lowerDefensePercent) / 100.0f;
    
    //Calculate the modified defense (defense for physical, willpower for magic)
    float modifiedDefense = 0.0f;
    if (attackType == AttackTypePhysical)
        modifiedDefense = (float)[defender trueDefense] * defensePercent;
    else
        modifiedDefense = (float)[defender trueWillpower] * defensePercent;
    
    //The damage value is the power of the attacker minus the modified defense value
    float damage = (float)[attacker truePower] - modifiedDefense;
    
    //Now apply the multiplier that was passed in, and take the floor of the final value
    int finalDamage = floor(damage * multiplier);
    
    //Damage cant be less than 1
    if (finalDamage < 1)
        finalDamage = 1;
    
    return finalDamage;
}

+(bool) DoesAttacker:(MonsterData*) attacker HitDefender:(MonsterData*) defender
{
    float missPercent = 0.08 + ((defender.level - attacker.level) * 0.02);
    missPercent =(missPercent * 100.0f);
    float hitRoll = (arc4random() % 100);
    return (hitRoll > missPercent);
}

+(int) DetermineElementalMatchupForAttack:(MonsterData*) attacker AndDefender:(MonsterData*) defender
{
    if (attacker.elementType == ElementTypeFire)
    {
        if (defender.elementType == ElementTypeEarth)
            return 1;
        else if (defender.elementType == ElementTypeWater)
            return -1;
    }
    
    if (attacker.elementType == ElementTypeWater)
    {
        if (defender.elementType == ElementTypeFire)
            return 1;
        else if (defender.elementType == ElementTypeEarth)
            return -1;
    }
    
    if (attacker.elementType == ElementTypeEarth)
    {
        if (defender.elementType == ElementTypeWater)
            return 1;
        else if (defender.elementType == ElementTypeFire)
            return -1;
    }
    
    if (attacker.elementType == ElementTypeDarkness)
    {
        if (defender.elementType == ElementTypeHoly)
            return 1;
    }
    
    if (attacker.elementType == ElementTypeHoly)
    {
        if (defender.elementType == ElementTypeDarkness)
            return 1;
    }
    
    //No elemental matchup
    return 0;
}

+(int) CalculateFightDamageWithAttacker:(MonsterData*) attacker andDefender:(MonsterData*) defender
{
    //Determine if the monster hit
    if ([self DoesAttacker:attacker HitDefender:defender] == NO)
        return -1;  //-1 signifies a miss
    
    int damage = [self CalculateDamageWithAttacker:attacker andDefender:defender andAttackType:AttackTypePhysical andMultiplier:1.0f];
    
    //Cut the fight damage of magic monsters in half
    if (attacker.attackType == AttackTypeMagic)
    {
        damage = (int)((float)damage * 0.5f);
        
        //Damage cant be less than 1
        if (damage < 1)
            damage = 1;
    }
    
    return damage;
}

+(int) CalculateAttackAbilityDamageWithAbility:(AbilityData*) ability AndAttacker:(MonsterData*) attacker andDefender:(MonsterData*) defender
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

@end
