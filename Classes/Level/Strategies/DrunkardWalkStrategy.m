#import "CardinalDirection.h"
#import "DrunkardWalkStrategy.h"
#import "ProbabilityCollection.h"
#import "TileType.h"

@interface DrunkardWalkStrategy ()
{
    int _totalNumberOfOpenTiles;
    float _percentageOfOpenTiles;
    float _percentageOfOpenTilesDesired;
}

- (BOOL)isValidUntraversedNeighbor:(CGPoint)location;
- (CGPoint)locationInCardinalDirection:(CardinalDirection)cardinalDirection ofLocation:(CGPoint)location;
- (ProbabilityCollection *)validUntraversedNeighborsForLocation:(CGPoint)location;
- (void)walkDunkenlyFromLocation:(CGPoint)location;

@end

@implementation DrunkardWalkStrategy

- (id)init
{
    if (self = [super init])
    {
        _totalNumberOfOpenTiles = 0;
        _percentageOfOpenTiles = 0.0f;
        _percentageOfOpenTilesDesired = 0.6f;
    }
    
    return self;
}

- (void)generateFloorWithTiles:(NSArray *)tiles lootDensity:(LootDensityType)lootDensityType;
{
    self.tiles = tiles;
    
    CGPoint startingLocation;
    do
    {
        startingLocation = [self getRandomLocation];
    }
    while ([[self validUntraversedNeighborsForLocation:startingLocation] ]);
    
    [self walkDunkenlyFromLocation:startingLocation];
}

- (BOOL)isValidUntraversedNeighbor:(CGPoint)location
{
    BOOL isValidUntraversedNeighbor = NO;
    
    if (![self isFloorEdgeAtLocation:location])
    {
        TileType tileType = [self getTileAtLocation:location].tileType;
        isValidUntraversedNeighbor = tileType != Open && tileType != Treasure;
    }
    
    return isValidUntraversedNeighbor;
}

- (CGPoint)locationInCardinalDirection:(CardinalDirection)cardinalDirection ofLocation:(CGPoint)location
{
    switch (cardinalDirection)
    {
        case North:
            return CGPointMake(location.x, location.y + 1);
        case East:
            return CGPointMake(location.x + 1, location.y);
        case South:
            return CGPointMake(location.x, location.y - 1);
        case West:
            return CGPointMake(location.x - 1, location.y);
    }
}

- (ProbabilityCollection *)validUntraversedNeighborsForLocation:(CGPoint)location
{
    ProbabilityCollection *validUntraversedNeighborsForLocation = [[ProbabilityCollection alloc] init];
    
    CGPoint northLocation = [self locationInCardinalDirection:North ofLocation:location];
    if ([self isValidUntraversedNeighbor:northLocation])
    {
        [validUntraversedNeighborsForLocation addObject:[NSValue valueWithCGPoint:northLocation] withProbability:1.0f];
    }
    
    CGPoint eastLocation = [self locationInCardinalDirection:East ofLocation:location];
    if ([self isValidUntraversedNeighbor:eastLocation])
    {
        [validUntraversedNeighborsForLocation addObject:[NSValue valueWithCGPoint:eastLocation] withProbability:1.0f];
    }
    
    CGPoint southLocation = [self locationInCardinalDirection:South ofLocation:location];
    if ([self isValidUntraversedNeighbor:southLocation])
    {
        [validUntraversedNeighborsForLocation addObject:[NSValue valueWithCGPoint:southLocation] withProbability:1.0f];
    }
    
    CGPoint westLocation = [self locationInCardinalDirection:West ofLocation:location];
    if ([self isValidUntraversedNeighbor:westLocation])
    {
        [validUntraversedNeighborsForLocation addObject:[NSValue valueWithCGPoint:westLocation] withProbability:1.0f];
    }
    
    return validUntraversedNeighborsForLocation;
}

- (void)walkDunkenlyFromLocation:(CGPoint)location
{
    if (!_percentageOfOpenTiles >= _percentageOfOpenTilesDesired)
    {
        while ([self hasValidUntraversedNeighbor:location])
        {
            
        }
        
        // while any non-boundary walls adjacent
        //  choose one at random
        //  set tile to open
        //  call recursively
        // return
    }
}

@end
