#import "AbilityDataInitializer.h"
#import "CoreDataHelper.h"
#import "DebugDataInitializer.h"
#import "DefaultMonsterDataInitializer.h"
#import "MonsterFactory.h"
#import <XCTest/XCTest.h>

@interface MonsterFactoryTests : XCTestCase

@end

@implementation MonsterFactoryTests

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

- (void)testMonstersGeneratedFromIdenticalBarcode
{
    BOOL isIdenticalMonster = YES;
    MonsterFactory *monsterFactory = [[MonsterFactory alloc] init];
    NSString *barcode = @"Apple";
    NSString *acquisitionName = ((MonsterData *)[monsterFactory newAcquisitionFromBarcode:barcode]).type;
    for (uint i = 0; i < 50; i++)
    {
        isIdenticalMonster &= [((MonsterData *)[monsterFactory newAcquisitionFromBarcode:barcode]).type isEqualToString:acquisitionName];
    }
    
    XCTAssertTrue(isIdenticalMonster, @"The generated monsters were identical.");
}

@end
