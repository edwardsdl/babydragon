//
//  CombatConfirmNode.m
//  BabyDragon
//
//  Created by Eric Stenborg on 11/13/13.
//  Copyright 2013 First Light Games. All rights reserved.
//

#import "CombatConfirmNode.h"
#import "CombatLayer.h"

@class CombatLayer;
@implementation CombatConfirmNode

+(CombatConfirmNode*) Create;
{
    CombatConfirmNode *node = [[CombatConfirmNode alloc] initWithDimensions:CGSizeMake(110, 25)];
    node.visible = NO;
    return node;
}

-(id) initWithDimensions:(CGSize) dim
{
    if( (self=[super initWithDimensions:dim]))
    {
        //Create a label for the button
        [self addLabel:@"Confirm" color:ccc3(255, 255, 255) position:ccp(0, 0) size:14 centerAnchor:YES];
        
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

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    if (self.visible == NO)
        return NO;
    
    //Get touch position
    CGPoint position = [self convertTouchToNodeSpace:touch];
    
    //Ignore if not in the bounding box of the button
    if (CGRectContainsPoint(self->_boundingBox, position))
    {
        CombatLayer* parentLayer = (CombatLayer*)self.parent;
        [parentLayer confirmWasTouched];
        
        return YES;
    }
    
    return NO;
}

@end
