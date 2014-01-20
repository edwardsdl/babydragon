//
//  MapNodeMenu.h
//  BabyDragon
//
//  Created by Eric Stenborg on 1/19/14.
//  Copyright 2014 First Light Games. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "FLMenu.h"
#import "MapNodeData+Management.h"

@interface MapNodeMenu : FLMenu {
    
}

-(id) initWithWorldIndex:(int) worldIndex;

@end
