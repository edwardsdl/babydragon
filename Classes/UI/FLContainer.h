//
//  FLContainer.h
//  BabyDragon
//
//  Created by Eric Stenborg on 3/9/14.
//  Copyright (c) 2014 First Light Games. All rights reserved.
//

#import "CCNode.h"
#import "cocos2d.h"

@interface FLContainer : CCNode<CCTouchOneByOneDelegate>
{
    
}

@property CGSize dimensions;

@property CGRect boundingBox;

@property (nonatomic, retain) CCSprite* backgroundSprite;

@property(nonatomic, retain) id genericStorage;

-(id) initWithDimensions:(CGSize) initialDimensions;

-(void) resizeTo:(CGSize) newDimensions;

-(void) setBackgroundWithFile:(NSString *) image;

-(CCLabelTTF*) addLabelWithShadow:(CCLabelTTF*) label;

-(void) removeAllChildren;

@end
