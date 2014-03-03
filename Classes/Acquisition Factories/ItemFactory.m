#import "BarcodeHelper.h"
#import "DefaultItemData+Management.h"
#import "ItemData+Management.h"
#import "ItemFactory.h"
#import "NSData+ByteUtilities.h"
#import "ProbabilityCollection.h"

@interface ItemFactory ()
{
    ProbabilityCollection *_itemProbabilityCollection;
}

- (void)populateItemProbabilityCollection;

@end

@implementation ItemFactory

#pragma mark - Initializers

- (id)init
{
    if (self = [super init])
    {
        _itemProbabilityCollection = [[ProbabilityCollection alloc] init];
        [self populateItemProbabilityCollection];
    }
    
    return self;
}

#pragma mark - Public methods

- (ItemData *)newItemFromBarcode:(NSString *)barcode
{
    uint8_t byte = [[BarcodeHelper hashForBarcode:barcode] byteAtIndex:1];
    
    NSString *uuid = (NSString *)[_itemProbabilityCollection retrieveObjectUsingRandomFloat:byte / 255.0];
    
    return [ItemData insertItemDataWithDefaultItemDataUUID:uuid];
}

#pragma mark - Acquiring protocol methods

- (AcquisitionData *)newAcquisitionFromBarcode:(NSString *)barcode
{
    return [self newItemFromBarcode:barcode];
}

#pragma mark - Private methods

- (void)populateItemProbabilityCollection
{
    for (DefaultItemData *defaultItemData in [DefaultItemData allDefaultItemData])
    {
        [_itemProbabilityCollection addObject:defaultItemData.uuid
                              withProbability:defaultItemData.probability];
    }
}

@end
