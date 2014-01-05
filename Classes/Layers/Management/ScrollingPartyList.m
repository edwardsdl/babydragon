//
//  ScrollingPartyList.m
//  BabyDragon
//
//  Created by Eric Stenborg on 12/16/13.
//  Copyright 2013 First Light Games. All rights reserved.
//

#import "ScrollingPartyList.h"


@implementation ScrollingPartyList

-(id) init
{
    if( (self=[super init]))
    {
        //Get the player's classes
        NSArray* parties = [PartyData allParties];
        self->menus = [NSMutableArray array];
        
        for (PartyData* party in parties)
        {
            
        }
    }
    return self;
}

@end
