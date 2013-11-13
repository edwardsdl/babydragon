//
//  CombatMenuButton.m
//  BabyDragon
//
//  Created by Eric Stenborg on 11/12/13.
//  Copyright 2013 First Light Games. All rights reserved.
//

#import "CombatMenuButtonNode.h"


@implementation CombatMenuButtonNode

+(CombatMenuButtonNode*) CreateWithLabel:(NSString*) label isParentButton:(BOOL) isParentButton
{
    CombatMenuButtonNode *node = [[CombatMenuButtonNode alloc] initWithDimensions:CGSizeMake(110, 25) andLabel:label isParentButton:isParentButton];
    return node;
}

-(id) initWithDimensions:(CGSize) dim andLabel:(NSString*) label isParentButton:(BOOL) isParentButton
{
    if( (self=[super initWithDimensions:dim]))
    {
        //Create a label for the button
        [self addLabel:label color:ccc3(255, 255, 255) position:ccp(-48, -7) size:14];
        
        //Draw an arrow is we need it
        if (isParentButton)
        {
            CCSprite* arrowSprite = [CCSprite spriteWithFile:@"RightArrow.png"];
            arrowSprite.position = ccp(42, 0);
            [self addChild:arrowSprite];
        }
    }
    return self;
}

@end
