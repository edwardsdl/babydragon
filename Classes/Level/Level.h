#import "ElementType.h"
#import "LevelBonusType.h"
#import "LevelSizeType.h"
#import "LootDensityType.h"
#import <Foundation/Foundation.h>

@interface Level : NSObject

@property (nonatomic, readonly, strong) NSMutableArray *floors;
@property (nonatomic) LevelBonusType levelBonusType;
@property (nonatomic) LevelSizeType levelSizeType;
@property (nonatomic) LootDensityType lootDensityType;
@property (nonatomic) int maxLevel;
@property (nonatomic) int minLevel;
@property (nonatomic) ElementType primaryElementType;
@property (nonatomic) ElementType secondaryElementType;

// Designated initializer
- (id)initWithLevelBonusType:(LevelBonusType)levelBonusType
                   levelSize:(LevelSizeType)levelSizeType
                 lootDensity:(LootDensityType)lootDensityType
                    maxLevel:(int)maxLevel
                    minLevel:(int)minLevel
          primaryElementType:(ElementType)primaryElementType
        secondaryElementType:(ElementType)secondaryElementType;

@end
