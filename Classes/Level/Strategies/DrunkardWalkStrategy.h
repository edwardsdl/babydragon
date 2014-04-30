#import "BaseFloorGenerationStrategy.h"
#import <Foundation/Foundation.h>

@interface DrunkardWalkStrategy : BaseFloorGenerationStrategy

- (void)generateFloorWithTiles:(NSArray *)tiles size:(CGSize)size lootDensity:(LootDensityType)lootDensityType;

@end
