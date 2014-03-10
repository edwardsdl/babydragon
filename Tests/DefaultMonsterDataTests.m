#import "CoreDataHelper.h"
#import "DefaultMonsterData+Management.h"
#import "DefaultMonsterDataInitializer.h"
#import <XCTest/XCTest.h>

@interface DefaultMonsterDataTests : XCTestCase

@end

@implementation DefaultMonsterDataTests

- (void)setUp
{
    [super setUp];
    [[CoreDataHelper sharedInstance] reset];
    [DefaultMonsterDataInitializer initializeData];
}

- (void)tearDown
{
    [[CoreDataHelper sharedInstance] reset];
    [super tearDown];
}

- (void)testFetchingAllDefaultMonsters
{
    NSArray *allDefaultMonsters = [DefaultMonsterData allDefaultMonsterData];
    
    XCTAssertNotNil(allDefaultMonsters, @"Default monsters are able to be fetched.");
    XCTAssertTrue([allDefaultMonsters count] > 0, @"At least one default monster was fetched.");
}

- (void)testFetchingDefaultMonster
{
    DefaultMonsterData *defaultMonster = [DefaultMonsterData defaultMonsterDataForType:@"Baby_Dragon"];
    
    XCTAssertNotNil(defaultMonster, @"Default monsters are able to be fetched.");
    XCTAssertTrue([defaultMonster.type isEqualToString: @"Baby_Dragon"], @"Default monster data for a baby dragon was fetched.");
}

- (void)testInsertingDefaultMonster
{
    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
}

- (void)testRemovingAllDefaultMonsters
{
    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
}

@end