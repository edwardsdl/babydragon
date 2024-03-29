//
//  HelloWorldLayer.m
//  BabyDragon
//
//  Created by Eric Stenborg on 9/6/13.
//  Copyright First Light Games 2013. All rights reserved.
//

#import "MainMenuLayer.h"
#import "CombatLayer.h"
#import "AppDelegate.h"
#import "ScanMenuLayer.h"
#import "ManageLayer.h"
#import "PartyData+Management.h"
#import "MonsterData+Management.h"
#import "MonsterData.h"

@implementation MainMenuLayer

+(CCScene *) scene
{
	CCScene *scene = [CCScene node];
	MainMenuLayer *layer = [MainMenuLayer node];
	[scene addChild: layer];
	return scene;
}

-(id) init
{
	if( (self=[super init]) )
    {
        self.touchEnabled = true;
    
        // ask director for the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
        
        //Create the menu background
        CCSprite *backgroundSprite = [CCSprite spriteWithFile:@"MenuBackground.png"];
        backgroundSprite.position = ccp(size.width/2, size.height/2);
        [self addChild:backgroundSprite];
        
        //Create a menu
        CCMenuItemFont *scanNowMenuItem = [CCMenuItemFont itemWithString:@"Scan Now" target:self selector:@selector(goToScanMenu)];
        scanNowMenuItem.fontSize = 16;
        scanNowMenuItem.fontName = @"Arial Rounded MT Bold";
        
        CCMenuItemFont *singlePlayerMenuItem = [CCMenuItemFont itemWithString:@"Manage" target:self selector:@selector(goToManageLayer)];
        singlePlayerMenuItem.fontSize = 16;
        singlePlayerMenuItem.fontName = @"Arial Rounded MT Bold";
        
        CCMenuItemFont *debugBattleMenuItem = [CCMenuItemFont itemWithString:@"Debug Battle" target:self selector:@selector(goToDebugBattle)];
        debugBattleMenuItem.fontSize = 16;
        debugBattleMenuItem.fontName = @"Arial Rounded MT Bold";
        
        CCMenu * myMenu = [CCMenu menuWithItems:scanNowMenuItem, singlePlayerMenuItem, debugBattleMenuItem, nil];
        [myMenu alignItemsVertically];
        myMenu.position = ccp(120, size.height/2);
        [self addChild:myMenu];
	}
	return self;
}

-(void) doNothing
{
    
}

-(void) goToScanMenu
{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[ScanMenuLayer scene] ]];

}

-(void) goToManageLayer
{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[ManageLayer scene]]];
    
}

-(void) goToDebugBattle
{
    PartyData *partyOne = [PartyData anyPartyWithName:@"Player Party"];
    PartyData *partyTwo = [PartyData anyPartyWithName:@"AI Party"];
    
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0
                                                                                 scene:[CombatLayer sceneWithPartyOne:partyOne
                                                                                                          andPartyTwo:partyTwo
                                                                                                  withBackgroundNamed:@"Test"
                                                                                        nextLayer:CombatNextLayerMap]]];
}

@end
