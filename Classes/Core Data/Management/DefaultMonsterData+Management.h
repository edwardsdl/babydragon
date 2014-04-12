#import "DefaultMonsterData.h"

@interface DefaultMonsterData (Management)

+ (NSArray *)allDefaultMonsterData;
+ (DefaultMonsterData *)defaultMonsterDataForType:(NSString *)type;
+ (NSArray *) defaultMonsterDataByElement:(NSNumber*) element AndRarity:(NSNumber*) rarity;
+ (DefaultMonsterData *)insertDefaultMonsterAttributesForType:(NSString *)type;
+ (void)removeAll;

@end
