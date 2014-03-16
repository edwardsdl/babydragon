//
//  FLContainerDebug.m
//  BabyDragon
//
//  Created by Eric Stenborg on 3/9/14.
//  Copyright (c) 2014 First Light Games. All rights reserved.
//

#import "FLContainerDebug.h"

@implementation FLContainerDebug
{
    
}

-(id) initWithDimensions:(CGSize) initialDimensions
{
    if( (self=[super initWithDimensions:initialDimensions]))
    {
        //Draw and size up the menu background
        [self setBackgroundWithFile:@"FLMenuBackground.png"];
        self.backgroundSprite.scaleX = self.dimensions.width / self.backgroundSprite.contentSize.width;
        self.backgroundSprite.scaleY = self.dimensions.height / self.backgroundSprite.contentSize.height;
        self.backgroundSprite.opacity = 150;
        
        
    }
    return self;
}

-(void) highlight
{
    [self setBackgroundWithFile:@"FLMenuBackgroundHighlighted.png"];
}

-(void) unhighlight
{
    [self setBackgroundWithFile:@"FLMenuBackground.png"];
}

-(void)draw
{
    [super draw];
    
    ccDrawColor4B(0, 0, 0, 255);
    glLineWidth(2.0f);
    
    //Determine corner points
    float xMin = (self.dimensions.width / 2) * -1;
    float xMax = self.dimensions.width / 2;
    float yMin = (self.dimensions.height / 2) * -1;
    float yMax = self.dimensions.height / 2;
    
    //Draw the lines
    ccDrawLine(ccp(xMin, yMin), ccp(xMax, yMin));
    ccDrawLine(ccp(xMax, yMin), ccp(xMax, yMax));
    ccDrawLine(ccp(xMax, yMax), ccp(xMin, yMax));
    ccDrawLine(ccp(xMin, yMax), ccp(xMin, yMin));
}

@end
