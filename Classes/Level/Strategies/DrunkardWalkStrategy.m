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
- (ProbabilityCollection *)getValidUntraversedNeighborsForLocation:(CGPoint)location;
- (BOOL)isValidUntraversedNeighbor:(CGPoint)location;
- (CGPoint)setRandomEndLocation;
- (CGPoint)setRandomStartLocation;
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
    _size = size;
    _tiles = tiles;
    
    _totalNumberOfTiles = _size.height * _size.width;
    
    CGPoint startLocation = [self setRandomStartLocation];
    [self walkDunkenlyFromLocation:startLocation];
    [self setRandomEndLocation];
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

- (CGPoint)setRandomEndLocation
{
    CGPoint endLocation;
    Tile *tile = nil;
    do
    {
        endLocation = [self getRandomLocation];
        tile = [self getTileAtLocation:endLocation];
    }
    while (tile.tileType != Open);
    
    tile.tileType = End;
    
    return endLocation;
}

- (CGPoint)setRandomStartLocation
{
    CGPoint startLocation;
    do
    {
        startLocation = [self getRandomLocation];
    }
    while ([[self getValidUntraversedNeighborsForLocation:startLocation] count] == 0);
    
    [self getTileAtLocation:startLocation].tileType = Start;
    
    return startLocation;
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
        // If there are 0 open tiles it means this is the first call to this method and the current location will
        // contain the start tile. Overwriting the start tile causes bad things to happen.
        if (_totalNumberOfOpenTiles > 0)
        {
            [self getTileAtLocation:location].tileType = Open;
        }
        
        _totalNumberOfOpenTiles++;
        _percentageOfOpenTiles = (float)_totalNumberOfOpenTiles / (float)_totalNumberOfTiles;
        
        CGPoint nextLocation = [((NSValue *)[validUntraversedNeighbors retrieveAndRemoveObject]) CGPointValue];
        [self walkDunkenlyFromLocation:nextLocation];
    }
}

@end
