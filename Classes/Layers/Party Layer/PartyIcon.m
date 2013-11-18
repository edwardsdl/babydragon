#import "CGSizeHelper.h"
#import "MonsterData.h"
#import "PartyIcon.h"

@implementation PartyIcon
{
    id<PartyIconDelegate> _delegate;
    PartyData *_partyData;
}

- (id)initWithPartyData:(PartyData *)partyData delegate:(id<PartyIconDelegate>)delegate
{
    if (self = [super init])
    {
        _delegate = delegate;
        _partyData = partyData;
        
        CCLabelTTF *label = [CCLabelTTF labelWithString:[partyData name]
                                               fontName:@"Arial Rounded MT Bold"
                                               fontSize:14];
        [label setAnchorPoint:CGPointZero];
        [self addChild:label];
        
        CCSprite *image = [CCSprite spriteWithFile:[NSString stringWithFormat:@"%@_Standing.png", [((MonsterData *)[[partyData monsters] anyObject]) type]]];
        [image setAnchorPoint:CGPointMake(0.5, 0)];
        [image setPosition:ccp([label boundingBox].size.width / 2,
                               [label boundingBox].size.height)];
        [self addChild:image];
        
        CGSize contentSize = [CGSizeHelper sizeEnclosingRects:
                              [NSValue valueWithCGRect:[label boundingBox]],
                              [NSValue valueWithCGRect:[image boundingBox]],
                              nil];
        [self setContentSize:contentSize];
    }
    
    return self;
}

-(void) ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if ([self isTouchWithinBoundingBox:[touches anyObject]])
    {
        [_delegate clickedIconPartyUUID:[_partyData uuid]];
    }
}

@end
