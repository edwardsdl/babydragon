//
//  PartyData.h
//  BabyDragon
//
//  Created by Dallas Edwards on 10/14/13.
//  Copyright (c) 2013 First Light Games. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "BaseData.h"

@class MonsterData;

@interface PartyData : BaseData

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *monsters;
@end

@interface PartyData (CoreDataGeneratedAccessors)

- (void)addMonstersObject:(MonsterData *)value;
- (void)removeMonstersObject:(MonsterData *)value;
- (void)addMonsters:(NSSet *)values;
- (void)removeMonsters:(NSSet *)values;

@end
