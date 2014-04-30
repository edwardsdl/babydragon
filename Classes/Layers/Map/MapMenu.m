//
//  MapMenu.m
//  BabyDragon
//
//  Created by Eric Stenborg on 1/13/14.
//  Copyright 2014 First Light Games. All rights reserved.
//

#import "ElementType.h"
#import "LevelBonusType.h"
#import "LootDensityType.h"
#import "MapMenu.h"


@implementation MapMenu
{
    CCSprite* scanIconSprite;
    CCSprite* manageIconSprite;
    CCSprite* fightIconSprite;
    CCSprite* levelIconSprite;
}

//----------------------------------------------------------------------------------
//----------- Initialization Methods
//----------------------------------------------------------------------------------

-(id) init
{
	if( (self=[super init]) )
    {
        scanIconSprite = [CCSprite spriteWithFile:@"ScanIcon.png"];
        [self addChild:scanIconSprite];
        
        manageIconSprite = [CCSprite spriteWithFile:@"ManageIcon.png"];
        manageIconSprite.position = ccp(0, -45);
        [self addChild:manageIconSprite];
        
        fightIconSprite = [CCSprite spriteWithFile:@"FightIcon.png"];
        fightIconSprite.position = ccp(0, -45 * 2);
        [self addChild:fightIconSprite];
        
        levelIconSprite = [CCSprite spriteWithFile:@"FightIcon.png"];
        levelIconSprite.position = ccp(0, -45 * 3);
        [self addChild:levelIconSprite];
    }
    return self;
}

- (void)onEnter
{
    [[[CCDirector sharedDirector] touchDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
    [super onEnter];
}

- (void)onExit
{
    [[[CCDirector sharedDirector] touchDispatcher] removeDelegate:self];
    [super onExit];
}

//----------------------------------------------------------------------------------
//----------- Touch Input Methods
//----------------------------------------------------------------------------------

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    //Get touch position
    CGPoint position = [self convertTouchToNodeSpace:touch];
    
    if (CGRectContainsPoint(scanIconSprite.boundingBox, position))
    {
        [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[ScanMenuLayer scene] ]];
        return YES;
    }
    else if (CGRectContainsPoint(manageIconSprite.boundingBox, position))
    {
        [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[ManageLayer scene] ]];
        return YES;
    }
    else if (CGRectContainsPoint(fightIconSprite.boundingBox, position))
    {
        //This one is purely for debug
        PartyData *partyOne = [PartyData anyPartyWithName:@"Player Party"];
        PartyData *partyTwo = [PartyData anyPartyWithName:@"AI Party"];
        
        [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0
                                                    scene:[CombatLayer sceneWithPartyOne:partyOne
                                                                andPartyTwo:partyTwo
                                                                withBackgroundNamed:@"Test"
                                                                nextLayer:CombatNextLayerMap]]];
        return YES;
    }
    else if (CGRectContainsPoint(levelIconSprite.boundingBox, position))
    {
        Level *level = [[Level alloc] initWithLevelBonusType:MediumGoldBonus
                                                   levelSize:SmallLevelSize
                                                 lootDensity:MediumLootDensity
                                                    maxLevel:1
                                                    minLevel:3
                                          primaryElementType:ElementTypeFire
                                        secondaryElementType:ElementTypeEarth];
        [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[LevelLayer sceneWithNewLevel:level] ]];
        return YES;
    }
    
    return NO;
}

@end
