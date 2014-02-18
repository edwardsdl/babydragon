#import "GoldFactory.h"
#import <XCTest/XCTest.h>

@interface GoldFactoryTests : XCTestCase

@end

@implementation GoldFactoryTests

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testMonstersGeneratedFromIdenticalBarcode
{
    BOOL isIdenticalGoldAmount = YES;
    GoldFactory *goldFactory = [[GoldFactory alloc] init];
    NSString * barcode = @"Apple";
    
    int amount = [(GoldData *)[goldFactory newAcquisitionFromBarcode:barcode] amount];
    for (uint i = 0; i < 1000; i++)
    {
        isIdenticalGoldAmount &= [(GoldData *)[goldFactory newAcquisitionFromBarcode:barcode] amount] == amount;
    }
    
    XCTAssertTrue(isIdenticalGoldAmount, @"The generated gold amounts were identical.");
}

@end
