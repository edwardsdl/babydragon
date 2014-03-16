#import <Foundation/Foundation.h>

@interface Floor : NSObject

@property (nonatomic, retain, strong) NSMutableArray *rooms;
@property (nonatomic, retain, strong) NSMutableArray *tiles;

// Designated initializer
- (id)initWithSize:(CGSize)size;

@end
