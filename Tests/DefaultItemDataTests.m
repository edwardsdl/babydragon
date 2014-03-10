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

- (void)testDefaultItemCanBeInserted
{
    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
}

- (void)testFetchingAllDefaultItems
{
    NSArray *allDefaultItems = [DefaultItemData allDefaultItemData];
    
    XCTAssertNotNil(allDefaultItems, @"Default items are able to be fetched.");
    XCTAssertTrue([allDefaultItems count] > 0, @"At least one default item was fetched.");
}

- (void)testFetchingDefaultItem
{
    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
}

@end