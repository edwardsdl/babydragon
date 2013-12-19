//
//  CombatMenuButton.m
//  BabyDragon
//
//  Created by Eric Stenborg on 11/12/13.
//  Copyright 2013 First Light Games. All rights reserved.
//

#import "CombatMenuButtonNode.h"
#import "CombatMenuNode.h"

@class CombatMenuNode;
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
        [self addLabel:label color:ccc3(255, 255, 255) position:ccp(-48, -7) size:14 centerAnchor:NO];
        
        //Draw an arrow if we need it
        if (isParentButton)
        {
            CCSprite* arrowSprite = [CCSprite spriteWithFile:@"RightArrow.png"];
            arrowSprite.position = ccp(42, 0);
            [self addChild:arrowSprite];
        }
        
        //Determine bounding box
        self->_boundingBox = CGRectMake((self->dimensions.width / 2) * -1, (self->dimensions.height / 2) * -1, self->dimensions.width, self->dimensions.height);
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

- (void) updateLabel:(NSString*) newLabel
{
    for (CCNode* node in self.children)
    {
        if ([node isKindOfClass:[CCLabelTTF class]])
        {
            [((CCLabelTTF*)node) setString:newLabel];
        }
    }
}

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    //Get touch position
    CGPoint position = [self convertTouchToNodeSpace:touch];
    
    //Ignore if not in the bounding box of the button
    if (CGRectContainsPoint(self->_boundingBox, position))
    {
        CombatMenuNode* parentLayer = (CombatMenuNode*)self.parent;
        [parentLayer buttonWasTouched:self];
        
        return YES;
    }
    
    return NO;
}

@end
