//
//  PartyNode.m
//  BabyDragon
//
//  Created by Eric Stenborg on 1/5/14.
//  Copyright 2014 First Light Games. All rights reserved.
//

#import "PartyNode.h"


@implementation PartyNode
{
    CGRect boundingBox;
    PartyData* selectedParty;
}

+(PartyNode*) Create
{
    PartyNode *node = [[PartyNode alloc] initWithDimensions:CGSizeMake(260, 240)];
    node.visible = YES;
    return node;
}

-(id) initWithDimensions:(CGSize) dim
{
    if( (self=[super initWithDimensions:dim]) )
    {
        //Determine bounding box
        self->boundingBox = CGRectMake((self->dimensions.width / 2) * -1, (self->dimensions.height / 2) * -1, self->dimensions.width, self->dimensions.height);
    }
    return self;
}

-(void) showNewParty:(PartyData*) partyData
{
    selectedParty = partyData;
    
    [self removeAllChildren];
    
    [self addLabel:[NSString stringWithFormat:@"%@", partyData.name] color:ccc3(255, 255, 255) position:ccp(-120, 100) size:14 centerAnchor:NO];
    
    int index = 0;
    for (MonsterData* monsterData in partyData.monsters)
    {
        CCSprite* monsterSprite = [CCSprite spriteWithFile:[NSString stringWithFormat:@"%@_Standing.png", monsterData.type]];
        monsterSprite.scaleX = -0.5f;
        monsterSprite.scaleY = 0.5;
        monsterSprite.position = ccp(-120 + 20, (100 - 20) - (40 * index));
        [self addChild:monsterSprite];

        [self addLabel:[NSString stringWithFormat:@"%@ (Level %i)", monsterData.name, monsterData.level] color:ccc3(255, 255, 255) position:ccp(-100 + 25, (100 - 30) - (40 * index)) size:14 centerAnchor:NO];
        
        index++;
    }
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
    
    //Ignore if not in the bounding box
    if (CGRectContainsPoint(self->boundingBox, position))
    {
        if (selectedParty != nil)
        {
            CCScene* scene = [ManagePartyLayer sceneWithParty:selectedParty];
            [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:scene]];
        }
        
        return YES;
    }
    
    return NO;
}

@end
