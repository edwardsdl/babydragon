//
//  FLButton.m
//  BabyDragon
//
//  Created by Eric Stenborg on 3/9/14.
//  Copyright (c) 2014 First Light Games. All rights reserved.
//

#import "FLButton.h"

@implementation FLButton
{
    SEL selectorToRun;
}

-(id) initWithDimensions:(CGSize) initialDimensions text:(NSString*) text parent:(id) parent selector:(SEL) selector
{
    if( (self=[super initWithDimensions:initialDimensions]))
    {
        //Add the label
        if (![text isEqualToString:@""])
            [self addLabelWithShadow:[CCLabelTTF labelWithString:text fontName:BUTTON_FONT fontSize:BUTTON_FONT_SIZE_MEDIUM]];
        
        //Store the parent as in the generic store of the container
        self.genericStorage = parent;
        
        //Store the selector too
        self->selectorToRun = selector;
    }
    return self;
}

-(id) initWithDimensions:(CGSize) initialDimensions parent:(id) parent selector:(SEL) selector
{
    return [self initWithDimensions:initialDimensions text:@"" parent:parent selector:selector];
}

-(BOOL) handleTouchBegan:(CGPoint) position
{
    //Run the given selector
    IMP imp = [self.genericStorage methodForSelector:selectorToRun];
    void (*func)(id, SEL) = (void *)imp;
    func(self.genericStorage, selectorToRun);
    
    return YES;
}

@end
