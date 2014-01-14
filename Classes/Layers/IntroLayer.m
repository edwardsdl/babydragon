//
//  IntroLayer.m
//  BabyDragon
//
//  Created by Eric Stenborg on 9/6/13.
//  Copyright First Light Games 2013. All rights reserved.
//

#import "IntroLayer.h"

@implementation IntroLayer

+(CCScene *) scene
{
	CCScene *scene = [CCScene node];
	IntroLayer *layer = [IntroLayer node];
	[scene addChild: layer];
	return scene;
}

-(id) init
{
	if( (self=[super init])) {

		//Ask director for the window size
		CGSize size = [[CCDirector sharedDirector] winSize];

        //Decide which logo we're going to use based on device and screen size
		CCSprite *background;
		if( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone )
        {
            CGSize screenSize = [[UIScreen mainScreen] bounds].size;
            
            if (screenSize.height >= 568.0f)
                background = [CCSprite spriteWithFile:@"Default-568h@2x.png"];
            else if (screenSize.height >= 480.0f)
                background = [CCSprite spriteWithFile:@"Default@2x.png"];
            else
                background = [CCSprite spriteWithFile:@"Default.png"];
            
			background.rotation = 90;
		}
        else
        {
			background = [CCSprite spriteWithFile:@"Default-Landscape~ipad.png"];
		}
		background.position = ccp(size.width/2, size.height/2);

		//Add the sprite to the layer
		[self addChild: background];
	}
	
	return self;
}

-(void) onEnter
{
    //Immediately setup a delay and callback to move to the next scene
	[super onEnter];
	double time = 1.0;
    id delay = [CCDelayTime actionWithDuration: time];
    id callbackAction = [CCCallFunc actionWithTarget: self selector: @selector(moveToNextScene)];
    id sequence = [CCSequence actions: delay, callbackAction, nil];
    [self runAction: sequence];
}

-(void) moveToNextScene
{
    //[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.5 scene:[MainMenuLayer scene] ]];
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.5 scene:[MapLayer scene] ]];
}
@end
