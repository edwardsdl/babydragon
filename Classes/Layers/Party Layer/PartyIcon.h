#import "PartyData.h"
#import "PartyIconDelegate.h"
#import "TouchableNode.h"

@interface PartyIcon : TouchableNode

- (id)initWithPartyData:(PartyData *)partyData delegate:(id<PartyIconDelegate>)delegate;

@end
