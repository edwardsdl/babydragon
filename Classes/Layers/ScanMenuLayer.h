//
//  ScanMenuLayer.h
//  BabyDragon
//
//  Created by Eric Stenborg on 9/13/13.
//  Copyright 2013 First Light Games. All rights reserved.
//

#import "cocos2d.h"
#import <Foundation/Foundation.h>

@interface ScanMenuLayer : CCLayer <ZBarReaderDelegate>

+(CCScene *) scene;

@end
