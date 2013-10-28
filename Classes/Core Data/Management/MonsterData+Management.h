#import "MonsterData.h"

@interface MonsterData (Management)

+ (NSArray *)allMonsters;
+ (MonsterData *)insertMonsterWithType:(NSString *)type barcode:(NSString *)barcode;
+ (MonsterData *)monsterWithName:(NSString *)name;
+ (void)removeAll;

- (int) trueCourage;
- (int) trueDefense;
- (int) trueIntellect;
- (int) trueSpeed;
- (int) trueStrength;
- (int) trueWillpower;

- (void) levelUp;
- (void) levelUp:(int) levelsGained;

@end
