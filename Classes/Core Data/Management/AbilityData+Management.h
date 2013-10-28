#import "AbilityData.h"

@interface AbilityData (Management)

+ (NSArray *)allAbilities;
+ (AbilityData *)insertAbilityForMonster:(MonsterData *)monster;
+ (void)removeAll;

@end
