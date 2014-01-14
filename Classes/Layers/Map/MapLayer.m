//
//  MapLayer.m
//  BabyDragon
//
//  Created by Eric Stenborg on 1/13/14.
//  Copyright 2014 First Light Games. All rights reserved.
//

#import "MapLayer.h"


@implementation MapLayer

+(CCScene *) scene
{
	CCScene *scene = [CCScene node];
	MapLayer *layer = [MapLayer node];
	[scene addChild: layer];
	return scene;
}

-(id) init
{
	if( (self=[super init]) )
    {
        //Ask director for the window size
		CGSize screenSize = [[CCDirector sharedDirector] winSize];
        
        //Add the map node
        MapNode* mapNode = [MapNode new];
        mapNode.position = ccp(screenSize.width/2, screenSize.height/2);
        [self addChild:mapNode];
        
        //Add the map menu
        MapMenu* mapMenu = [MapMenu new];
        mapMenu.position = ccp(0 + 25, 320 - 25);
        [self addChild:mapMenu];
        
    }
    return self;
}

@end
