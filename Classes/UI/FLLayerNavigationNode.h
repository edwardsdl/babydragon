//
//  FLLayerNavigationNode.h
//  BabyDragon
//
//  Created by Eric Stenborg on 12/8/13.
//  Copyright 2013 First Light Games. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "FLMenu.h"

@interface FLLayerNavigationNode : FLMenu <CCTouchOneByOneDelegate>
{
    NSString* layerName;
    CGRect boundingBox;
}

+(FLLayerNavigationNode*) createWithLayerType:(NSString*) layerTypeName dimensions:(CGSize) dim label:(NSString*) label size:(int) size;


@end
