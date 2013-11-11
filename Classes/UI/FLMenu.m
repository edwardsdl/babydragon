//
//  FLMenu.m
//  BabyDragon
//
//  Created by Eric Stenborg on 11/10/13.
//  Copyright 2013 First Light Games. All rights reserved.
//

#import "FLMenu.h"


@implementation FLMenu

-(id) initWithDimensions:(CGSize) dim
{
    if( (self=[super init]))
    {
        //Draw and size up the menu background
        self->backgroundSprite = [CCSprite spriteWithFile:@"FLMenuBackground.png"];
        self->backgroundSprite.scaleX = dim.width / self->backgroundSprite.contentSize.width;
        self->backgroundSprite.scaleY = dim.height / self->backgroundSprite.contentSize.height;
        self->backgroundSprite.opacity = 150;
        [self addChild:self->backgroundSprite];
        
        self->dimensions = dim;
    }
    return self;
}

-(void)draw
{
    [super draw];
    
    ccDrawColor4B(0, 0, 0, 255);
    glLineWidth(2.0f);
    
    //Determine corner points
    float xMin = (self->dimensions.width / 2) * -1;
    float xMax = self->dimensions.width / 2;
    float yMin = (self->dimensions.height / 2) * -1;
    float yMax = self->dimensions.height / 2;
    
    //Draw the lines
    ccDrawLine(ccp(xMin, yMin), ccp(xMax, yMin));
    ccDrawLine(ccp(xMax, yMin), ccp(xMax, yMax));
    ccDrawLine(ccp(xMax, yMax), ccp(xMin, yMax));
    ccDrawLine(ccp(xMin, yMax), ccp(xMin, yMin));
}

-(void) addLabel:(NSString*) text color:(ccColor3B) color position:(CGPoint) position size:(int) size
{
    CCLabelTTF* label;
    
    //Draw the shadow first
    label = [CCLabelTTF labelWithString:text fontName:@"Georgia" fontSize:size];
    label.color = ccc3(0, 0, 0);
    label.opacity = 150;
    label.anchorPoint = CGPointZero;
    label.position = ccp(position.x + 1, position.y - 1);
    [self addChild:label];
    
    //Draw the real label
    label = [CCLabelTTF labelWithString:text fontName:@"Georgia" fontSize:size];
    label.color = color;
    label.anchorPoint = CGPointZero;
    label.position = position;
    [self addChild:label];
}

-(void) removeAllChildren
{
    [super removeAllChildren];
    [self addChild:self->backgroundSprite];
}

@end