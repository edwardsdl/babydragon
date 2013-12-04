//
//  CombatMenu.m
//  BabyDragon
//
//  Created by Eric Stenborg on 10/4/13.
//  Copyright (c) 2013 First Light Games. All rights reserved.
//

#import "OldCombatMenu.h"
#import "FLButton.h"
#import "CCLayer.h"
#import "cocos2d.h"
#import "MonsterData.h"
#import "AbilityData.h"

@implementation OldCombatMenu

-(id) initWithLayer:(CCLayer*) parentLayer fightSelector:(SEL) fightSelector abilitySelector:(SEL) abilitySelector
{
    if ((self = [super init]))
    {
        self.startingPosition = ccp(180, 180);
        
        //Setup the tier 1 buttons
        FLButton *fightButton = [FLButton buttonWithLabel:@"Fight" position:self.startingPosition toLayer:parentLayer z:103 selector:fightSelector];
        fightButton.visible = NO;
        
        FLButton *abilitiesButton = [FLButton buttonWithLabel:@"Abilities" position:self.startingPosition toLayer:parentLayer z:102 selector:@selector(openAbilitiesMenu)];
        abilitiesButton.visible = NO;
        abilitiesButton.selectorSource = self;
        
        FLButton *backpackButton = [FLButton buttonWithLabel:@"Backpack" position:self.startingPosition toLayer:parentLayer z:101 selector:@selector(openBackpackMenu)];
        backpackButton.visible = NO;
        backpackButton.selectorSource = self;
        
        self.tier1Buttons = [NSArray arrayWithObjects:fightButton, abilitiesButton, backpackButton, nil];
        
        //Setup the ability button
        FLButton *abilityButton1 = [FLButton buttonWithLabel:@"" position:self.startingPosition toLayer:parentLayer z:99 selector:abilitySelector];
        abilityButton1.visible = NO;
        abilityButton1.selectorArgument = [[NSNumber alloc] initWithInt:0];
        
        FLButton *abilityButton2 = [FLButton buttonWithLabel:@"" position:self.startingPosition toLayer:parentLayer z:98 selector:abilitySelector];
        abilityButton2.visible = NO;
        abilityButton2.selectorArgument = [[NSNumber alloc] initWithInt:1];
        
        FLButton *abilityButton3 = [FLButton buttonWithLabel:@"" position:self.startingPosition toLayer:parentLayer z:97 selector:abilitySelector];
        abilityButton3.visible = NO;
        abilityButton3.selectorArgument = [[NSNumber alloc] initWithInt:2];
        
        FLButton *abilityButton4 = [FLButton buttonWithLabel:@"" position:self.startingPosition toLayer:parentLayer z:96 selector:abilitySelector];
        abilityButton4.visible = NO;
        abilityButton4.selectorArgument = [[NSNumber alloc] initWithInt:3];
        
        self.abilityButtons = [NSArray arrayWithObjects:abilityButton1, abilityButton2, abilityButton3, abilityButton4, nil];
        
        //Setup the backpack buttons
        FLButton *backpackButton1 = [FLButton buttonWithLabel:@"Health Potion" position:self.startingPosition toLayer:parentLayer z:99 selector:@selector(doNothing)];
        backpackButton1.visible = NO;
        backpackButton1.selectorSource = self;
        
        FLButton *backpackButton2 = [FLButton buttonWithLabel:@"Monster Food" position:self.startingPosition toLayer:parentLayer z:99 selector:@selector(doNothing)];
        backpackButton2.visible = NO;
        backpackButton2.selectorSource = self;
        
        FLButton *backpackButton3 = [FLButton buttonWithLabel:@"Refresh Potion" position:self.startingPosition toLayer:parentLayer z:99 selector:@selector(doNothing)];
        backpackButton3.visible = NO;
        backpackButton3.selectorSource = self;
        
        FLButton *backpackButton4 = [FLButton buttonWithLabel:@"Speed Potion" position:self.startingPosition toLayer:parentLayer z:99 selector:@selector(doNothing)];
        backpackButton4.visible = NO;
        backpackButton4.selectorSource = self;
        
        self.backpackButtons = [NSArray arrayWithObjects:backpackButton1, backpackButton2, backpackButton3, backpackButton4, nil];
        
        self.isOpen = NO;
        self.isAbilitiesOpen = NO;
    }
    return self;
}

-(void) openMenu:(MonsterData*) monsterData
{
    //Flyout the tier 1 items
    int index = 0;
    for (FLButton *button in self.tier1Buttons)
    {
        //Show the button
        button.visible = YES;
        
        //Initial opacity to 0
        button.opacity = 0.0f;
        
        //Assign a movement
        [button runAction:[CCFadeIn actionWithDuration:0.3]];
        [button runAction:[CCMoveTo actionWithDuration:0.15 position:ccp(button.position.x, button.position.y - (index * 45))]];
        
        index++;
    }
    
    //Update the labels on the abilities menu items
    for (int i = 0; i < [self.abilityButtons count]; i++)
    {
        if ([monsterData.abilities count] > i)
            ((FLButton*)[self.abilityButtons objectAtIndex:i]).label.string = ((AbilityData*)[monsterData.abilities objectAtIndex:i]).name;
        else
            ((FLButton*)[self.abilityButtons objectAtIndex:i]).label.string = @"";
    }
    
    self.isOpen = YES;
}

