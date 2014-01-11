//
//  MyMonstersLayer.m
//  BabyDragon
//
//  Created by Eric Stenborg on 12/8/13.
//  Copyright 2013 First Light Games. All rights reserved.
//

#import "MyMonstersLayer.h"


@implementation MyMonstersLayer

+(CCScene *) scene
{
	CCScene *scene = [CCScene node];
	MyMonstersLayer *layer = [MyMonstersLayer node];
	[scene addChild: layer];
	return scene;
}

-(id) init
{
	if( (self=[super init]) )
    {
        self.touchEnabled = true;
        
        MonsterNode* monsterNode = [MonsterNode Create];
        monsterNode.position = ccp(380, 180);
        [self addChild:monsterNode];
        
        ScrollingMonstersList* list = [[ScrollingMonstersList alloc] init:monsterNode];
        list.position = ccp((220 / 2) + 5, 320 - (42.5 / 2) - 5);
        [self addChild:list];
        
        FLLayerNavigationNode* backButton = [FLLayerNavigationNode createWithLayerType:@"ManageLayer" dimensions:CGSizeMake(110, 25) label:@"Back" size:14];
        backButton.position = ccp(568 - 32 - 55, 30);
        [self addChild:backButton];
    }
    
    return self;
}

@end
