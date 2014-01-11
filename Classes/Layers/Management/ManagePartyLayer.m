//
//  ManagePartyLayer.m
//  BabyDragon
//
//  Created by Eric Stenborg on 1/7/14.
//  Copyright 2014 First Light Games. All rights reserved.
//

#import "ManagePartyLayer.h"


@implementation ManagePartyLayer
{
    PartyData* party;
    NSArray* monstersInParty;
    NSMutableArray* monsterSprites;
    NSMutableArray* monsterLabels;
    FLMenu* saveButton;
    CGRect saveButtonBoundingBox;
}

+(CCScene *) sceneWithParty:(PartyData*) partyData
{
	CCScene *scene = [CCScene node];
	ManagePartyLayer *layer = [[ManagePartyLayer alloc] initWithParty:partyData];
	[scene addChild: layer];
	return scene;
}

-(id) initWithParty:(PartyData *)partyData
{
	if( (self=[super init]) )
    {
        self->party = partyData;
        
        self.touchEnabled = true;
        
        monstersInParty = [partyData.monsters allObjects];
        monsterSprites = [NSMutableArray array];
        monsterLabels = [NSMutableArray array];
        
        ScrollingMonsterSelectionList* list = [[ScrollingMonsterSelectionList alloc] init:self];
        list.position = ccp((220 / 2) + 5, 320 - (42.5 / 2) - 5);
        [self addChild:list];
        
        saveButton = [[FLMenu alloc] initWithDimensions:CGSizeMake(110, 25)];
        saveButton.position = ccp(568 - 32 - 55, 30);
        [saveButton addLabel:@"Save" color:ccc3(255, 255, 255) position:ccp(0, 0) size:14 centerAnchor:YES];
        saveButtonBoundingBox = CGRectMake((568 - 32 - 55) - 55, 30 - 12.5, 110, 25);
        [self addChild:saveButton];
                      
        [self renderParty];
        
    }
    return self;
}

-(void) renderParty
{
    [self clearPartyRender];
    
    int yOffset = 0;
    for (MonsterData* monster in monstersInParty)
    {
        if (monster != nil)
        {
            CCSprite* sprite = [CCSprite spriteWithFile:[NSString   stringWithFormat:@"%@_Standing.png", monster.type]];
            sprite.position = ccp(280, 250 - yOffset);
            [self addChild:sprite];
            [monsterSprites addObject:sprite];
        
            CCLabelTTF* label = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%@ (Level %i)", monster.name, monster.level] fontName:@"Georgia" fontSize:14];
            label.anchorPoint = CGPointZero;
            label.position = ccp(340, 245 - yOffset);
            [self addChild:label];
            [monsterLabels addObject:label];
        }
        
        yOffset += 80;
    }
}

-(void) clearPartyRender
{
    for (CCSprite* sprite in monsterSprites)
        [self removeChild:sprite];
    
    [monsterSprites removeAllObjects];
    
    for (CCLabelTTF* label in monsterLabels)
        [self removeChild:label];
    
    [monsterLabels removeAllObjects];

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

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    //Get touch position
    CGPoint position = [self convertTouchToNodeSpace:touch];
    
    if (CGRectContainsPoint(saveButtonBoundingBox, position))
    {
        CCScene* scene = [MyPartiesLayer scene];
        [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:scene]];

        
        return true;
    }
    
    for (CCSprite* sprite in monsterSprites)
    {
        if (CGRectContainsPoint(sprite.boundingBox, position))
        {
            uint index = [monsterSprites indexOfObject:sprite];
            
            [self->party removeMonstersObject:[monstersInParty objectAtIndex:index]];
            monstersInParty = [party.monsters allObjects];
             
            [self renderParty];
            
            return true;
        }
    }
    
    return false;
}

-(void) addMonsterToParty:(MonsterData*) monster
{
    [self->party addMonstersObject:monster];
    monstersInParty = [party.monsters allObjects];
    
    [self renderParty];
}

@end
