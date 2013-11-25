@interface TouchableNode : CCNode <CCTouchAllAtOnceDelegate>

- (BOOL)isTouchWithinBoundingBox:(UITouch *)touch;

@end
