#import <Foundation/Foundation.h>
#import "TileType.h"

@interface Tile : NSObject

@property(nonatomic) int tileType;

// Designated initializer
- (id)initWithType:(TileType)tileType;

@end
