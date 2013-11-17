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

-(void) buttonWasTouched:(CombatMenuButtonNode*) button
{
    if (self.isOpen == NO)
        return;
    
    CombatLayer* combatLayer = (CombatLayer*)self.parent;
    
    if (button == fightButton)
    {
        [combatLayer performFightAction];
    }
}

@end
