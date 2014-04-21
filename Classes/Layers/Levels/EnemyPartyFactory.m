//
//  EnemyPartyFactory.m
//  BabyDragon
//
//  Created by Eric Stenborg on 4/12/14.
//  Copyright (c) 2014 First Light Games. All rights reserved.
//

#import "EnemyPartyFactory.h"

@implementation EnemyPartyFactory

+(PartyData*) CreateEnemyPartyOfElement:(ElementType) element MinLevel:(int) minLevel MaxLevel:(int) maxLevel
{
    MonsterData* monster1 = [self CreateMonsterOfElement:element MinLevel:minLevel MaxLevel:maxLevel];
    MonsterData* monster2 = [self CreateMonsterOfElement:element MinLevel:minLevel MaxLevel:maxLevel];
    MonsterData* monster3 = [self CreateMonsterOfElement:element MinLevel:minLevel MaxLevel:maxLevel];
    
    //If there is already an AI party then get rid of it
    [PartyData removeWithName:@"AI Party"];
    
    //Create a new AI party using the new monsters
    NSArray *monsters = @[monster1, monster2, monster3];
    PartyData* party = [PartyData insertPartyWithName:@"AI Party" monsters:monsters];
    
    //Save to core data
    [[CoreDataHelper sharedInstance] save];
    
    return party;
    
}

+(MonsterData*) CreateMonsterOfElement:(ElementType) element MinLevel:(int) minLevel MaxLevel:(int) maxLevel
{
    //Determine the rarity for this monster randomly, but cant until we have all monsters in
    Rarity rarity = Common;
    
    //Find matching monsters
    NSArray* matchingMonsters = [DefaultMonsterData defaultMonsterDataByElement:[NSNumber numberWithInt:element] AndRarity:[NSNumber numberWithInt:rarity]];
    
    //Randomly choose one
    uint32_t rnd = arc4random_uniform([matchingMonsters count]);
    DefaultMonsterData* defaultMonsterData = [matchingMonsters objectAtIndex:rnd];
    
    //Build a real monster from the default monster data
    MonsterData* monster = [MonsterData insertMonsterWithType:defaultMonsterData.type barcode:@"AI"];
    //Choose a random level from the range
    int level = (int)minLevel + arc4random() % (maxLevel - minLevel + 1);
    [monster levelUp:level - 1];
    for (int i = 1; i <= level; i++)
        [monster assignAbilitiesForLevel:i];
    
    return monster;
}

@end
