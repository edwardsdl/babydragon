//
//  BaseData.h
//  BabyDragon
//
//  Created by Dallas Edwards on 10/14/13.
//  Copyright (c) 2013 First Light Games. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface BaseData : NSManagedObject

@property (nonatomic) NSTimeInterval dateCreated;
@property (nonatomic) NSTimeInterval dateUpdated;

@end
