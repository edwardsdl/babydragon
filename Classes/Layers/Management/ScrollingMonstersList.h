//
//  ScollingMonstersList.h
//  BabyDragon
//
//  Created by Eric Stenborg on 12/8/13.
//  Copyright 2013 First Light Games. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "MonsterData.h"
#import "MonsterData+Management.h"
#import "FLMenu.h"
#import "MonsterNode.h"

@interface ScrollingMonstersList : CCNode <CCTouchOneByOneDelegate>
{
    MonsterNode* connectedMonsterNode;
    
    float menuSpacing;
    float monsterMenuWidth;
    float monsterMenuHeight;
    float yExtent;
    
    float lastScrollPosition;
    float currentScrollVelocity;
    float currentYPosition;
    
    NSMutableArray* menus;
    
    FLMenu* selectedMenu;
    
    BOOL beingTouched;
}

-(id) init:(MonsterNode*) monsterNode;

@end
