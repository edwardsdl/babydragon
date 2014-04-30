#import "DrunkardWalkStrategy.h"
#import "Floor.h"
#import "Level.h"
#import "Tile.h"

@implementation Level

- (id)initWithLevelBonusType:(LevelBonusType)levelBonusType
                   levelSize:(LevelSizeType)levelSizeType
                 lootDensity:(LootDensityType)lootDensityType
                    maxLevel:(int)maxLevel
                    minLevel:(int)minLevel
          primaryElementType:(ElementType)primaryElementType
        secondaryElementType:(ElementType)secondaryElementType
{
    if (self = [super init])
    {
        _levelBonusType = levelBonusType;
        _levelSizeType = levelSizeType;
        _lootDensityType = lootDensityType;
        _maxLevel = maxLevel;
        _minLevel = minLevel;
        _primaryElementType = primaryElementType;
        _secondaryElementType = secondaryElementType;
        
        int floorCount = 0;
        switch (levelSizeType)
        {
            case SmallLevelSize:
                floorCount = 1;
                break;
            case MediumLevelSize:
                floorCount = 2;
                break;
            case LargeLevelSize:
                floorCount = 3;
                break;
            default:
                floorCount = 1;
        }
        
        NSMutableArray *floors = [NSMutableArray array];
        DrunkardWalkStrategy *drunkardWalkStrategy = [[DrunkardWalkStrategy alloc] init];
        for (int i = 0; i < floorCount; i++)
        {
            Floor *floor = [[Floor alloc] initWithLevelSize:levelSizeType
                                            lootDensityType:lootDensityType
                                    floorGenerationStrategy:drunkardWalkStrategy];
            [floors addObject:floor];
        }
        
        _floors = floors;
    }
    
    return self;
}

@end
