#import "BaseData+Management.h"
#import "CoreDataHelper.h"
#import "NSManagedObjectContext+Management.h"
#import "PartyData+Management.h"
#import "UUIDHelper.h"

@implementation PartyData (Management)

static NSString *entityName = @"PartyData";

+ (NSArray *)allParties
{
    NSManagedObjectContext *managedObjectContext = [[CoreDataHelper sharedInstance] managedObjectContext];
    
    return [managedObjectContext objectsForEntityName:entityName];
}

+ (PartyData *)anyPartyWithName:(NSString *)name
{
    NSManagedObjectContext *managedObjectContext = [[CoreDataHelper sharedInstance] managedObjectContext];
    
    NSArray * results = [managedObjectContext objectsFromFetchRequestTemplateWithName:@"GetAnyPartyWithName"
                                                                substitutionVariables:@{@"NAME": name}];
    
    return results.count > 0
        ? (PartyData *)[results objectAtIndex:0]
        : nil;
}

+ (PartyData *)insertPartyWithName:(NSString *)name monsters:(NSArray *) monsters
{
    NSManagedObjectContext *managedObjectContext = [[CoreDataHelper sharedInstance] managedObjectContext];
    
    PartyData *partyData = [NSEntityDescription insertNewObjectForEntityForName:entityName
                                                         inManagedObjectContext:managedObjectContext];
    partyData.name = name;
    [partyData addMonsters:[NSSet setWithArray:monsters]];
    
    return partyData;
}

+ (PartyData *)partyWithUUID:(NSString *)uuid
{
    return (PartyData *)[self baseDataWithUUID:uuid];
}

+ (void)removeAll
{
    NSManagedObjectContext *managedObjectContext = [[CoreDataHelper sharedInstance] managedObjectContext];
    
    for (PartyData *partyData in [self allParties])
    {
        [managedObjectContext deleteObject:partyData];
    }
    
    [[CoreDataHelper sharedInstance] save];
}

@end
