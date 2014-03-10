#import "CoreDataHelper.h"
#import <XCTest/XCTest.h>

@interface ItemDataTests : XCTestCase

@end

@implementation ItemDataTests

- (void)setUp
{
    [super setUp];
    [[CoreDataHelper sharedInstance] reset];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testFetchingAllItems
{
    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
}

- (void)testFetchingItem
{
    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
}

- (void)testInsertingItem
{
    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
}

- (void)testRemovingAllItems
{
    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
}

@end
