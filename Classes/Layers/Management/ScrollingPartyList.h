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
#import "FLMenu.h"
#import "PartyNode.h"

@class PartyNode;
@interface ScrollingPartyList : CCNode <CCTouchOneByOneDelegate>

-(id) init:(PartyNode*) partyNode;

@end
