#import "TouchableNode.h"

@implementation TouchableNode

- (void)onEnter
{
    [super onEnter];
    [[[CCDirector sharedDirector] touchDispatcher] addStandardDelegate:self priority:0];
}

- (void)onExit
{
    [[[CCDirector sharedDirector] touchDispatcher] removeDelegate:self];
    [super onExit];
}

- (BOOL)isTouchWithinBoundingBox:(UITouch *)touch
{
    CGPoint point = [touch locationInView:[touch view]];
    point = [[CCDirector sharedDirector] convertToGL:point];
    point = [self convertToNodeSpace:point];
    
    CGRect boundingBox = [self boundingBox];
    boundingBox.origin = CGPointZero;
    
    return CGRectContainsPoint(boundingBox,
                               point);
}


@end
