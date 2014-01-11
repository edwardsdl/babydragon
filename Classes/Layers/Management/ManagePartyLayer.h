//
//  ManagePartyLayer.h
//  BabyDragon
//
//  Created by Eric Stenborg on 1/7/14.
//  Copyright 2014 First Light Games. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "PartyData.h"
#import "ScrollingMonsterSelectionList.h"
#import "FLMenu.h"
#import "MyPartiesLayer.h"

@interface ManagePartyLayer : CCLayer <CCTouchOneByOneDelegate>
{
    
}

+(CCScene *) sceneWithParty:(PartyData*) partyData;

-(id) initWithParty:(PartyData*) partyData;

-(void) addMonsterToParty:(MonsterData*) monster;

@end
