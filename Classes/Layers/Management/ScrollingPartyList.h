//
//  ScrollingPartyList.h
//  BabyDragon
//
//  Created by Eric Stenborg on 12/16/13.
//  Copyright 2013 First Light Games. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "PartyData+Management.h"

@interface ScrollingPartyList : CCNode
{
    NSMutableArray* menus;
}

-(id) init;

@end
