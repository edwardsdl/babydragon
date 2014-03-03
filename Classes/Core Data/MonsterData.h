//
//  MonsterData.h
//  BabyDragon
//
//  Created by Dallas Edwards on 3/2/14.
//  Copyright (c) 2014 First Light Games. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "AcquisitionData.h"

@class AbilityData, PartyData;

@interface MonsterData : AcquisitionData

@property (nonatomic) int32_t abilityPoints;
@property (nonatomic) int32_t attackType;
@property (nonatomic) float courage;
@property (nonatomic) float defense;
@property (nonatomic) int32_t elementType;
@property (nonatomic) int32_t experiencePoints;
@property (nonatomic) int32_t healthPoints;
@property (nonatomic) BOOL isFlying;
@property (nonatomic) BOOL isTranslucent;
@property (nonatomic) int32_t level;
@property (nonatomic, retain) NSString * name;
@property (nonatomic) int32_t paletteIndex;
@property (nonatomic) float power;
@property (nonatomic) float scalePercent;
@property (nonatomic) float speed;
@property (nonatomic, retain) id traits;
@property (nonatomic, retain) NSString * type;
@property (nonatomic) float willpower;
@property (nonatomic, retain) NSSet *abilities;
@property (nonatomic, retain) NSSet *parties;
@end

@interface MonsterData (CoreDataGeneratedAccessors)

- (void)addAbilitiesObject:(AbilityData *)value;
- (void)removeAbilitiesObject:(AbilityData *)value;
- (void)addAbilities:(NSSet *)values;
- (void)removeAbilities:(NSSet *)values;

- (void)addPartiesObject:(PartyData *)value;
- (void)removePartiesObject:(PartyData *)value;
- (void)addParties:(NSSet *)values;
- (void)removeParties:(NSSet *)values;

@end
