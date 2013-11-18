#import <Foundation/Foundation.h>

@protocol PartyIconDelegate <NSObject>

- (void)clickedIconPartyUUID:(NSString *)uuid;

@end