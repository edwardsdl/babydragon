#import "CoreDataHelper.h"
#import "MonsterData+Management.h"
#import <XCTest/XCTest.h>

@interface MonsterDataTests : XCTestCase

@end

@implementation MonsterDataTests

- (void)setUp
{
    [super setUp];
    [[CoreDataHelper sharedInstance] reset];
    [[CoreDataHelper sharedInstance] initializePersistentObjectStore];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testFetchingAllMonsters
{
    NSArray *allMonsters = [MonsterData allMonsters];
    
    XCTAssertNotNil(allMonsters, @"Monsters are able to be fetched successfully.");
    XCTAssertTrue([allMonsters count] > 0, @"At least one monster was fetched.");
}

- (void)testMonsterCanBeInserted
{
    NSString *name = @"Baby Dragon Test";
    
    MonsterData *monsterData = [MonsterData insertMonsterWithType:@"Baby_Dragon" barcode:@"No Barcode"];
    monsterData.name = name;
    
    BOOL wasSaveSuccessful = [[CoreDataHelper sharedInstance] save];
    
    XCTAssertTrue(wasSaveSuccessful, @"The monster was inserted successfully.");
    
    monsterData = [MonsterData monsterWithUUID:monsterData.uuid];
    
    XCTAssertNotNil(monsterData, @"The monster was fetched successfully.");
}

@end
