#import <Foundation/Foundation.h>
#import "TileType.h"

@interface Tile : NSObject

@property (nonatomic, readonly) TileType tileType;

// Designated initializer
- (id)initWithTileType:(TileType)tileType;

@end
