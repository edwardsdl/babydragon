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

- (void)testExample
{
    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
}

@end
