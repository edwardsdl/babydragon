//
//  DefaultTraitData+Management.h
//  BabyDragon
//
//  Created by Eric Stenborg on 4/20/14.
//  Copyright (c) 2014 First Light Games. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DefaultTraitData.h"

@interface DefaultTraitData (Management)

+ (NSArray *)allDefaultTraitData;
+ (DefaultTraitData *)defaultTraitDataWithUUID:(NSString *)uuid;
+ (DefaultTraitData *)insertDefaultTraitData;
+ (void)removeAll;

@end
