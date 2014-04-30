#import "BaseFloorGenerationStrategy.h"

@interface BaseFloorGenerationStrategy ()

- (void)generateFloorWithTiles:(NSArray *)tiles size:(CGSize)size lootDensity:(LootDensityType)lootDensityType;

@end

@implementation BaseFloorGenerationStrategy

- (void)generateFloorWithTiles:(NSArray *)tiles size:(CGSize)size lootDensity:(LootDensityType)lootDensityType;
{
    [NSException raise:NSInternalInconsistencyException
                format:@"You must override %@ in a subclass.", NSStringFromSelector(_cmd)];
}

- (CGPoint)getRandomLocation
{
    return CGPointMake(arc4random_uniform(_size.width), arc4random_uniform(_size.height));
}

- (Tile *)getTileAtLocation:(CGPoint)location
{
    return (Tile *)[[_tiles objectAtIndex:location.x] objectAtIndex:location.y];
}

- (BOOL)isFloorEdgeAtLocation:(CGPoint)location
{
    return location.x <= 0 || location.y <= 0 || location.x >= _size.width - 1 || location.y >= _size.height - 1;
}

@end
