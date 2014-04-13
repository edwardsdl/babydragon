#import "MonsterData.h"

@interface MonsterData (Management)

+ (NSArray *)allMonsters;
+ (MonsterData *)anyMonsterWithName:(NSString *)name;
+ (MonsterData *)insertMonsterWithType:(NSString *)type barcode:(NSString *)barcode;
+ (MonsterData *)monsterWithUUID:(NSString *)uuid;
+ (void)removeAll;

- (int) trueCourage;
- (int) trueDefense;
- (int) trueSpeed;
- (int) truePower;
- (int) trueWillpower;

-(int) xpValue;
- (void) levelUp;
- (void) levelUp:(int) levelsGained;
- (void) assignAbilitiesForLevel:(int) level;

@end
