#import "CardinalDirection.h"
#import "DrunkardWalkStrategy.h"
#import "ProbabilityCollection.h"
#import "TileType.h"

@interface DrunkardWalkStrategy ()
{
    int _totalNumberOfOpenTiles;
    int _totalNumberOfTiles;
    float _percentageOfOpenTiles;
    float _percentageOfOpenTilesDesired;
}

- (CGPoint)getLocationInCardinalDirection:(CardinalDirection)cardinalDirection ofLocation:(CGPoint)location;
- (CGPoint)getValidStartingLocation;
- (ProbabilityCollection *)getValidUntraversedNeighborsForLocation:(CGPoint)location;
- (BOOL)isValidUntraversedNeighbor:(CGPoint)location;
- (void)walkDunkenlyFromLocation:(CGPoint)location;

@end

@implementation DrunkardWalkStrategy

- (id)init
{
    if (self = [super init])
    {
        _totalNumberOfOpenTiles = 0;
        _totalNumberOfTiles = 0;
        _percentageOfOpenTiles = 0.0f;
        _percentageOfOpenTilesDesired = 0.45f;
    }
    
    return self;
}

- (void)generateFloorWithTiles:(NSArray *)tiles size:(CGSize)size lootDensity:(LootDensityType)lootDensityType;
{
    self.size = size;
    self.tiles = tiles;
    
    _totalNumberOfTiles = self.size.height * self.size.width;
    
    CGPoint startingLocation = [self getValidStartingLocation];
    [self walkDunkenlyFromLocation:startingLocation];
}

- (CGPoint)getLocationInCardinalDirection:(CardinalDirection)cardinalDirection ofLocation:(CGPoint)location
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

- (CGPoint)getValidStartingLocation
{
    CGPoint startingLocation;
    do
    {
        startingLocation = [self getRandomLocation];
    }
    while ([[self getValidUntraversedNeighborsForLocation:startingLocation] count] == 0);
    
    return startingLocation;
}

- (ProbabilityCollection *)getValidUntraversedNeighborsForLocation:(CGPoint)location
{
    ProbabilityCollection *validUntraversedNeighborsForLocation = [[ProbabilityCollection alloc] init];
    
    CGPoint northLocation = [self getLocationInCardinalDirection:North ofLocation:location];
    if ([self isValidUntraversedNeighbor:northLocation])
    {
        [validUntraversedNeighborsForLocation addObject:[NSValue valueWithCGPoint:northLocation] withProbability:1.0f];
    }
    
    CGPoint eastLocation = [self getLocationInCardinalDirection:East ofLocation:location];
    if ([self isValidUntraversedNeighbor:eastLocation])
    {
        [validUntraversedNeighborsForLocation addObject:[NSValue valueWithCGPoint:eastLocation] withProbability:1.0f];
    }
    
    CGPoint southLocation = [self getLocationInCardinalDirection:South ofLocation:location];
    if ([self isValidUntraversedNeighbor:southLocation])
    {
        [validUntraversedNeighborsForLocation addObject:[NSValue valueWithCGPoint:southLocation] withProbability:1.0f];
    }
    
    CGPoint westLocation = [self getLocationInCardinalDirection:West ofLocation:location];
    if ([self isValidUntraversedNeighbor:westLocation])
    {
        [validUntraversedNeighborsForLocation addObject:[NSValue valueWithCGPoint:westLocation] withProbability:1.0f];
    }
    
    return validUntraversedNeighborsForLocation;
}

- (BOOL)isValidUntraversedNeighbor:(CGPoint)location
{
    BOOL isValidUntraversedNeighbor = NO;
    
    if (![self isFloorEdgeAtLocation:location])
    {
        TileType tileType = [self getTileAtLocation:location].tileType;
        isValidUntraversedNeighbor = tileType != End
        && tileType != Open
        && tileType != Start
        && tileType != Treasure;
    }
    
    return isValidUntraversedNeighbor;
}

- (void)walkDunkenlyFromLocation:(CGPoint)location
{
    ProbabilityCollection *validUntraversedNeighbors = [self getValidUntraversedNeighborsForLocation:location];
    while ([validUntraversedNeighbors count] > 0 && _percentageOfOpenTiles < _percentageOfOpenTilesDesired)
    {
        // If no open tiles have be placed it means this is the first call to this method. Instead of an open tile,
        // a start tile should be placed.
        [self getTileAtLocation:location].tileType = _totalNumberOfOpenTiles == 0
        ? Start
        : Open;
        
        _totalNumberOfOpenTiles++;
        _percentageOfOpenTiles = (float)_totalNumberOfOpenTiles / (float)_totalNumberOfTiles;
        
        CGPoint nextLocation = [((NSValue *)[validUntraversedNeighbors retrieveAndRemoveObject]) CGPointValue];
        [self walkDunkenlyFromLocation:nextLocation];
    }
}

@end
