//
//  ManageLayer.h
//  BabyDragon
//
//  Created by Eric Stenborg on 12/8/13.
//  Copyright 2013 First Light Games. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "FLLayerNavigationNode.h"

@interface ManageLayer : CCLayer
{
    FLLayerNavigationNode* myMonstersButton;
    FLLayerNavigationNode* myPartiesButton;
    FLLayerNavigationNode* backButton;
}

+(CCScene *) scene;

-(id) init;

@end
