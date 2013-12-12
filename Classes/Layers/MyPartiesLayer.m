//
//  MyPartiesLayer.m
//  BabyDragon
//
//  Created by Eric Stenborg on 12/8/13.
//  Copyright 2013 First Light Games. All rights reserved.
//

#import "MyPartiesLayer.h"


@implementation MyPartiesLayer

+(CCScene *) scene
{
	CCScene *scene = [CCScene node];
	MyPartiesLayer *layer = [MyPartiesLayer node];
	[scene addChild: layer];
	return scene;
}

-(id) init
{
	if( (self=[super init]) )
    {
        self.touchEnabled = true;
    }
    
    return self;
}

@end
