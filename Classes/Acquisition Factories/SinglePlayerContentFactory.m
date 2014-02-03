#import "BarcodeHelper.h"
#import "EnvironmentType.h"
#import "LevelSizeType.h"
#import "LootQualityType.h"
#import "ProbabilityCollection.h"
#import "SinglePlayerContentFactory.h"
#import "Tile.h"

@interface SinglePlayerContentFactory()
{
    ProbabilityCollection *_environmentProbabilityCollection;
    ProbabilityCollection *_sizeProbabilityCollection;
    ProbabilityCollection *_lootProbabilityCollection;
}

- (void)populateEnvironmentProbabilityCollection;
- (void)populateSizeProbabilityCollection;
- (void)populateLootQualityProbabilityCollection;

@end

@implementation SinglePlayerContentFactory
{
    CGSize _floorSize;
}

#pragma mark - Initializers
- (id)init
{
    if (self = [super init])
    {
        _sizeProbabilityCollection = [[ProbabilityCollection alloc] init];
        [self populateSizeProbabilityCollection];
    }
    
    return self;
}

#pragma mark - Public methods

- (SinglePlayerContentData *)newSinglePlayerContentFromHash:(NSData *)hash
{
    return nil;
}

#pragma mark - Acquiring protocol methods

- (AcquisitionData *)newAcquisitionFromBarcode:(NSString *)barcode
{
    return [self newSinglePlayerContentFromHash:[BarcodeHelper hashForBarcode:barcode]];
}

#pragma mark - Private methods

- (void)populateEnvironmentProbabilityCollection
{
    for (int i = 0; i < EnvironmentTypeCount; i++)
    {
        [_environmentProbabilityCollection addObject:[NSNumber numberWithInt:i] withProbability:1.0];
    }
}

- (void)populateSizeProbabilityCollection
{
    for (int i = 0; i < LevelSizeTypeCount; i++)
    {
        [_sizeProbabilityCollection addObject:[NSNumber numberWithInt:i] withProbability:1.0];
    }
}

- (void)populateLootQualityProbabilityCollection
{
    for (int i = 0; i < LootQualityTypeCount; i++)
    {
        [_lootProbabilityCollection addObject:[NSNumber numberWithInt:i] withProbability:1.0];
    }
}

@end
