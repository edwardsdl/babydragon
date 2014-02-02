//
//  MonsterData.h
//  BabyDragon
//
//  Created by Eric Stenborg on 1/29/14.
//  Copyright (c) 2014 First Light Games. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "AcquisitionData.h"

@class AbilityData, PartyData;

@interface MonsterData : AcquisitionData

@property (nonatomic) int32_t abilityPoints;
@property (nonatomic) float courage;
@property (nonatomic) float defense;
@property (nonatomic) int32_t elementType;
@property (nonatomic) int32_t experiencePoints;
@property (nonatomic) int32_t healthPoints;
@property (nonatomic) BOOL isTranslucent;
@property (nonatomic) int32_t level;
@property (nonatomic, retain) NSString * name;
@property (nonatomic) int32_t paletteIndex;
@property (nonatomic) float speed;
@property (nonatomic) float power;
@property (nonatomic, retain) id traits;
@property (nonatomic, retain) NSString * type;
@property (nonatomic, retain) NSString * uuid;
@property (nonatomic) float willpower;
@property (nonatomic) int32_t attackType;
@property (nonatomic, retain) NSOrderedSet *abilities;
@property (nonatomic, retain) NSSet *parties;
@end

@interface MonsterData (CoreDataGeneratedAccessors)

- (void)insertObject:(AbilityData *)value inAbilitiesAtIndex:(NSUInteger)idx;
- (void)removeObjectFromAbilitiesAtIndex:(NSUInteger)idx;
- (void)insertAbilities:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeAbilitiesAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInAbilitiesAtIndex:(NSUInteger)idx withObject:(AbilityData *)value;
- (void)replaceAbilitiesAtIndexes:(NSIndexSet *)indexes withAbilities:(NSArray *)values;
- (void)addAbilitiesObject:(AbilityData *)value;
- (void)removeAbilitiesObject:(AbilityData *)value;
- (void)addAbilities:(NSOrderedSet *)values;
- (void)removeAbilities:(NSOrderedSet *)values;
- (void)addPartiesObject:(PartyData *)value;
- (void)removePartiesObject:(PartyData *)value;
- (void)addParties:(NSSet *)values;
- (void)removeParties:(NSSet *)values;

@end
