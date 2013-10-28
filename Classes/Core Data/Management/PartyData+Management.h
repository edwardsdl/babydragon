#import "PartyData.h"

@interface PartyData (Management)

+ (NSArray *)allParties;
+ (PartyData *)insertPartyWithName:(NSString *)name monsters:(NSArray *) monsters;
+ (PartyData *)partyWithName:(NSString *) name;
+ (void)removeAll;

@end
