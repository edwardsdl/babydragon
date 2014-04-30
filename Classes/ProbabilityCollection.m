#import "ProbabilityCollection.h"

@interface ProbabilityCollection()
{
    BOOL _isCollectionNormalized;
    NSMutableArray * _probabilityCollection;
}

- (void)normalizeProbabilities;

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
    if (!_isCollectionNormalized)
    {
        [self normalizeProbabilities];
    }
    
    // TODO: Document this code
    float cumulativeProbability = 0.0;
    for (NSArray * object in _probabilityCollection)
    {
        cumulativeProbability += [(NSNumber *)[object objectAtIndex:0] doubleValue];
        if (cumulativeProbability >= randomFloat)
        {
            return [object objectAtIndex:1];
        }
    }
    
    return nil;
}

- (NSObject *)retrieveAndRemoveObject
{
    if (!_isCollectionNormalized)
    {
        [self normalizeProbabilities];
    }
    
    NSObject * object = [self retrieveObject];
    [_probabilityCollection removeObject:object];
    
    _isCollectionNormalized = NO;
    
    return object;
}

#pragma mark -  Private methods

- (void)normalizeProbabilities
{
    double cumulativeProbability = 0.0;
    for (NSArray * object in _probabilityCollection)
    {
        cumulativeProbability += [(NSNumber *)[object objectAtIndex:0] doubleValue];
    }
    
    if (cumulativeProbability != 1.0)
    {
        double offset = (1.0 - cumulativeProbability) / [_probabilityCollection count];
        for (NSMutableArray * object in _probabilityCollection)
        {
            double currentProbability = [[object objectAtIndex:0] doubleValue];
            [object setObject:@(currentProbability + offset) atIndexedSubscript:0];
        }
    }
    
    _isCollectionNormalized = YES;
}

@end
