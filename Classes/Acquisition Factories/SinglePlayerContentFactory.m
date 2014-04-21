#import "BarcodeHelper.h"
#import "ElementType.h"
#import "LevelBonusType.h"
#import "LevelSizeType.h"
#import "LootDensityType.h"
#import "NSData+ByteUtilities.h"
#import "ProbabilityCollection.h"
#import "SinglePlayerContentData+Management.h"
#import "SinglePlayerContentFactory.h"
#import "Tile.h"

@interface SinglePlayerContentFactory()
{
    ProbabilityCollection *_elementTypeProbabilityCollection;
    ProbabilityCollection *_levelSizeProbabilityCollection;
    ProbabilityCollection *_lootDensityProbabilityCollection;
    ProbabilityCollection *_levelBonusProbabilityCollection;
}

- (void)populateElementTypeProbabilityCollection;
- (void)populateLootDensityProbabilityCollection;
- (void)populateLevelSizeProbabilityCollection;
- (void)populateLevelBonusProbabilityCollection;

@end

@implementation SinglePlayerContentFactory

#pragma mark - Initializers
- (id)init
{
    if (self = [super init])
    {
        _elementTypeProbabilityCollection = [[ProbabilityCollection alloc] init];
        [self populateElementTypeProbabilityCollection];
        
        _lootDensityProbabilityCollection = [[ProbabilityCollection alloc] init];
        [self populateLootDensityProbabilityCollection];
        
        _levelSizeProbabilityCollection = [[ProbabilityCollection alloc] init];
        [self populateLevelSizeProbabilityCollection];
        
        _levelBonusProbabilityCollection = [[ProbabilityCollection alloc] init];
        [self populateLevelBonusProbabilityCollection];
    }
    
    return self;
}

#pragma mark - Public methods

- (SinglePlayerContentData *)newSinglePlayerContentFromBarcode:(NSString *)barcode
{
    NSData *barcodeHash = [BarcodeHelper hashForBarcode:barcode];
    
    uint8_t byte = [barcodeHash byteAtIndex:1];
    ElementType primaryElementType = (ElementType)[_elementTypeProbabilityCollection retrieveObjectUsingRandomFloat:byte / 255.0];
    
    byte = [barcodeHash byteAtIndex:2];
    ElementType secondaryElementType = (ElementType)[_elementTypeProbabilityCollection retrieveObjectUsingRandomFloat:byte / 255.0];
    
    byte = [barcodeHash byteAtIndex:3];
    LevelSizeType levelSizeType = (LevelSizeType)[_levelSizeProbabilityCollection retrieveObjectUsingRandomFloat:byte / 255.0];
    
    byte = [barcodeHash byteAtIndex:4];
    LootDensityType lootDensityType = (LootDensityType)[_lootDensityProbabilityCollection retrieveObjectUsingRandomFloat:byte / 255.0];

    byte = [barcodeHash byteAtIndex:5];
    LevelBonusType levelBonusType = (LevelBonusType)[_levelBonusProbabilityCollection retrieveObjectUsingRandomFloat:byte / 255.0];
    
    return [SinglePlayerContentData insertSinglePlayerContentWithPrimaryElementType:primaryElementType
                                                               secondaryElementType:secondaryElementType
                                                                     levelBonusType:levelBonusType
                                                                               size:levelSizeType
                                                                        lootDensity:lootDensityType
                                                                            barcode:barcode];
}

#pragma mark - Acquiring protocol methods

- (AcquisitionData *)newAcquisitionFromBarcode:(NSString *)barcode
{
    return [self newSinglePlayerContentFromBarcode:barcode];
}

#pragma mark - Private methods

- (void)populateElementTypeProbabilityCollection
{
    for (int i = 1; i < ElementTypeCount; i++)
    {
        [_elementTypeProbabilityCollection addObject:[NSNumber numberWithInt:i] withProbability:1.0];
    }
}

- (void)populateLevelSizeProbabilityCollection
{
    for (int i = 0; i < LevelSizeTypeCount; i++)
    {
        [_levelSizeProbabilityCollection addObject:[NSNumber numberWithInt:i] withProbability:1.0];
    }
}

- (void)populateLootDensityProbabilityCollection
{
    for (int i = 0; i < LootDensityTypeCount; i++)
    {
        [_lootDensityProbabilityCollection addObject:[NSNumber numberWithInt:i] withProbability:1.0];
    }
}

@end
