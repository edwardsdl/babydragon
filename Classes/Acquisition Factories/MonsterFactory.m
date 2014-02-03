#import "BarcodeHelper.h"
#import "DefaultMonsterData+Management.h"
#import "ElementType.h"
#import "MonsterFactory.h"
#import "NSData+ByteUtilities.h"
#import "ProbabilityCollection.h"

@interface MonsterFactory ()
{
    ProbabilityCollection *_monsterProbabilityCollection;
}

- (void)populateMonsterProbabilityCollection;

@end

@implementation MonsterFactory

#pragma mark - Initializers

- (id)init
{
    if (self = [super init])
    {
        _monsterProbabilityCollection = [[ProbabilityCollection alloc] init];
        [self populateMonsterProbabilityCollection];
    }
    
    return self;
}

#pragma mark - Public methods

- (MonsterData *)newMonsterFromBarcode:(NSString *)barcode
{
    uint8_t byte = [[BarcodeHelper hashForBarcode:barcode] byteAtIndex:1];
    
    NSString *type = (NSString *)[_monsterProbabilityCollection retrieveObjectUsingRandomFloat:byte / 255.0];
    
    return [MonsterData insertMonsterWithType:type barcode:barcode];
}

#pragma mark - Acquiring protocol methods

- (AcquisitionData *)newAcquisitionFromBarcode:(NSString *)barcode
{
    return [self newMonsterFromBarcode:barcode];
}

#pragma mark - Private methods

- (void)populateMonsterProbabilityCollection
{
    for (DefaultMonsterData *defaultMonsterData in [DefaultMonsterData allDefaultMonsterData])
    {
        [_monsterProbabilityCollection addObject:[defaultMonsterData type] withProbability:[defaultMonsterData probability]];
    }
}

@end
