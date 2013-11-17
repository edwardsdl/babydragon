//
//  CombatStatusNode.h
//  BabyDragon
//
//  Created by Eric Stenborg on 11/13/13.
//  Copyright 2013 First Light Games. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "FLMenu.h"

@interface CombatStatusNode : FLMenu
{
};

+(CombatStatusNode*) Create;

-(void) openAndShowLabel:(NSString*) newLabelText;

-(void) close;

-(void) updateLabel:(NSString*) newLabelText;

@end
