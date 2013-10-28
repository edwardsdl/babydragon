#import "DefaultMonsterData.h"

@interface DefaultMonsterData (Management)

+ (NSArray *)allDefaultMonsterData;
+ (DefaultMonsterData *)defaultMonsterDataForType:(NSString *)type;
+ (DefaultMonsterData *)insertDefaultMonsterAttributesForType:(NSString *)type;
+ (void)removeAll;

@end
