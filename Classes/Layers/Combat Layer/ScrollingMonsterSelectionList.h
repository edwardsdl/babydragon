//
//  ScrollingMonsterSelectionList.h
//  BabyDragon
//
//  Created by Eric Stenborg on 1/7/14.
//  Copyright 2014 First Light Games. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "MonsterData.h"
#import "MonsterData+Management.h"
#import "FLMenu.h"
#import "ManagePartyLayer.h"

@class ManagePartyLayer;

@interface ScrollingMonsterSelectionList : CCNode <CCTouchOneByOneDelegate>
{
    
}

-(id) init:(ManagePartyLayer*) parent;

@end
