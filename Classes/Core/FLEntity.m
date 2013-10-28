//
//  FLEntity.m
//  BabyDragon
//
//  Created by Eric Stenborg on 9/9/13.
//  Copyright (c) 2013 First Light Games. All rights reserved.
//

#import "FLEntity.h"
#import "cocos2d.h"

@implementation FLEntity

-(id) initWithPosition: (CGPoint) initialPosition
{
    if ((self = [super init]))
    {
        self.position = initialPosition;
        self.sprites = [NSMutableDictionary dictionary];
        self.lockSpritesToPosition = YES;
    }
    
    return self;
}

-(void) moveTo:(CGPoint) newPosition
{
    self.position = newPosition;
    
    if (self.lockSpritesToPosition == YES)
        for (NSString* key in self.sprites)
            [self spriteWithName:key].position = self.position;
}

-(void) addSprite: (CCSprite *) sprite
         withName:  (NSString *) spriteName
          toLayer: (CCLayer *) layer
{
    sprite.visible = NO;
    sprite.position = (self.position);
    [self.sprites setObject: sprite  forKey: spriteName];
    [layer addChild: sprite];
}

-(void) addSpriteFromFile: (NSString *) fileName
                 withName: (NSString *) spriteName
                  toLayer: (CCLayer *) layer
{
    [self addSprite:[CCSprite spriteWithFile:fileName] withName:spriteName toLayer:layer];
}

-(void) addAnimationFromFile: (NSString *) fileName
              withFrameCount: (int) frameCount
                    withName: (NSString *) spriteName
                     toLayer: (CCLayer *) layer
{
    //Cache the frame info
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile: [NSString stringWithFormat:@"%@.plist", fileName]];
    
    //Create a sprite batch node
    CCSpriteBatchNode *spriteSheet = [CCSpriteBatchNode batchNodeWithFile: [NSString stringWithFormat:@"%@.png", fileName]];
    [layer addChild:spriteSheet];
    
    //Create an array from the list of frames
    NSMutableArray *animFrames = [NSMutableArray array];
    for (int i = 1; i <= frameCount; i++) {
        [animFrames addObject:
         [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
          [NSString stringWithFormat:@"%@%d.png", fileName, i]]];
    }
    
    //Create the animation object
    CCAnimation *anim = [CCAnimation animationWithSpriteFrames:animFrames delay:0.2f];
    
    //Create the sprite and run the animation
    CCSprite *newSprite = [CCSprite spriteWithSpriteFrameName:[NSString stringWithFormat:@"%@1.png", fileName]];
    CCAction *animAction = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation:anim]];
    [newSprite runAction:animAction];
    
    [self addSprite:newSprite withName:spriteName toLayer:layer];
    
}

-(CCSprite *) spriteWithName: (NSString *) spriteName
{
    return [self.sprites objectForKey: spriteName];
}

-(void) setVisibilityOnSpriteWithName: (NSString *) spriteName isVisible:(bool) visible
{
    for (NSString* key in self.sprites)
    {
        if (key == spriteName)
            [self spriteWithName:key].visible = visible;
    }
}

- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}


@end
