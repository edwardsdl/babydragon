//
//  Player.m
//  BabyDragon
//
//  Created by Eric Stenborg on 9/13/13.
//  Copyright (c) 2013 First Light Games. All rights reserved.
//

#import "Player.h"

@implementation Player

+ (Player*)sharedInstance
{
    static Player *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[Player alloc] init];
        // Do any other initialisation stuff here
    });
    return sharedInstance;
}



@end
