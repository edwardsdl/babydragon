//
//  CombatMenuButton.h
//  BabyDragon
//
//  Created by Eric Stenborg on 11/12/13.
//  Copyright 2013 First Light Games. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "FLMenu.h"

@interface CombatMenuButtonNode : FLMenu
{
    
};

+(CombatMenuButtonNode*) CreateWithLabel:(NSString*) label isParentButton:(BOOL) isParentButton;

-(id) initWithDimensions:(CGSize) dim andLabel:(NSString*) label isParentButton:(BOOL) isParentButton;

@end
