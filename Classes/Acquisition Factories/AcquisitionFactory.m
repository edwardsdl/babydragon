#import "Acquiring.h"
#import "AcquisitionFactory.h"
#import "BarcodeHelper.h"
#import "GoldFactory.h"
#import "MonsterFactory.h"
#import "NSData+ByteUtilities.h"
#import "ProbabilityCollection.h"
#import "SinglePlayerContentFactory.h"

@interface AcquisitionFactory ()
{
    ProbabilityCollection * _acquisitionProbabilities;
}

@end

@implementation AcquisitionFactory

#pragma mark - Initializers
- (id)init
{
    if (self = [super init])
    {
        _acquisitionProbabilities = [[ProbabilityCollection alloc] init];
        [_acquisitionProbabilities addObject:[[GoldFactory alloc] init] withProbability:0.0];
        [_acquisitionProbabilities addObject:[[MonsterFactory alloc] init] withProbability:1.0];
        [_acquisitionProbabilities addObject:[[SinglePlayerContentFactory alloc] init] withProbability:0.0];
    }
    
    return self;
}

#pragma mark - Public methods

- (AcquisitionData *) newAcquisitionFromBarcode:(NSString *)barcode
{
    uint8_t byte = [[BarcodeHelper hashForBarcode:barcode] byteAtIndex:0];
    
    id<Acquiring> acquisitionFactory = (id<Acquiring>)[_acquisitionProbabilities retrieveObjectUsingRandomFloat:byte / 255.0];
    
    return [acquisitionFactory newAcquisitionFromBarcode:barcode];
}

@end
