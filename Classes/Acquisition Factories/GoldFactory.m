#import "BarcodeHelper.h"
#import "GoldFactory.h"

@implementation GoldFactory

#pragma mark - Initializers

#pragma mark - Public methods

- (GoldData *) newGoldFromHash:(NSData *)hash
{
    return nil;
}

#pragma mark - Acquiring protocol methods

- (AcquisitionData *)newAcquisitionFromBarcode:(NSString *)barcode
{
    return [self newGoldFromHash:[BarcodeHelper hashForBarcode:barcode]];
}

#pragma mark - Private methods

@end
