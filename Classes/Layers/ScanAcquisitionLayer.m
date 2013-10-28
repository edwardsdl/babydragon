//
//  ScanAcquisitionLayer.m
//  BabyDragon
//
//  Created by Eric Stenborg on 9/13/13.
//  Copyright 2013 First Light Games. All rights reserved.
//

#import "AppDelegate.h"
#import "CoreDataHelper.h"
#import "ScanAcquisitionLayer.h"
#import "MonsterData.h"
#import "Player.h"
#import "cocos2d.h"
#import "MainMenuLayer.h"
#import "MonsterFactory.h"


@implementation ScanAcquisitionLayer

+(CCScene *) sceneWithBarCodeNumber:(NSString*) number
{
	CCScene *scene = [CCScene node];
	ScanAcquisitionLayer *layer = [[ScanAcquisitionLayer alloc] initWithBarCodeNumber:number];
	[scene addChild: layer];
	return scene;
}

-(id) initWithBarCodeNumber:(NSString*) number
{
    if( (self=[super init]) )
    {
        CGSize size = [[CCDirector sharedDirector] winSize];
        
        //Get a monster from the scan number
        MonsterFactory *monsterFactory = [MonsterFactory new];
        MonsterData *monster = (MonsterData*)[monsterFactory newAcquisitionFromBarcode:number];
        [[[CoreDataHelper sharedInstance] managedObjectContext] save:nil];
        
        CCLabelTTF *label = [CCLabelTTF labelWithString:@"You got...." fontName:@"Arial Rounded MT Bold" fontSize:24];
        label.position = ccp(size.width / 2, 300);
        [self addChild:label];
        
        CCSprite *monsterSprite = [CCSprite spriteWithFile:[NSString stringWithFormat:@"%@_Standing.png", monster.type]];
        monsterSprite.position = ccp(size.width / 2, size.height / 2);
        [self addChild:monsterSprite];
        
        //Back to the main menu
        CCMenuItemFont *backItem = [CCMenuItemFont itemWithString:@"Back to Main Menu" target:self selector:@selector(backToMainMenu)];
        backItem.fontSize = 26;
        backItem.fontName = @"Arial Rounded MT Bold";
        
        CCMenu * myMenu = [CCMenu menuWithItems:backItem, nil];
        [myMenu alignItemsVertically];
        myMenu.position = ccp(size.width/2, 70);
        [self addChild:myMenu];
    }
    
    return self;
}

-(void)backToMainMenu
{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[MainMenuLayer scene] ]];
}

@end
