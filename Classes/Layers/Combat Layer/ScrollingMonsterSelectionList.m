//
//  ScrollingMonsterSelectionList.m
//  BabyDragon
//
//  Created by Eric Stenborg on 1/7/14.
//  Copyright 2014 First Light Games. All rights reserved.
//

#import "ScrollingMonsterSelectionList.h"


@implementation ScrollingMonsterSelectionList
{
    ManagePartyLayer* managePartyLayer;
    
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

-(id) init:(ManagePartyLayer*) parent
{
    if( (self=[super init]))
    {
        self->managePartyLayer = parent;
        
        //Set class level values for easy math
        self->menuSpacing = 5;
        self->monsterMenuWidth = 220;
        self->monsterMenuHeight = 32.5 + (self->menuSpacing * 2.0f);
        
        //Get the player's monster roster
        NSArray* roster = [MonsterData allMonsters];
        self->menus = [NSMutableArray array];
        
        //Add an FLMenu for each monster in the roster
        int index = 0;
        for (MonsterData* monster in roster)
        {
            FLMenu* menu = [[FLMenu alloc] initWithDimensions:CGSizeMake(self->monsterMenuWidth, self->monsterMenuHeight)];
            menu.position = ccp(0, 0 - ((self->monsterMenuHeight + self->menuSpacing) * index));
            [self addChild:menu];
            
            //Store a reference to this monster in the menu's storage
            menu.genericStorage = monster;
            
            //Add the monster picture frame
            CCSprite* iconFrameSprite = [CCSprite spriteWithFile:@"IconFrame.png"];
            iconFrameSprite.position = ccp((self->monsterMenuWidth/2) * -1.0f + self->menuSpacing + (32.5f / 2.0f), 0);
            [menu addChild:iconFrameSprite];
            
            //Add the monster's sprite to the menu item
            CCSprite* monsterSprite = [CCSprite spriteWithFile:[NSString stringWithFormat:@"%@_Standing.png", monster.type]];
            monsterSprite.scaleX = -0.45f;
            monsterSprite.scaleY = 0.45;
            monsterSprite.position = iconFrameSprite.position;
            [menu addChild:monsterSprite];
            
            //Add the label
            [menu addLabel:[NSString stringWithFormat:@"%@ (Level %i)", monster.name, monster.level] color:ccc3(255, 255, 255) position:ccp(iconFrameSprite.position.x + (32.5 / 2) + self->menuSpacing, -7) size:14 centerAnchor:NO];
            
            [self->menus addObject:menu];
            
            index++;
        }
        
        //Calculate the y extent of the menu scroll
        self->yExtent =(float)[self->menus count] * (self->monsterMenuHeight + self->menuSpacing) - 320 + self->menuSpacing;
        
        //Begin an update loop
        [self schedule:@selector(update:) interval:0];
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
    if (position.x < (self->monsterMenuWidth / 2) * -1.0 || position.x > (self->monsterMenuWidth / 2))
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
    if (position.x < (self->monsterMenuWidth / 2) * -1.0 || position.x > (self->monsterMenuWidth / 2))
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
    if (position.x < (self->monsterMenuWidth / 2) * -1.0 || position.x > (self->monsterMenuWidth / 2))
        return;
    
    self->beingTouched = NO;
    
    //If the menu is not scrolling then considering this a menu selection
    if (self->currentScrollVelocity == 0.0f)
    {
        //Determine the index of the menu item that was touched
        float yInMenu = ((position.y * -1.0f) + self->currentYPosition) + (self->monsterMenuHeight / 2);
        int menuIndex = yInMenu / (self->monsterMenuHeight + self->menuSpacing);
        
        //Get the monster data
        self->selectedMenu = (FLMenu*)[menus objectAtIndex:menuIndex];
        MonsterData* selectedMonster = (MonsterData*)(self->selectedMenu).genericStorage;
        
        [managePartyLayer addMonsterToParty:selectedMonster];
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
        menu.position = ccp(menu.position.x, (0 - ((self->monsterMenuHeight + self->menuSpacing) * index)) + self->currentYPosition);
        
        index++;
    }
}

@end
