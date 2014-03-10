//
//  FLButtonDebug.m
//  BabyDragon
//
//  Created by Eric Stenborg on 3/9/14.
//  Copyright (c) 2014 First Light Games. All rights reserved.
//

#import "FLButtonDebug.h"

@implementation FLButtonDebug
{
    SEL selectorToRun;
}

-(id) initWithDimensions:(CGSize) initialDimensions text:(NSString*) text parent:(id) parent selector:(SEL) selector
{
    if( (self=[super init]))
    {
        //Add the label
        [self addLabelWithShadow:[CCLabelTTF labelWithString:text fontName:BUTTON_FONT fontSize:BUTTON_FONT_SIZE_MEDIUM]];
        
        //Store the parent as in the generic store of the container
        self.genericStorage = parent;
        
        //Store the selector too
        self->selectorToRun = selector;
    }
    return self;
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
