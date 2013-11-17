#import "UUIDHelper.h"
#import <XCTest/XCTest.h>

@interface UUIDHelperTests : XCTestCase

@end

@implementation UUIDHelperTests

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testUUIDCanBeCreated
{
    NSString *uuid = [UUIDHelper createUUIDString];
    
    XCTAssertNotNil(uuid, @"A UUID was created.");
}

@end
