#import "CCMenu.h"
#import "CCMenuItem.h"
#import "CCScene+Utilities.h"
#import "MonsterData+Management.h"
#import "RosterLayer.h"

@implementation RosterLayer
{
    NSMutableDictionary *_monsterSprites;
}

+ (CCScene *)scene
{
    return [CCScene sceneWithLayer:[[RosterLayer alloc] init]];
}

- (id)init
{
    if(self = [super init])
    {
        _monsterSprites = [NSMutableDictionary dictionary];
        for (MonsterData *monsterData in [MonsterData allMonsters])
        {
            CCSprite *monsterSprite = [CCSprite spriteWithFile:[NSString stringWithFormat:@"%@_Standing.png", [monsterData type]]];
            [monsterSprite setPosition:ccp(300, 220)];
            [monsterSprite setVisible:NO];
            [self addChild:monsterSprite];
            
            [_monsterSprites setObject:monsterSprite forKey:[monsterData type]];
        }
        
        CCMenu *menu = [CCMenu menuWithItems: nil];
        for (MonsterData *monster in [MonsterData allMonsters])
        {
            CCLabelTTF *label = [CCLabelTTF labelWithString:[monster name]
                                                   fontName:@"Arial Rounded MT Bold"
                                                   fontSize:24];
            
            CCMenuItem *menuItem = [CCMenuItemLabel itemWithLabel:label target:self selector:@selector(showMonsterData:)];
            [menuItem setAnchorPoint:CGPointMake(0, 0.5f)];
            [menu addChild:menuItem];
        }

        [menu alignItemsVertically];
        [menu setPosition:ccp(10, 220)];
        
        [self addChild: menu];
        
//        CCMenuItemFont *backItem = [CCMenuItemFont itemWithString:@"Back to Main Menu" target:self selector:@selector(backToMainMenu)];
//        backItem.fontSize = 26;
//        backItem.fontName = @"Arial Rounded MT Bold";
//        
//        CCMenu * myMenu = [CCMenu menuWithItems:backItem, nil];
//        [myMenu alignItemsVertically];
//        myMenu.position = ccp(viewSize.width/2, 70);
//        [self addChild:myMenu];
    }
    
    return self;
}

- (void)showMonsterData:(CCMenuItem *)menuItem
{
    CCSprite * monsterSprite = [_monsterSprites objectForKey:@"Baby_Dragon"];
    [monsterSprite setVisible:YES];
}

@end
