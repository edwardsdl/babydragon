#import <Foundation/Foundation.h>
#import "LootDensityType.h"

@protocol FloorGenerating <NSObject>

- (void)generateFloorWithTiles:(NSArray *)tiles size:(CGSize)size lootDensity:(LootDensityType)lootDensityType;

@end
