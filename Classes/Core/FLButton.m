//
//  FLButton.m
//  BabyDragon
//
//  Created by Eric Stenborg on 10/4/13.
//  Copyright (c) 2013 First Light Games. All rights reserved.
//

#import "FLButton.h"
#import "CCLayer.h"

@implementation FLButton

+(FLButton*) buttonWithLabel: (NSString*) label background:(NSString*) spriteFile position:(CGPoint) position toLayer:(CCLayer*) parentLayer z:(int) zIndex selector:(SEL) selector
{
    return [[FLButton alloc] initWithLabel:label background:spriteFile position:position toLayer:parentLayer z:zIndex selector:selector];
}

+(FLButton*) buttonWithLabel: (NSString*) label position:(CGPoint) position toLayer:(CCLayer*) parentLayer z:(int) zIndex selector:(SEL) selector
{
    return [[FLButton alloc] initWithLabel:label position:position toLayer:parentLayer z:zIndex selector:selector];
}

-(id) initWithLabel: (NSString*) label background:(NSString*) spriteFile position:(CGPoint) position toLayer:(CCLayer*) parentLayer z:(int) zIndex selector:(SEL) selector
{
    if ((self = [super init]))
    {
        self.label = [CCLabelTTF labelWithString:label fontName:@"Arial Rounded MT Bold" fontSize:12];
        self.label.position = position;
        self.label.color = ccc3(0, 0, 0);
        self.parentLayer = parentLayer;
        self.backgroundSprite = [CCSprite spriteWithFile:spriteFile];
        self.backgroundSprite.position = position;
        self.position = position;
        self.visible = YES;
        self.selector = selector;
        self.selectorSource = parentLayer;
        
        [self.parentLayer addChild:self.backgroundSprite z:zIndex];
        [self.parentLayer addChild:self.label z:zIndex];
    }
    return self;
}

-(id) initWithLabel: (NSString*) label position:(CGPoint) position toLayer:(CCLayer*) parentLayer z:(int) zIndex selector:(SEL) selector
{
    return [self initWithLabel:label background:@"Button_254x74.png" position:position toLayer:parentLayer z:zIndex selector:selector];
}

-(BOOL) visible
{
    return self.backgroundSprite.visible;
}

-(void) setVisible:(BOOL)visible
{
    self.backgroundSprite.visible = visible;
    self.label.visible = visible;
}

-(CGPoint) position
{
    return self.backgroundSprite.position;
}

-(void) setPosition:(CGPoint)position
{
    self.backgroundSprite.position = position;
    self.label.position = position;
}

-(float) opacity
{
    return self.backgroundSprite.opacity;
}

-(void) setOpacity:(float)opacity
{
    self.backgroundSprite.opacity = opacity;
    self.label.opacity = opacity;
}

-(void) runAction: (CCAction*) action
{
    [self.backgroundSprite runAction:action];
    [self.label runAction:action.copy];
}

-(BOOL) checkForTap:(CGPoint) position
{
    BOOL tapInButton = CGRectContainsPoint(self.backgroundSprite.boundingBox, position);
    
    if (tapInButton)
        [self performSelector];
    
    return tapInButton;
}

-(void) performSelector
{
    if (self.selectorArgument == nil)
    {
        [self.selectorSource performSelector:self.selector];
    }
    else
    {
        [self.selectorSource performSelector:self.selector withObject:self.selectorArgument];
    }
}

@end
