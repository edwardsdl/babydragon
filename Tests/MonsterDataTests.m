#import "CoreDataHelper.h"
#import "MonsterData+Management.h"
#import <XCTest/XCTest.h>

@interface MonsterDataTests : XCTestCase
{
    CoreDataHelper *_coreDataHelper;
    NSManagedObjectContext *_managedObjectContext;
}

@end

@implementation MonsterDataTests

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testMonsterCanBeInsertedAndFetched
{
    NSString *name = @"Baby Dragon Test";
    
    MonsterData *monsterData = [MonsterData insertMonsterWithType:@"Baby_Dragon" barcode:@"No Barcode"];
    [monsterData setName:name];
    
    NSError *error;
    [[[CoreDataHelper sharedInstance] managedObjectContext] save:&error];
    
    XCTAssertNil(error, @"The monster was inserted successfully.");
    
    monsterData = [MonsterData monsterWithName:name];
    
    XCTAssertNotNil(monsterData, @"The monster was fetched successfully.");
}

@end
