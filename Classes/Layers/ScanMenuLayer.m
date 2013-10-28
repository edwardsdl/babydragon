//
//  ScanMenuLayer.m
//  BabyDragon
//
//  Created by Eric Stenborg on 9/13/13.
//  Copyright 2013 First Light Games. All rights reserved.
//

#import "ScanMenuLayer.h"
#import "ScanAcquisitionLayer.h"
#import "CVZBarReaderViewController.h"

@implementation ScanMenuLayer

+(CCScene *) scene
{
	CCScene *scene = [CCScene node];
	ScanMenuLayer *layer = [ScanMenuLayer node];
	[scene addChild: layer];
	return scene;
}

-(id) init
{
    if( (self=[super init]) )
    {
        self.touchEnabled = true;
        
        // ask director for the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
            
        //Create a menu
        CCMenuItemFont *scanMenuItem = [CCMenuItemFont itemWithString:@"Scan" target:self selector:@selector(doScan)];
        scanMenuItem.fontSize = 26;
        scanMenuItem.fontName = @"Arial Rounded MT Bold";
                
        CCMenu * myMenu = [CCMenu menuWithItems:scanMenuItem, nil];
        [myMenu alignItemsVertically];
         myMenu.position = ccp(size.width/2, size.height/2);
        [self addChild:myMenu];
	}
    
	return self;

}

-(void) doScan
{
    CVZBarReaderViewController *reader = [[CVZBarReaderViewController alloc] init];
    reader.readerDelegate = self;
    reader.supportedOrientationsMask = ZBarOrientationMaskAll;
    
    ZBarImageScanner *scanner = reader.scanner;
    // TODO: (optional) additional reader configuration here
    
    // EXAMPLE: disable rarely used I2/5 to improve performance
    [scanner setSymbology: ZBAR_I25
                   config: ZBAR_CFG_ENABLE
                       to: 0];
    
    [[CCDirector sharedDirector] presentViewController:reader animated:YES completion:nil];
}

-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    id<NSFastEnumeration> results = [info objectForKey:ZBarReaderControllerResults];
    ZBarSymbol *symbol;
    for (symbol in results)
        break;
    
    [picker dismissViewControllerAnimated: YES completion:nil];
    
    [[CCDirector sharedDirector] replaceScene:[ScanAcquisitionLayer sceneWithBarCodeNumber:symbol.data]];
}

@end
