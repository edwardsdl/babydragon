//
//  FLButtonDebug.h
//  BabyDragon
//
//  Created by Eric Stenborg on 3/9/14.
//  Copyright (c) 2014 First Light Games. All rights reserved.
//

#import "FLContainerDebug.h"
#import "UIConstants.h"

@interface FLButtonDebug : FLContainerDebug
{
    
}

-(id) initWithDimensions:(CGSize) initialDimensions text:(NSString*) text parent:(id) parent selector:(SEL) selector;

@end
