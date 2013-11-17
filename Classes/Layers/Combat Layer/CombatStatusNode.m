//
//  CombatStatusNode.m
//  BabyDragon
//
//  Created by Eric Stenborg on 11/13/13.
//  Copyright 2013 First Light Games. All rights reserved.
//

#import "CombatStatusNode.h"


@implementation CombatStatusNode

+(CombatStatusNode*) Create
{
    CombatStatusNode *node = [[CombatStatusNode alloc] initWithDimensions:CGSizeMake(350, 25)];
    node.visible = NO;
    return node;
}

-(void) openAndShowLabel:(NSString*) newLabelText
{
    self.visible = YES;
    [self updateLabel: newLabelText];
}

-(void) close
{
    self.visible = NO;
}

-(void) updateLabel:(NSString*) newLabelText
{
    [self removeAllChildren];
    [self addLabel:newLabelText color:ccc3(255, 255, 255) position:ccp(0, 0) size:14 centerAnchor:YES];
}

@end
