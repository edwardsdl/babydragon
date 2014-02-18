#import "BarcodeHelper.h"
#import "GoldFactory.h"
#import "NSData+ByteUtilities.h"
#import "ProbabilityCollection.h"


@implementation GoldFactory
{
    ProbabilityCollection *_goldProbabilityCollection;
}

#pragma mark - Initializers

#pragma mark - Public methods

- (GoldData *) newGoldFromBarcode:(NSString *)barcode
{
    uint8_t byte = [[BarcodeHelper hashForBarcode:barcode] byteAtIndex:1];
    
    NSNumber *amount = (NSNumber *)[_goldProbabilityCollection retrieveObjectUsingRandomFloat:byte / 255.0];
    
    return [GoldData insertGoldWithAmount:[amount intValue] barcode:barcode];
}

#pragma mark - Acquiring protocol methods

- (AcquisitionData *)newAcquisitionFromBarcode:(NSString *)barcode
{
    return [self newGoldFromBarcode:barcode];
}

#pragma mark - Private methods

- (void)populateGoldProbabilityCollection
{
    [_goldProbabilityCollection addObject:@100 withProbability:0.5];
    [_goldProbabilityCollection addObject:@200 withProbability:0.25];
    [_goldProbabilityCollection addObject:@300 withProbability:0.125];
    [_goldProbabilityCollection addObject:@400 withProbability:0.0625];
    [_goldProbabilityCollection addObject:@500 withProbability:0.03125];
}


@end
