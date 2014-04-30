#import "Tile.h"

@implementation Tile

- (id)initWithTileType:(TileType)tileType
{
    if (self = [super init])
    {
        _tileType = tileType;
    }
    
    return self;
}

@end
