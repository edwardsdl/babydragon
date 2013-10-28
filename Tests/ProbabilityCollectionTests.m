#import "ProbabilityCollection.h"
#import <XCTest/XCTest.h>

@interface ProbabilityCollectionTests : XCTestCase

- (BOOL)isNumber:(float)firstNumber withinPercentage:(float)percentage ofNumber:(float)secondNumber;

@end

@implementation ProbabilityCollectionTests

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testProbabilityOfRetrievedObjects
{
    float probabilityOfApple = 0.25;
    float probabilityOfBanana = 0.15;
    float probabilityOfGrapefruit = 0.35;
    float probabilityOfOrange = 0.05;
    float probabilityOfPineapple = 0.20;
    
    ProbabilityCollection * probabilityCollection = [[ProbabilityCollection alloc] init];
    [probabilityCollection addObject:@"FirstObject" withProbability:probabilityOfApple];
    [probabilityCollection addObject:@"SecondObject" withProbability:probabilityOfBanana];
    [probabilityCollection addObject:@"ThirdObject" withProbability:probabilityOfGrapefruit];
    [probabilityCollection addObject:@"FourthObject" withProbability:probabilityOfOrange];
    [probabilityCollection addObject:@"FifthObject" withProbability:probabilityOfPineapple];
    
    uint totalIterations = 1000000;
    uint totalApplesRecieved = 0;
    uint totalBananasRecieved = 0;
    uint totalGrapefruitsRecieved = 0;
    uint totalOrangesRecieved = 0;
    uint totalFifthObjectsRecieved = 0;
    for (uint i = 0; i < totalIterations; i++)
    {
        NSString * object = (NSString *)[probabilityCollection retrieveObject];
        if ([object isEqualToString:@"FirstObject"])
        {
            totalApplesRecieved++;
        }
        else if ([object isEqualToString:@"SecondObject"])
        {
            totalBananasRecieved++;
        }
        else if ([object isEqualToString:@"ThirdObject"])
        {
            totalGrapefruitsRecieved++;
        }
        else if ([object isEqualToString:@"FourthObject"])
        {
            totalOrangesRecieved++;
        }
        else if ([object isEqualToString:@"FifthObject"])
        {
            totalFifthObjectsRecieved++;
        }
    }
    
    XCTAssertTrue([self isNumber:totalApplesRecieved / (float)totalIterations
               withinPercentage:0.005
                       ofNumber:probabilityOfApple],
                 @"Roughly the correct number of apples was recieved.");
    
    XCTAssertTrue([self isNumber:totalBananasRecieved / (float)totalIterations
               withinPercentage:0.005
                       ofNumber:probabilityOfBanana],
                 @"Roughly the correct number of banannas was recieved.");
    
    XCTAssertTrue([self isNumber:(double)totalGrapefruitsRecieved / (float)totalIterations
               withinPercentage:0.005
                       ofNumber:probabilityOfGrapefruit],
                 @"Roughly the correct number of grapefruits was recieved.");
    
    XCTAssertTrue([self isNumber:totalOrangesRecieved / (float)totalIterations
               withinPercentage:0.005
                       ofNumber:probabilityOfOrange],
                 @"Roughly the correct number oranges was recieved.");
    
    XCTAssertTrue([self isNumber:totalFifthObjectsRecieved / (float)totalIterations
               withinPercentage:0.005
                       ofNumber:probabilityOfPineapple],
                 @"Roughly the correct number of pineapples was recieved.");
}

- (void)testNormalization
{
    float probabilityOfApple = 0.2;
    float probabilityOfOrange = 0.2;
    float probabilityOfBanana = 0.2;
    float probabilityOfPineapple = 0.2;
    
    ProbabilityCollection * probabilityCollection = [[ProbabilityCollection alloc] init];
    [probabilityCollection addObject:@"Apple" withProbability:probabilityOfApple];
    [probabilityCollection addObject:@"Banana" withProbability:probabilityOfBanana];
    [probabilityCollection addObject:@"Orange" withProbability:probabilityOfOrange];
    [probabilityCollection addObject:@"Pineapple" withProbability:probabilityOfPineapple];
    
    // Trigger the normalization method by requesting an object.
    [probabilityCollection retrieveObject];
    
    BOOL isProbabilityCollectionNormalized = YES;
    for (NSArray * item in [probabilityCollection valueForKey:@"_probabilityCollection"])
    {
        isProbabilityCollectionNormalized &= [[item objectAtIndex:0] doubleValue] == 0.25;
    }
    
    XCTAssertTrue(isProbabilityCollectionNormalized, @"The probability collection is normalized.");
}

- (BOOL)isNumber:(float)firstNumber withinPercentage:(float)percentage ofNumber:(float)secondNumber
{
    double upperBound = secondNumber * (1 + percentage);
    double lowerBound = secondNumber * (1 - percentage);
    
    return firstNumber >= lowerBound && firstNumber <= upperBound;
}

@end
