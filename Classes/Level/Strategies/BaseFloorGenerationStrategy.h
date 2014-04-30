#import "FloorGenerating.h"
#import <Foundation/Foundation.h>
#import "Tile.h"

@interface BaseFloorGenerationStrategy : NSObject <FloorGenerating>
{
    @protected
    CGSize _size;
    NSArray *_tiles;
}

- (Tile *)getTileAtLocation:(CGPoint)location;
- (CGPoint)getRandomLocation;
- (BOOL)isFloorEdgeAtLocation:(CGPoint)location;

@end
