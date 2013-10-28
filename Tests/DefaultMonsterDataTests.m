#import "DefaultMonsterData+Management.h"
#import <XCTest/XCTest.h>

@interface DefaultMonsterDataTests : XCTestCase

@end

@implementation DefaultMonsterDataTests

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testFetchingDefaultMonsterData
{
    DefaultMonsterData * defaultMonsterData = [DefaultMonsterData defaultMonsterDataForType:@"Baby_Dragon"];
    
    if (defaultMonsterData != nil)
    {
        XCTAssertTrue([[defaultMonsterData type] isEqualToString: @"Baby_Dragon"],
                      @"Default monster data for a baby dragon was fetched.");
    }
    else
    {
        XCTFail(@"Default monster data was fetched.");
    }
}

@end