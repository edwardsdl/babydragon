//
//  AcquisitionData.h
//  BabyDragon
//
//  Created by Dallas Edwards on 10/14/13.
//  Copyright (c) 2013 First Light Games. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "BaseData.h"


@interface AcquisitionData : BaseData

@property (nonatomic, retain) NSString * barcode;
@property (nonatomic, retain) NSString * latitude;
@property (nonatomic, retain) NSString * longitude;

@end
