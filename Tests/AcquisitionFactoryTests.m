#import "AcquisitionFactory.h"
#import "CoreDataHelper.h"
#import <XCTest/XCTest.h>

@interface AcquisitionFactoryTests : XCTestCase

@end

@implementation AcquisitionFactoryTests

- (void)setUp
{
    [super setUp];
    [[CoreDataHelper sharedInstance] reset];
    [[CoreDataHelper sharedInstance] initializePersistentObjectStore];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testAcquisitionFactoryGeneratesAcquisitions
{
    int totalIterations = 1000;
    AcquisitionFactory *acquisitionFactory = [[AcquisitionFactory alloc] init];
    for (int i = 0; i < totalIterations; i++)
    {
        NSString *barcode = [NSString stringWithFormat:@"%d", i];
        
        XCTAssertNotNil([acquisitionFactory newAcquisitionFromBarcode:barcode], @"The barcode %@ generated an acquisition.", barcode);
    }
}

@end
