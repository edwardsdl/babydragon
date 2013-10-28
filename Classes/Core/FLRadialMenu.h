//
//  CombatRadialMenu.h
//  BabyDragon
//
//  Created by Eric Stenborg on 9/18/13.
//  Copyright (c) 2013 First Light Games. All rights reserved.
//

#import "FLEntity.h"
#import "FLRadialMenuItem.h"

@interface FLRadialMenu : NSObject

@property BOOL isOpen;

@property (nonatomic, retain) CCLayer *parentLayer;

@property (nonatomic, retain) NSMutableArray *items;

@property float itemDistanceFromCenter;

-(id) initToLayer:(CCLayer*)parentLayer;

-(void) addMenuItem:(FLRadialMenuItem*) item;

-(void) clearItems;

-(void) openMenuAt:(CGPoint) position;

-(void) closeMenu;

-(void) handleTouch:(CGPoint) location;

@end
