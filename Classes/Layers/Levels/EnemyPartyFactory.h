//
//  EnemyPartyFactory.h
//  BabyDragon
//
//  Created by Eric Stenborg on 4/12/14.
//  Copyright (c) 2014 First Light Games. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PartyData.h"
#import "ElementType.h"
#import "MonsterData.h"
#import "MonsterData+Management.h"
#import "DefaultMonsterData.h"
#import "DefaultMonsterData+Management.h"
#import "Rarity.h"
#import "CoreDataHelper.h"
#import "PartyData+Management.h"

@interface EnemyPartyFactory : NSObject

+(PartyData*) CreateEnemyPartyOfElement:(ElementType) element MinLevel:(int) minLevel MaxLevel:(int) maxLevel;

@end
