//
//  FLEntity.h
//  BabyDragon
//
//  Created by Eric Stenborg on 9/9/13.
//  Copyright (c) 2013 First Light Games. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface FLEntity : NSObject
{
}

@property (nonatomic, retain) NSMutableDictionary *sprites;

@property bool lockSpritesToPosition;

@property CGPoint position;

-(id) initWithPosition: (CGPoint) position;

-(CGPoint) position;

-(void) moveTo:(CGPoint)position;

-(void)  addSprite: (CCSprite *) sprite withName:  (NSString *) spriteName toLayer: (CCLayer *) layer;

-(void) addSpriteFromFile: (NSString *) fileName withName: (NSString *) spriteName toLayer: (CCLayer *) layer;

-(void) addAnimationFromFile: (NSString *) fileName withFrameCount: (int) frameCount withName: (NSString *) spriteName toLayer: (CCLayer *) layer;

-(CCSprite *) spriteWithName: (NSString *) spriteName;

-(void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;

-(void) setVisibilityOnSpriteWithName: (NSString *) spriteName isVisible:(bool) visible;

@end
