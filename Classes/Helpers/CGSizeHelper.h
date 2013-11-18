#import <Foundation/Foundation.h>

@interface CGSizeHelper : NSObject

+ (CGSize)sizeEnclosingRects:(NSValue *)value, ... NS_REQUIRES_NIL_TERMINATION;

@end
