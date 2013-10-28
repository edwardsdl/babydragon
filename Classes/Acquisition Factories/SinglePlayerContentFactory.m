#import "BarcodeHelper.h"
#import "SinglePlayerContentFactory.h"

@implementation SinglePlayerContentFactory

#pragma mark - Initializers

#pragma mark - Public methods

- (SinglePlayerContentData *) newSinglePlayerContentFromHash:(NSData *)hash
{
    return nil;
}

#pragma mark - Acquiring protocol methods

- (AcquisitionData *)newAcquisitionFromBarcode:(NSString *)barcode
{
    return [self newSinglePlayerContentFromHash:[BarcodeHelper hashForBarcode:barcode]];
}

#pragma mark - Private methods

@end
