//
//  FLButton.h
//  BabyDragon
//
//  Created by Eric Stenborg on 10/4/13.
//  Copyright (c) 2013 First Light Games. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface FLButton : NSObject

@property (nonatomic, retain) CCLayer *parentLayer;

@property (nonatomic, retain) CCSprite *backgroundSprite;

@property (nonatomic, retain) CCLabelTTF *label;

@property SEL selector;

@property (nonatomic, retain) id selectorSource;

@property (nonatomic, retain) id selectorArgument;

@property (nonatomic) CGPoint position;

@property (nonatomic) BOOL visible;

@property (nonatomic) float opacity;

+(FLButton*) buttonWithLabel: (NSString*) label background:(NSString*) spriteFile position:(CGPoint) position toLayer:(CCLayer*) parentLayer z:(int) zIndex selector:(SEL) selector;

+(FLButton*) buttonWithLabel: (NSString*) label position:(CGPoint) position toLayer:(CCLayer*) parentLayer z:(int) zIndex selector:(SEL) selector;

-(id) initWithLabel: (NSString*) label background:(NSString*) spriteFile position:(CGPoint) position toLayer:(CCLayer*) parentLayer z:(int) zIndex selector:(SEL) selector;

-(id) initWithLabel: (NSString*) label position:(CGPoint) position toLayer:(CCLayer*) parentLayer z:(int) zIndex selector:(SEL) selector;

-(void) setVisible:(BOOL)visible;

-(void) runAction: (CCAction*) action;

-(BOOL) checkForTap:(CGPoint) position;

-(void) performSelector;

@end
