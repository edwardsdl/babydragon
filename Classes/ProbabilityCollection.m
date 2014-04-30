#import "ProbabilityCollection.h"

@interface ProbabilityCollection()
{
    BOOL _isCollectionNormalized;
    NSMutableArray *_probabilityCollection;
}

- (void)normalizeProbabilities;
- (NSArray *)retrieveObjectAndProbability;
- (NSArray *)retrieveObjectAndProbabilityUsingRandomFloat:(float)randomFloat;

@end

@implementation ProbabilityCollection

#pragma mark - Initializers
- (id)init
{
    if (self = [super init])
    {
        _isCollectionNormalized = NO;
        _probabilityCollection = [NSMutableArray array];
    }
    
    return self;
}

#pragma mark - Public methods
- (void)addObject:(NSObject *)object withProbability:(float)probability
{
    if (probability > 0.0)
    {
        [_probabilityCollection addObject:[NSMutableArray arrayWithObjects:[NSNumber numberWithFloat:probability], object, nil]];
        _isCollectionNormalized = NO;
    }
}

- (NSUInteger)count
{
    return [_probabilityCollection count];
}

- (NSObject *)retrieveObject
{
    return [self retrieveObjectUsingRandomFloat:arc4random_uniform(UINT32_MAX) / (float)UINT32_MAX];
}

- (NSObject *)retrieveObjectUsingRandomFloat:(float)randomFloat
{
    return [[self retrieveObjectAndProbabilityUsingRandomFloat:randomFloat] objectAtIndex:1];
}

- (NSObject *)retrieveAndRemoveObject
{
    if (!_isCollectionNormalized)
    {
        [self normalizeProbabilities];
    }
    
    NSArray *array = [self retrieveObjectAndProbability];
    [_probabilityCollection removeObject:array];
    
    _isCollectionNormalized = NO;
    
    return [array objectAtIndex:1];
}

#pragma mark -  Private methods

- (void)normalizeProbabilities
{
    double cumulativeProbability = 0.0;
    for (NSArray *object in _probabilityCollection)
    {
        cumulativeProbability += [(NSNumber *)[object objectAtIndex:0] doubleValue];
    }
    
    if (cumulativeProbability != 1.0)
    {
        double offset = (1.0 - cumulativeProbability) / [_probabilityCollection count];
        for (NSMutableArray *object in _probabilityCollection)
        {
            double currentProbability = [[object objectAtIndex:0] doubleValue];
            [object setObject:@(currentProbability + offset) atIndexedSubscript:0];
        }
    }
    
    _isCollectionNormalized = YES;
}

- (NSArray *)retrieveObjectAndProbability
{
    return [self retrieveObjectAndProbabilityUsingRandomFloat:arc4random_uniform(UINT32_MAX) / (float)UINT32_MAX];
}

- (NSArray *)retrieveObjectAndProbabilityUsingRandomFloat:(float)randomFloat
{
    if (!_isCollectionNormalized)
    {
        [self normalizeProbabilities];
    }
    
    // Each item in the collection has two parts: a probability that it will be selected and the value associated with
    // that probability. This iterates through the items in the collection summing the probabilities until that sum
    // meets or exceeds the random number passed into the method. Finally, the object containing both the probability
    // and the object it represents is returned.
    float cumulativeProbability = 0.0;
    for (NSArray *object in _probabilityCollection)
    {
        cumulativeProbability += [(NSNumber *)[object objectAtIndex:0] doubleValue];
        if (cumulativeProbability >= randomFloat)
        {
            return object;
        }
    }
    
    return nil;
}

@end
