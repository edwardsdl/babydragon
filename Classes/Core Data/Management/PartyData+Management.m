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

+ (PartyData *)insertPartyWithName:(NSString *)name monsters:(NSArray *) monsters
{
    NSManagedObjectContext *managedObjectContext = [[CoreDataHelper sharedInstance] managedObjectContext];
    
    PartyData *partyData = [NSEntityDescription insertNewObjectForEntityForName:entityName
                                                         inManagedObjectContext:managedObjectContext];
    [partyData setName:name];
    [partyData setUuid:[UUIDHelper createUUIDString]];
    
    [partyData addMonsters:[NSSet setWithArray:monsters]];
    
    return partyData;
}

+ (PartyData *)partyWithName:(NSString *) name
{
    NSManagedObjectContext *managedObjectContext = [[CoreDataHelper sharedInstance] managedObjectContext];
    
    NSArray * results = [managedObjectContext objectsFromFetchRequestTemplateWithName:@"GetPartyWithName"
                                                                substitutionVariables:@{@"NAME": name}];
    
    return [results count] > 0
        ? (PartyData *)[results objectAtIndex:0]
        : nil;
}

+ (void)removeAll
{
    NSManagedObjectContext *managedObjectContext = [[CoreDataHelper sharedInstance] managedObjectContext];
    
    for (PartyData *partyData in [self allParties])
    {
        [managedObjectContext deleteObject:partyData];
    }
    
    NSError *error = nil;
    [managedObjectContext save:&error];
    
    if (error != nil)
    {
        NSLog(@"Failed to remove all parties.");
    }
}

@end
