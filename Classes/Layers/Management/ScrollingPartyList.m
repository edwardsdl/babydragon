//
//  ScrollingPartyList.m
//  BabyDragon
//
//  Created by Eric Stenborg on 12/16/13.
//  Copyright 2013 First Light Games. All rights reserved.
//

#import "ScrollingPartyList.h"


@implementation ScrollingPartyList
{
    PartyNode* connectedPartyNode;
    
    NSMutableArray* menus;
    FLMenu* selectedMenu;
    
    float menuSpacing;
    float partyMenuWidth;
    float partyMenuHeight;
    float yExtent;
    
    float lastScrollPosition;
    float currentScrollVelocity;
    float currentYPosition;
    
    BOOL beingTouched;
}

-(id) init: (PartyNode*) partyNode
{
    if( (self=[super init]))
    {
        self->connectedPartyNode = partyNode;
        
        //Set class level values for easy math
        self->menuSpacing = 5;
        self->partyMenuWidth = 220;
        self->partyMenuHeight = 32.5 + (self->menuSpacing * 2.0f);
        
        //Get the player's parties
        NSArray* parties = [PartyData allParties];
        self->menus = [NSMutableArray array];
        
        //Add an FLMenu for each party
        int index = 0;
        for (PartyData* party in parties)
        {
            FLMenu* menu = [[FLMenu alloc] initWithDimensions:CGSizeMake(self->partyMenuWidth, self->partyMenuHeight)];
            menu.position = ccp(0, 0 - ((self->partyMenuHeight + self->menuSpacing) * index));
            [self addChild:menu];
            
            //Store a reference to this monster in the menu's storage
            menu.genericStorage = party;
            
            //Add the party's name as a label
            [menu addLabel:[NSString stringWithFormat:@"%@", party.name] color:ccc3(255, 255, 255) position:ccp((self->partyMenuWidth/2) * -1.0f + self->menuSpacing + 7, -7) size:14 centerAnchor:NO];
            
            [self->menus addObject:menu];
            
            index++;
        }
    }
    return self;
}

- (void)onEnter
{
    [[[CCDirector sharedDirector] touchDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
    [super onEnter];
}
- (void)onExit
{
    [[[CCDirector sharedDirector] touchDispatcher] removeDelegate:self];
    [super onExit];
}

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    //Get touch position
    CGPoint position = [self convertTouchToNodeSpace:touch];
    
    //Ignore if not in bound of the menu
    if (position.x < (self->partyMenuWidth / 2) * -1.0 || position.x > (self->partyMenuWidth / 2))
        return NO;
    
    //Store the y position of the touch
    self->lastScrollPosition = position.y;
    
    //Kill the velocity on a new touch
    self->currentScrollVelocity = 0.0f;
    
    self->beingTouched = YES;
    return YES;
}

- (void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
    //Get the current position
    CGPoint position = [self convertTouchToNodeSpace:touch];
    
    //Ignore if not in bound of the menu
    if (position.x < (self->partyMenuWidth / 2) * -1.0 || position.x > (self->partyMenuWidth / 2))
        return;
    
    //Calculate the change in y since the last tick
    self->currentScrollVelocity = position.y - self->lastScrollPosition;
    
    //Move the menu
    [self updateScroll];
    
    //Store this Y position as the last Y position for next loop
    self->lastScrollPosition = position.y;
}

- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event;
{
    //Get the current position
    CGPoint position = [self convertTouchToNodeSpace:touch];
    
    //Ignore if not in bound of the menu
    if (position.x < (self->partyMenuWidth / 2) * -1.0 || position.x > (self->partyMenuWidth / 2))
        return;
    
    self->beingTouched = NO;
    
    //If the menu is not scrolling then considering this a menu selection
    if (self->currentScrollVelocity == 0.0f)
    {
        //Unhighlight the previous selected menu
        [self->selectedMenu unhighlight];
        
        //Determine the index of the menu item that was touched
        float yInMenu = ((position.y * -1.0f) + self->currentYPosition) + (self->partyMenuHeight / 2);
        int menuIndex = yInMenu / (self->partyMenuHeight + self->menuSpacing);
        
        //Select this menu item and highlight
        self->selectedMenu = (FLMenu*)[menus objectAtIndex:menuIndex];
        [self->selectedMenu highlight];
        
        PartyData* selectedParty = (PartyData*)(self->selectedMenu).genericStorage;
        [self->connectedPartyNode showNewParty:selectedParty];
    }
}

-(void) update:(ccTime)dt
{
    //Only perform the velocity scroll if the screen is not being touched
    if (!self->beingTouched)
    {
        //Ebb away the velocity
        self->currentScrollVelocity = self->currentScrollVelocity - (self->currentScrollVelocity * .05);
        if (self->currentScrollVelocity < 1.0f && self->currentScrollVelocity > -1.0f)
            self->currentScrollVelocity = 0;
        
        //Move the menu
        if (self->currentScrollVelocity != 0)
            [self updateScroll];
    }
}

-(void) updateScroll
{
    //Update our current Y position
    self->currentYPosition += self->currentScrollVelocity;
    
    if (currentYPosition < 0.0)
        currentYPosition = 0;
    
    if (currentYPosition > self->yExtent)
        currentYPosition = self->yExtent;
    
    //Update each monster's menu by the current velocity
    int index = 0;
    for (FLMenu* menu in self->menus)
    {
        menu.position = ccp(menu.position.x, (0 - ((self->partyMenuHeight + self->menuSpacing) * index)) + self->currentYPosition);
        
        index++;
    }
}

@end
