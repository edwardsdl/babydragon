#import "Tile.h"

@implementation Tile

#pragma mark - Initializers
- (id)initWithType:(TileType)tileType
{
    if (self = [super init])
    {
        self.tileType = tileType;
    }
    
    return self;
}

@end
