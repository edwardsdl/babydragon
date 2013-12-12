//
//  MonsterNode.h
//  BabyDragon
//
//  Created by Eric Stenborg on 12/12/13.
//  Copyright 2013 First Light Games. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "FLMenu.h"
#import "MonsterData.h"

@interface MonsterNode : FLMenu
{
    
}

+(MonsterNode*) Create;

-(void) showNewMonster:(MonsterData*) monster;

@end
