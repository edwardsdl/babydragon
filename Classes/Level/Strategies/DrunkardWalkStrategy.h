#import "BaseFloorGenerationStrategy.h"
#import <Foundation/Foundation.h>

@interface DrunkardWalkStrategy : BaseFloorGenerationStrategy

- (void)generateFloorWithTiles:(NSArray *)tiles lootDensity:(LootDensityType)lootDensityType;

@end
