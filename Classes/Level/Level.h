#import <Foundation/Foundation.h>
#import "ElementType.h"

@interface Level : NSObject

@property (nonatomic, readonly, strong) NSMutableArray *floors;

@property (nonatomic) ElementType elementType;

@property (nonatomic) int minLevel;

@property (nonatomic) int maxLevel;

// Designated initializer
- (id)initWithFloorCount:(int)floorCount;

@end
