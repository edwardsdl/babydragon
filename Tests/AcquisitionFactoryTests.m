#import "AcquisitionFactory.h"
#import <XCTest/XCTest.h>

@interface AcquisitionFactoryTests : XCTestCase

@end

@implementation AcquisitionFactoryTests

- (void)setUp
{
    [super setUp];
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
