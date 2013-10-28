//
//  FLRadialMenuItem.m
//  BabyDragon
//
//  Created by Eric Stenborg on 9/19/13.
//  Copyright (c) 2013 First Light Games. All rights reserved.
//

#import "FLRadialMenuItem.h"

@implementation FLRadialMenuItem

+(FLRadialMenuItem*) itemWithSprite:(CCSprite*) buttonSprite selector:(SEL) selector
{
    FLRadialMenuItem *menuItem = [FLRadialMenuItem new];
    menuItem.buttonSprite = buttonSprite;
    menuItem.selector = selector;
    return menuItem;
}

@end
