#import <Foundation/Foundation.h>

@interface Level : NSObject

@property (nonatomic, readonly, strong) NSMutableArray *floors;

// Designated initializer
- (id)initWithFloorCount:(int)floorCount;

@end
