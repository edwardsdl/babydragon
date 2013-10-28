#import "CCScene+Utilities.h"

@implementation CCScene (Utilities)

+ (CCScene *)sceneWithLayer:(CCLayer *)layer
{
    CCScene *scene = [CCScene node];
    [scene addChild:layer];
    
    return scene;
}

@end
