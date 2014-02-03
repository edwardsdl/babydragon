//
//  AcquisitionData.h
//  BabyDragon
//
//  Created by Dallas Edwards on 2/2/14.
//  Copyright (c) 2014 First Light Games. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "BaseData.h"


@interface AcquisitionData : BaseData

@property (nonatomic, retain) NSString * barcode;
@property (nonatomic) double latitude;
@property (nonatomic) double longitude;

@end
