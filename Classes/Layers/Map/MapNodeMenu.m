//
//  MapNodeMenu.m
//  BabyDragon
//
//  Created by Eric Stenborg on 1/19/14.
//  Copyright 2014 First Light Games. All rights reserved.
//

#import "MapNodeMenu.h"


@implementation MapNodeMenu
{
    int _worldIndex;
}

-(id) initWithWorldIndex:(int) worldIndex
{
    if( (self=[super initWithDimensions:CGSizeMake(275, 275)]) )
    {
        _worldIndex = worldIndex;
        
        MapNodeData* mapNode = [MapNodeData mapNodeForWorldIndex:worldIndex];
        
        [self addLabel:mapNode.name color:ccc3(255, 255, 255) position:ccp(-125, 110) size:14 centerAnchor:NO];
    }
    return self;
}

@end
