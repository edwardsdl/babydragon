#import "CardinalDirection.h"
#import "Floor.h"
#import "Tile.h"

@interface Floor ()

- (NSArray *)buildTileArrayWithSize:(CGSize)size;
- (CGSize)getLevelSizeWithLevelSizeType:(LevelSizeType)levelSizeType;

@end

@implementation Floor

- (id)initWithLevelSize:(LevelSizeType)levelSizeType
        lootDensityType:(LootDensityType)lootDensityType
floorGenerationStrategy:(id<FloorGenerating>)floorGenerationStrategy
{
    if (self = [super init])
    {
        CGSize size = [self getLevelSizeWithLevelSizeType:levelSizeType];
        NSArray *tiles = [self buildTileArrayWithSize:size];
        [floorGenerationStrategy generateFloorWithTiles:tiles size:size lootDensity:lootDensityType];
        
        _tiles = tiles;
    }
    
    return self;
}

- (NSArray *)buildTileArrayWithSize:(CGSize)size
{
    NSMutableArray *tiles = [NSMutableArray array];
    for (int i = 0; i < size.width; i++)
    {
        NSMutableArray *column = [NSMutableArray array];
        for (int j = 0; j < size.height; j++)
        {
            [column addObject:[[Tile alloc] initWithTileType:Wall]];
        }
        
        [tiles addObject:column];
    }
    
    return tiles;
}

- (CGSize)getLevelSizeWithLevelSizeType:(LevelSizeType)levelSizeType
{
    switch (levelSizeType)
    {
        case SmallLevelSize:
            return CGSizeMake(30, 30);
        case MediumLevelSize:
            return CGSizeMake(35, 35);
        case LargeLevelSize:
            return CGSizeMake(40, 40);
        default:
            return CGSizeMake(30, 30);
    }
}

@end
