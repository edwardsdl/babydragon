//
//  DefaultItemData+Management.h
//  BabyDragon
//
//  Created by Dallas Edwards on 2/17/14.
//  Copyright (c) 2014 First Light Games. All rights reserved.
//

#import "DefaultItemData.h"

@interface DefaultItemData (Management)

+ (NSArray *)allDefaultItemData;
+ (DefaultItemData *)insertDefaultItemDataWithName:(NSString *)name;
+ (void)removeAll;

@end
