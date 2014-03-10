//
//  FLContainerDebug.h
//  BabyDragon
//
//  Created by Eric Stenborg on 3/9/14.
//  Copyright (c) 2014 First Light Games. All rights reserved.
//

#import "FLContainer.h"
#import "cocos2d.h"
#import "FLContainer.h"

@interface FLContainerDebug : FLContainer
{
    
}

-(id) initWithDimensions:(CGSize) initialDimensions;

-(void) highlight;

-(void) unhighlight;

@end
