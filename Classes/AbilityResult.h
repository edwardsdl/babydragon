//
//  AbilityResult.h
//  BabyDragon
//
//  Created by Eric Stenborg on 10/9/13.
//  Copyright (c) 2013 First Light Games. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CombatMonsterEntity.h"
#import "AbilityData.h"
#import "EffectType.h"

@interface AbilityResult : NSObject

@property (nonatomic, retain) CombatMonsterEntity *targetMonster;

@property EffectType effectType;

@property int value;

@property (nonatomic, retain) NSString *statusText;

@end
