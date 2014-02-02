//
//  CombatMenuNode.m
//  BabyDragon
//
//  Created by Eric Stenborg on 11/12/13.
//  Copyright 2013 First Light Games. All rights reserved.
//

#import "CombatMenuNode.h"
#import "CombatLayer.h"

//----------------------------------------------------------------------------------------------------------------
//NOTE: The combat menu has 0, 0 in the top right corner so that it can easily line up with the combat info menu
//----------------------------------------------------------------------------------------------------------------

@class CombatLayer;
@implementation CombatMenuNode

+(CombatMenuNode*) Create
{
    CombatMenuNode *node = [[CombatMenuNode alloc] init];
    node.visible = NO;
    return node;
}

-(id) init
{
    if( (self=[super init]))
    {
        //Create the ability sub buttons for later use
        self->abilitiesSubButtons = [NSMutableArray array];
        for (int i = 0; i < 4; i++)
        {
            CombatMenuButtonNode* button = [CombatMenuButtonNode CreateWithLabel:@"" isParentButton:NO];
            button.position = [self getPointForButtonInRow:1 andColumn:0];
            button.visible = NO;
            [self->abilitiesSubButtons addObject:button];
            [self addChild:button];
        }
        
        //Create the fight button
        self->fightButton = [CombatMenuButtonNode CreateWithLabel:@"Fight" isParentButton:NO];
        
        //Create the abilities buttons
        self->abilitiesButton = [CombatMenuButtonNode CreateWithLabel:@"Abilities" isParentButton:YES];
        
        //Create the backpack button
        self->backpackButton = [CombatMenuButtonNode CreateWithLabel:@"Backpack" isParentButton:YES];
        
        //Add the child in an order that will overlap them for the flyout
        [self addChild:self->backpackButton];
        [self addChild:self->abilitiesButton];
        [self addChild:self->fightButton];
        
        [self resetPositions];
        
        self.isOpen = NO;
        self.isActive = NO;
        self->abilitiesMenuOpen = NO;
    }
    return self;
}

-(void) openMenu
{
    self.visible = YES;
    self.isOpen = YES;
    
    //Fly out the 2nd and 3rd buttons in the first column
    [self->abilitiesButton runAction:[CCMoveTo actionWithDuration:0.15 position:[self getPointForButtonInRow:1 andColumn:0]]];
    [self->backpackButton runAction:[CCMoveTo actionWithDuration:0.15 position:[self getPointForButtonInRow:2 andColumn:0]]];
}

-(void) closeMenu
{
    self.visible = NO;
    self.IsOpen = NO;
    [self closeAbilitiesSubMenu];
}

-(void) loadAbilities:(MonsterData*) monsterData
{
    //Store the abilities list for later
    self->monsterAbilities = [monsterData.abilities allObjects];
    
    for (int i = 0; i < [self->abilitiesSubButtons count]; i++)
    {
        CombatMenuButtonNode* button = (CombatMenuButtonNode*)[self->abilitiesSubButtons objectAtIndex:i];
        
        if ([monsterData.abilities count] > i)
        {
            [button updateLabel:
             [NSString stringWithFormat:@"%@ %i",
              ((AbilityData*)[self->monsterAbilities objectAtIndex:i]).name,
              ((AbilityData*)[self->monsterAbilities objectAtIndex:i]).level]];
            
            if (monsterData.abilityPoints < ((AbilityData*)[self->monsterAbilities objectAtIndex:i]).apCost)
                button.opacity = 100;
            else
                button.opacity = 255;
        }
        else
        {
            [button updateLabel:@""];
            button.opacity = 100;
        }
    }
}

-(void) resetPositions
{
    self->fightButton.position = [self getPointForButtonInRow:0 andColumn:0];
    self->abilitiesButton.position = [self getPointForButtonInRow:0 andColumn:0];
    self->backpackButton.position = [self getPointForButtonInRow:0 andColumn:0];
}

-(CGPoint) getPointForButtonInRow:(int) row andColumn:(int) column
{
    return ccp(55 + (115 * column), -13.5 - (30 * row));
}

-(void) openAbilitiesSubMenu
{
    for (int i = 0; i < 4; i++)
    {
        CombatMenuButtonNode* button = (CombatMenuButtonNode*)[self->abilitiesSubButtons objectAtIndex:i];
        button.visible = YES;
        CCSequence * sequence = [CCSequence actions:
                                 [CCMoveTo actionWithDuration:0.15 position:[self getPointForButtonInRow:1 andColumn:1]],
                                 [CCMoveTo actionWithDuration:0.15 position:[self getPointForButtonInRow:(i+1) andColumn:1]],
                                 nil];
        [button runAction:sequence];
    }
    
    self->fightButton.opacity = 100;
    self->backpackButton.opacity = 100;
    
    self->abilitiesMenuOpen = YES;
}

-(void) closeAbilitiesSubMenu
{
    for (int i = 0; i < 4; i++)
    {
        CombatMenuButtonNode* button = (CombatMenuButtonNode*)[self->abilitiesSubButtons objectAtIndex:i];
        button.visible = NO;
        button.position = [self getPointForButtonInRow:1 andColumn:0];
    }
    
    self->fightButton.opacity = 255;
    self->backpackButton.opacity = 255;
    
    self->abilitiesMenuOpen = NO;
}

-(void) buttonWasTouched:(CombatMenuButtonNode*) button
{
    if (self.isOpen == NO)
        return;
    
    CombatLayer* combatLayer = (CombatLayer*)self.parent;
    
    if (button == fightButton)
    {
        [combatLayer beginFight];
    }
    else if (button == abilitiesButton)
    {
        if (self->abilitiesMenuOpen)
            [self closeAbilitiesSubMenu];
        else
            [self openAbilitiesSubMenu];
    }
    else
    {
        for (int i = 0; i < 4; i++)
        {
            CombatMenuButtonNode* button = (CombatMenuButtonNode*)[self->abilitiesSubButtons objectAtIndex:i];
            if (button == [self->abilitiesSubButtons objectAtIndex:i] && [monsterAbilities count] > i)
            {
                if (button.opacity == 255)
                    [combatLayer beginAbility:[monsterAbilities objectAtIndex:i]];
            }
        }
    }
}

@end
