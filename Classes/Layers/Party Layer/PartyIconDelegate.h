#import <Foundation/Foundation.h>

@protocol PartyIconDelegate <NSObject>

- (void)clickedIconWithLabelText:(NSString *)label;

@end
