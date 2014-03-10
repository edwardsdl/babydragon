//
//  FLContainer.m
//  BabyDragon
//
//  Created by Eric Stenborg on 3/9/14.
//  Copyright (c) 2014 First Light Games. All rights reserved.
//

#import "FLContainer.h"

@implementation FLContainer
{
    
}

-(id) initWithDimensions:(CGSize) initialDimensions
{
    if( (self=[super init]))
    {
        //Store the dimension passed in
        self.dimensions = initialDimensions;
        
        //Use the dimensions to determine the node space bounding box
        self.boundingBox = CGRectMake(
                                      (self.dimensions.width / 2) * -1,
                                      (self.dimensions.height / 2) * -1,
                                      self.dimensions.width,
                                      self.dimensions.height);
    }
    return self;
}

-(void) resizeTo:(CGSize) newDimensions
{
    //Update the variable and resize the background sprite
    self.dimensions = newDimensions;
}

-(void) setBackgroundWithFile:(NSString *) image
{
    if (self.backgroundSprite == nil)
    {
        self.backgroundSprite = [CCSprite spriteWithFile:image];
        [self addChild:self.backgroundSprite z:INT_MIN];
    }
    else
    {
        CCTexture2D* tex = [[CCTextureCache sharedTextureCache] addImage:image];
        [self.backgroundSprite setTexture: tex];
    }
}

-(CCLabelTTF*) addLabelWithShadow:(CCLabelTTF*) label
{
    //Create the shadow label
    CCLabelTTF* shadowLabel = [CCLabelTTF labelWithString:label.string
                                                 fontName:label.fontName
                                                 fontSize:label.fontSize];
    shadowLabel.color = ccc3(0, 0, 0);
    shadowLabel.opacity = label.opacity;
    shadowLabel.anchorPoint = label.anchorPoint;
    shadowLabel.position = ccp(label.position.x + 1, label.position.y - 1);
    
    //Add the shadow, then the label on top
    [self addChild:shadowLabel];
    [self addChild:label];
    
    //Return the shadow in case the called wants to store it
    return shadowLabel;
}

-(void) removeAllChildren
{
    [super removeAllChildren];
    [self addChild:self.backgroundSprite z:INT_MIN];
}

-(void) onEnter
{
    [[[CCDirector sharedDirector] touchDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
    [super onEnter];
}
-(void) onExit
{
    [[[CCDirector sharedDirector] touchDispatcher] removeDelegate:self];
    [super onExit];
}

-(BOOL) ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    //Get touch position
    CGPoint position = [self convertTouchToNodeSpace:touch];
    
    //Ignore if not in the bounding box of the button
    if (CGRectContainsPoint(self.boundingBox, position))
    {
        //Handler to be overriden by child classes
        return [self handleTouchBegan:position];
    }
    return NO;
}

-(BOOL) handleTouchBegan:(CGPoint) position
{
    return YES;
}

@end
