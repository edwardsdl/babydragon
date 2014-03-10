#import "CoreDataHelper.h"
#import "DefaultItemData+Management.h"
#import "DefaultItemDataInitializer.h"
#import <XCTest/XCTest.h>

@interface DefaultItemDataTests : XCTestCase

@end

@implementation DefaultItemDataTests

- (void)setUp
{
    [super setUp];
    [[CoreDataHelper sharedInstance] reset];
    [DefaultItemDataInitializer initializeData];
}

- (void)tearDown
{
    [super tearDown];
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

- (void)testInsertingDefaultItems
{
    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
}

- (void)testRemovingAllDefaultItems
{
    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
}

@end