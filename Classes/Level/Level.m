#import "Level.h"
#import "Floor.h"

@implementation Level

- (id)initWithFloorCount:(int)floorCount
{
    if (self = [super init])
    {
        NSMutableArray *floors = [NSMutableArray array];
        
        for (int i = 0; i < floorCount; i++)
        {
            [floors addObject:[[Floor alloc] init]];
        }
        
        _floors = floors;
    }
    
    return self;
}

@end
