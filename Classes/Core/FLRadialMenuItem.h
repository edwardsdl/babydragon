//
//  FLRadialMenuItem.h
//  BabyDragon
//
//  Created by Eric Stenborg on 9/19/13.
//  Copyright (c) 2013 First Light Games. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface FLRadialMenuItem : NSObject
{
    
}

@property (nonatomic, retain) CCSprite *buttonSprite;

@property SEL selector;

+(FLRadialMenuItem*) itemWithSprite:(CCSprite*) buttonSprite selector:(SEL) selector;

@end
