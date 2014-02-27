#import "AbilityData.h"

@interface AbilityData (Management)

+ (NSArray *)allAbilities;
//+ (AbilityData *)insertAbilityForMonster:(MonsterData *)monster;
+ (AbilityData *)abilityDataWithName:(NSString *)name andLevel:(NSNumber*) level;
+ (AbilityData *) abilityDataWithLevel:(NSNumber*) level andElementType:(NSNumber*) elementType andEffectType:(NSNumber*) effectType andAttackType:(NSNumber*) attackType;
+ (AbilityData *)insertAbilityData;
+ (void)removeAll;

@end