-(void) closeMenu
{
    self.isOpen = NO;
    
    [self closeAbilitiesMenu];
    [self closeBackpackMenu];
    
    for (FLButton *button in self.tier1Buttons)
    {
        button.visible = NO;
        button.position = self.startingPosition;
    }
}

-(void) openAbilitiesMenu
{
    if (self.isAbilitiesOpen)
    {
        [self closeAbilitiesMenu];
        return;
    }
    
    if (self.isBackpackOpen)
        [self closeBackpackMenu];
    
    //Slide the buttons into position
    for (FLButton *button in self.abilityButtons)
    {
        //Reset to start position
        button.position = ((FLButton*)[self.tier1Buttons objectAtIndex:1]).position;
        
        //Show the button
        button.visible = YES;
    
        //Give the button the move actions
        int index = [self.abilityButtons indexOfObject:button];
        index = index - 1;
        float newY = button.position.y - (index * 45);
        
        CCMoveTo *moveTo1 = [CCMoveTo actionWithDuration:0.15 position:ccp(button.position.x + 130, button.position.y)];
        CCMoveTo *moveTo2 = [CCMoveTo actionWithDuration:0.15 position:ccp(button.position.x + 130,
                                                                           newY)];
        
        [button runAction:[CCSequence actions:moveTo1, moveTo2, nil]];
        
        //Buttons for empty ability slots are 1/2 opacity
        if ([button.label.string isEqualToString:@""] || button.label.string == nil)
            button.opacity = 150;
        else
            button.opacity = 255;
    }
    
    //Bring the other buttons to 1/2 opacity
    ((FLButton*)[self.tier1Buttons objectAtIndex:0]).opacity = 150;
    ((FLButton*)[self.tier1Buttons objectAtIndex:2]).opacity = 150;
    
    self.isAbilitiesOpen = YES;
}

-(void) closeAbilitiesMenu
{
    if (!self.isAbilitiesOpen)
        return;
    
    //Return the buttons to their originial positions
    for (FLButton *button in self.abilityButtons)
    {
        button.visible = NO;
        button.position = ((FLButton*)[self.tier1Buttons objectAtIndex:1]).position;
    }
    
    //Bring the other buttons to full opacity
    ((FLButton*)[self.tier1Buttons objectAtIndex:0]).opacity = 255;
    ((FLButton*)[self.tier1Buttons objectAtIndex:2]).opacity = 255;
    
    self.isAbilitiesOpen = NO;
}

-(void) openBackpackMenu
{
    if (self.isBackpackOpen)
    {
        [self closeBackpackMenu];
        return;
    }
    
    if (self.isAbilitiesOpen)
        [self closeAbilitiesMenu];
    
    //Slide the buttons into position
    for (FLButton *button in self.backpackButtons)
    {
        button.position = ((FLButton*)[self.tier1Buttons objectAtIndex:2]).position;
        
        button.visible = YES;
        
        int index = [self.backpackButtons indexOfObject:button];
        index = index - 2;
        float newY = button.position.y - (index * 45);
        
        CCMoveTo *moveTo1 = [CCMoveTo actionWithDuration:0.15 position:ccp(button.position.x + 130, button.position.y)];
        CCMoveTo *moveTo2 = [CCMoveTo actionWithDuration:0.15 position:ccp(button.position.x + 130,
                                                                           newY)];
        
        [button runAction:[CCSequence actions:moveTo1, moveTo2, nil]];
    }
    
    //Bring the other buttons to 1/2 opacity
    ((FLButton*)[self.tier1Buttons objectAtIndex:0]).opacity = 150;
    ((FLButton*)[self.tier1Buttons objectAtIndex:1]).opacity = 150;
    
    self.isBackpackOpen = YES;

}

-(void) closeBackpackMenu
{
    if (!self.isBackpackOpen)
        return;
    
    //Return the buttons to their originial positions
    for (FLButton *button in self.backpackButtons)
    {
        button.visible = NO;
        button.position = ((FLButton*)[self.tier1Buttons objectAtIndex:2]).position;
    }
    
    //Bring the other buttons to full opacity
    ((FLButton*)[self.tier1Buttons objectAtIndex:0]).opacity = 255;
    ((FLButton*)[self.tier1Buttons objectAtIndex:1]).opacity = 255;
    
    self.isBackpackOpen = NO;
}

-(void) handleTouch:(CGPoint) position
{
    if (self.isOpen == NO) return;
    
    BOOL tapped = NO;
    
    for (FLButton *button in self.tier1Buttons)
    {
        tapped = [button checkForTap:position];
        if (tapped == YES)
            break;
    }
    
    if (tapped)
        return;
    
    for (FLButton *button in self.abilityButtons)
    {
        //Dont check for tap on empty ability buttons
        if ([button.label.string isEqualToString:@""] || button.label.string == nil)
            continue;
        
        tapped = [button checkForTap:position];
        if (tapped == YES)
            break;
    }
}

-(void) doNothing
{
    
}

@end
