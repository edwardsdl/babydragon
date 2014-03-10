#import "DefaultItemData+Management.h"
#import <XCTest/XCTest.h>

@interface DefaultItemDataTests : XCTestCase

@end

@implementation DefaultItemDataTests

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testFetchingAllDefaultItemData
{
    NSArray *allDefaultItemData = [DefaultItemData allDefaultItemData];
    
    if (allDefaultItemData != nil)
    {
        XCTAssertTrue([allDefaultItemData count] > 0,
                      @"Default item data was fetched.");
    }
    else
    {
        XCTFail(@"Default item data was fetched.");
    }
}

@end