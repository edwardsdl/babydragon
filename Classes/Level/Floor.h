#import "LevelSizeType.h"
#import "LootDensityType.h"
#import "FloorGenerating.h"
#import <Foundation/Foundation.h>

@interface Floor : NSObject

@property (nonatomic, retain, strong) NSArray *tiles;

// Designated initializer
- (id)initWithLevelSize:(LevelSizeType)levelSizeType
        lootDensityType:(LootDensityType)lootDensityType
floorGenerationStrategy:(id<FloorGenerating>)floorGenerationStrategy;

@end
