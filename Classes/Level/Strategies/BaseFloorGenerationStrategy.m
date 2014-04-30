#import "BaseFloorGenerationStrategy.h"

@interface BaseFloorGenerationStrategy ()

- (void)generateFloorWithTiles:(NSArray *)tiles lootDensity:(LootDensityType)lootDensityType;

@end

@implementation BaseFloorGenerationStrategy

- (void)generateFloorWithTiles:(NSArray *)tiles lootDensity:(LootDensityType)lootDensityType;
{
    [NSException raise:NSInternalInconsistencyException
                format:@"You must override %@ in a subclass.", NSStringFromSelector(_cmd)];
}

- (CGPoint)getRandomLocation
{
    return CGPointMake(arc4random_uniform(size.width), arc4random_uniform(size.height));
}

- (Tile *)getTileAtLocation:(CGPoint)location
{
    return (Tile *)[[self.tiles objectAtIndex:location.x] objectAtIndex:location.y];
}

- (BOOL)isFloorEdgeAtLocation:(CGPoint)location
{
    return location.x <= 0 || location.y <= 0 || location.x >= size.width - 1 || location.y >= size.height - 1;
}

@end
