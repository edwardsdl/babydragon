#import "CCDirector+Utilities.h"

@implementation CCDirector (Utilities)

- (void)replaceSceneUsingDefaultTransition:(CCScene *)scene
{
    [self replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:scene]];
}

@end
