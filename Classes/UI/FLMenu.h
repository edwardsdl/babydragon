//
//  FLMenu.h
//  BabyDragon
//
//  Created by Eric Stenborg on 11/10/13.
//  Copyright 2013 First Light Games. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface FLMenu : CCNode
{
    CCSprite *backgroundSprite;
    CGSize dimensions;
    float _opacity;
};

@property float opacity;

-(id) initWithDimensions:(CGSize) dimensions;

-(void) addLabel:(NSString*) text color:(ccColor3B) color position:(CGPoint) position size:(int) size;

-(void) removeAllChildren;

-(void) resizeTo:(CGSize) newDimensions;

@end
