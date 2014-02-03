#import "SinglePlayerContentData.h"
#import "Tile.h"

@interface SinglePlayerContentData (Management)

+ (NSArray *)allSinglePlayerContent;
+ (SinglePlayerContentData *)insertSinglePlayerContentWithEnvironmentType:(EnvironmentType)environmentType
                                                              lootQuality:(LootQualityType)lootQuality
                                                      minimumMonsterLevel:(int)minimumMonsterLevel
                                                      maximumMonsterLevel:(int)maximumMonsterLevel
                                                                     seed:(int)seed
                                                                  barcode:(NSString *)barcode;
+ (void)removeAll;
+ (SinglePlayerContentData *)singlePlayerContentWithSeed:(int)seed;

@end