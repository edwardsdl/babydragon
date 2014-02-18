//
//  GoldData+Management.h
//  BabyDragon
//
//  Created by Dallas Edwards on 2/17/14.
//  Copyright (c) 2014 First Light Games. All rights reserved.
//

#import "GoldData.h"

@interface GoldData (Management)

+ (NSArray *)allGold;
+ (GoldData *)insertGoldWithAmount:(int)amount barcode:(NSString *)barcode;
+ (void)removeAll;

@end
