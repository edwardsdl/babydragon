//
//  ManageLayer.m
//  BabyDragon
//
//  Created by Eric Stenborg on 12/8/13.
//  Copyright 2013 First Light Games. All rights reserved.
//

#import "ManageLayer.h"


@implementation ManageLayer

+(CCScene *) scene
{
	CCScene *scene = [CCScene node];
	ManageLayer *layer = [ManageLayer node];
	[scene addChild: layer];
	return scene;
}

-(id) init
{
	if( (self=[super init]) )
    {
        self.touchEnabled = true;
        
        self->myMonstersButton = [FLLayerNavigationNode createWithLayerType:@"MyMonstersLayer" dimensions:CGSizeMake(220, 220) label:@"My Monsters" size:24];
        self->myMonstersButton.position = ccp(142, 178);
        [self addChild:self->myMonstersButton];
        
        self->myPartiesButton = [FLLayerNavigationNode createWithLayerType:@"MyPartiesLayer" dimensions:CGSizeMake(220, 220) label:@"My Parties" size:24];
        self->myPartiesButton.position = ccp(142 + 220 + 64, 178);
        [self addChild:self->myPartiesButton];
        
        self->backButton = [FLLayerNavigationNode createWithLayerType:@"MapLayer" dimensions:CGSizeMake(110, 25) label:@"Back" size:14];
        self->backButton.position = ccp(568 - 32 - 55, 30);
        [self addChild:self->backButton];
    }
    
    return self;
}
@end
