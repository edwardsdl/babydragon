//
//  PartyNode.h
//  BabyDragon
//
//  Created by Eric Stenborg on 1/5/14.
//  Copyright 2014 First Light Games. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "FLMenu.h"
#import "PartyData.h"
#import "MonsterData.h"
#import "ManagePartyLayer.h"

@interface PartyNode : FLMenu <CCTouchOneByOneDelegate>

+(PartyNode*) Create;

-(void) showNewParty:(PartyData*) partyNode;

@end
