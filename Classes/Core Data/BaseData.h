//
//  BaseData.h
//  BabyDragon
//
//  Created by Dallas Edwards on 3/2/14.
//  Copyright (c) 2014 First Light Games. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface BaseData : NSManagedObject

@property (nonatomic) NSTimeInterval dateCreated;
@property (nonatomic) NSTimeInterval dateUpdated;
@property (nonatomic, retain) NSString * uuid;

@end
