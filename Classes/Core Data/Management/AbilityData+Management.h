#import "AbilityData.h"

@interface AbilityData (Management)

+ (NSArray *)allAbilities;
//+ (AbilityData *)insertAbilityForMonster:(MonsterData *)monster;
+ (AbilityData *)abilityDataWithName:(NSString *)name andLevel:(NSNumber*) level;
+ (AbilityData *)insertAbilityData;
+ (void)removeAll;

@end
