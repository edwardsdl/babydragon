//
//  FLLayerNavigationNode.m
//  BabyDragon
//
//  Created by Eric Stenborg on 12/8/13.
//  Copyright 2013 First Light Games. All rights reserved.
//

#import "FLLayerNavigationNode.h"

#pragma GCC diagnostic ignored "-We"
@implementation FLLayerNavigationNode

+(FLLayerNavigationNode*) createWithLayerType:(NSString*) layerTypeName dimensions:(CGSize) dim label:(NSString*) label size:(int) size
{
    return [[FLLayerNavigationNode alloc] initWithLayerType:layerTypeName dimensions:dim label:label size:size];
}

-(id) initWithLayerType:(NSString*) layerTypeName dimensions:(CGSize) dim label:(NSString*) label size:(int) size
{
    if( (self=[super initWithDimensions:dim]))
    {
        [self addLabel:label color:ccc3(255, 255, 255) position:ccp(0, 0) size:size centerAnchor:YES];
        
        self->layerName = layerTypeName;
        
        //Determine bounding box
        self->boundingBox = CGRectMake((self->dimensions.width / 2) * -1, (self->dimensions.height / 2) * -1, self->dimensions.width, self->dimensions.height);
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
    
    //Ignore if not in the bounding box of the button
    if (CGRectContainsPoint(self->boundingBox, position))
    {
        //This crazy nonsense dynamically calls a selector of a class level method
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        Class c = NSClassFromString(self->layerName);
        CCScene* scene = (CCScene*)[c performSelector:NSSelectorFromString(@"scene")];
        [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:scene]];
#pragma clang diagnostic pop
        return YES;
    }
    
    return NO;
}

@end
