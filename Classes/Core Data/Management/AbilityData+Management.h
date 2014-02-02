#import "AbilityData.h"

@interface AbilityData (Management)

+ (NSArray *)allAbilities;
//+ (AbilityData *)insertAbilityForMonster:(MonsterData *)monster;
+ (AbilityData *)insertAbilityData;
+ (void)removeAll;

@end
