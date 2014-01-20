#import "Floor.h"
#import "Tile.h"

@implementation Floor

- (id)initWithSize:(CGSize)size
{
    if (self = [super init])
    {
        NSMutableArray *tiles = [NSMutableArray array];
        
        for (int i = 0; i < size.width; i++)
        {
            NSMutableArray *column = [NSMutableArray array];
            for (int j = 0; j < size.height; j++)
            {
                [column addObject:[[Tile alloc] init]];
            }
            
            [tiles addObject:column];
        }
    }
    
    return self;
}

@end
