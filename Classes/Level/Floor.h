#import <Foundation/Foundation.h>

@interface Floor : NSObject

@property (nonatomic, readonly, strong) NSArray *rooms;
@property (nonatomic, readonly, strong) NSArray *tiles;

// Designated initializer
- (id)initWithSize:(CGSize)size;

@end
