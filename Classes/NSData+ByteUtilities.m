//
//  NSData+ByteUtilities.m
//  BabyDragon
//
//  Created by Dallas Edwards on 10/13/13.
//  Copyright (c) 2013 First Light Games. All rights reserved.
//

#import "NSData+ByteUtilities.h"

@implementation NSData (ByteUtilities)

- (uint8_t)byteAtIndex:(int)index
{
    uint8_t buffer = 0;
    [self getBytes:&buffer range:NSMakeRange(index, 1)];
    
    return buffer;
}

@end
