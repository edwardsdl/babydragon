#import "PartyData.h"

@interface PartyData (Management)

+ (NSArray *)allParties;
+ (PartyData *)anyPartyWithName:(NSString *)name;
+ (PartyData *)insertPartyWithName:(NSString *)name monsters:(NSArray *) monsters;
+ (PartyData *)partyWithUUID:(NSString *) uuid;
+ (void)removeAll;

@end
