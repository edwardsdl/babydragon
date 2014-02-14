//
//  StatusEffect.h
//  BabyDragon
//
//  Created by Eric Stenborg on 2/14/14.
//  Copyright (c) 2014 First Light Games. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StatusEffectType.h"

@interface StatusEffect : NSObject

@property (nonatomic, retain) NSString* Name;

@property (nonatomic) StatusEffectType Type;

@property (nonatomic) int Value;

@property (nonatomic) int TurnsRemaining;

@end
