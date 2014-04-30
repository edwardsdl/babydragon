#import <Foundation/Foundation.h>
#import "LootDensityType.h"

@protocol FloorGenerating <NSObject>

- (void)generateFloorWithTiles:(NSArray *)tiles lootDensity:(LootDensityType)lootDensityType;

@end
