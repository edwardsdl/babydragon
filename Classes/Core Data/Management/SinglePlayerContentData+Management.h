#import "ElementType.h"
#import "LevelBonusType.h"
#import "LevelSizeType.h"
#import "LootDensityType.h"
#import "SinglePlayerContentData.h"
#import "Tile.h"

@interface SinglePlayerContentData (Management)

+ (NSArray *)allSinglePlayerContent;
+ (SinglePlayerContentData *)insertSinglePlayerContentWithPrimaryElementType:(ElementType)primaryElementType
                                                        secondaryElementType:(ElementType)secondaryElementType
                                                              levelBonusType:(LevelBonusType)levelBonusType
                                                                        size:(LevelSizeType)levelSizeType
                                                                 lootDensity:(LootDensityType)lootDensityType
                                                                     barcode:(NSString *)barcode;
+ (void)removeAll;

@end