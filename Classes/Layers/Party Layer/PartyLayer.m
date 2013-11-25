#import "CCDirector+Utilities.h"
#import "CCScene+Utilities.h"
#import "CGPointExtension.h"
#import "MainMenuLayer.h"
#import "PartyData+Management.h"
#import "PartyIcon.h"
#import "PartyLayer.h"

@implementation PartyLayer

+ (CCScene *)scene
{
    return [CCScene sceneWithLayer:[[PartyLayer alloc] init]];
}

- (id)init
{
    if (self = [super init])
    {
        [self addCreatePartyLayer];
        [self addMenuLayer];
        [self addPartyIconLayer];
    }
    
    return self;
}

- (void)addCreatePartyLayer
{
    
}

- (void)addMenuLayer
{
    CCMenuItemFont *backToMainMenu = [CCMenuItemFont itemWithString:@"Back to main menu"
                                                              block:^(id sender)
    {
        [[CCDirector sharedDirector] replaceSceneUsingDefaultTransition:[MainMenuLayer scene]];
    }];
    [backToMainMenu setAnchorPoint:CGPointZero];
    
    CCMenu * menu = [CCMenu menuWithItems:backToMainMenu, nil];
    [menu setAnchorPoint:CGPointZero];
    [menu setPosition:ccp(0, 70)];
    
    [self addChild:menu];
}

- (void)addPartyIconLayer
{
    float x = 10;
    for (int i = 0; i < [[PartyData allParties] count]; i++)
    {
        PartyData *partyData = [[PartyData allParties] objectAtIndex:i];
        
        PartyIcon *partyIcon = [[PartyIcon alloc] initWithPartyData:partyData delegate:self];
        [partyIcon setPosition:ccp(x, 220)];
        
        x += [partyIcon boundingBox].size.width;
        
        [self addChild:partyIcon];
    }
}

- (void)clickedIconPartyUUID:(NSString *)uuid
{
    NSLog(@"");
}

@end
