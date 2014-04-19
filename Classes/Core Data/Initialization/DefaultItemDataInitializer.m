#import "CoreDataHelper.h"
#import "DefaultItemData+Management.h"
#import "DefaultItemDataInitializer.h"
#import "AbilityData+Management.h"
#import "ItemEffectType.h"

@implementation ItemDataInitializer

+(void) initializeData
{
    [DefaultItemData removeAll];
    
    DefaultItemData *defaultItemData;
    
    defaultItemData = [DefaultItemData insertDefaultItemData];
    [defaultItemData setName:@"Minor Health Potion"];
    [defaultItemData setEffect:ItemEffectTypeRestoreHealth];
    [defaultItemData setValue:15];
    [defaultItemData setCost:0];
    [defaultItemData setProbability:100];
    
    defaultItemData = [DefaultItemData insertDefaultItemData];
    [defaultItemData setName:@"Health Potion"];
    [defaultItemData setEffect:ItemEffectTypeRestoreHealth];
    [defaultItemData setValue:30];
    [defaultItemData setCost:0];
    [defaultItemData setProbability:70];
    
    defaultItemData = [DefaultItemData insertDefaultItemData];
    [defaultItemData setName:@"Major Healing Potion"];
    [defaultItemData setEffect:ItemEffectTypeRestoreHealth];
    [defaultItemData setValue:45];
    [defaultItemData setCost:0];
    [defaultItemData setProbability:45];
    
    defaultItemData = [DefaultItemData insertDefaultItemData];
    [defaultItemData setName:@"Extreme Healing Potion"];
    [defaultItemData setEffect:ItemEffectTypeRestoreHealth];
    [defaultItemData setValue:60];
    [defaultItemData setCost:0];
    [defaultItemData setProbability:15];
    
    defaultItemData = [DefaultItemData insertDefaultItemData];
    [defaultItemData setName:@"Minor Ability Potion"];
    [defaultItemData setEffect:ItemEffectTypeRestoreAP];
    [defaultItemData setValue:15];
    [defaultItemData setCost:0];
    [defaultItemData setProbability:100];
    
    defaultItemData = [DefaultItemData insertDefaultItemData];
    [defaultItemData setName:@"Ability Potion"];
    [defaultItemData setEffect:ItemEffectTypeRestoreAP];
    [defaultItemData setValue:30];
    [defaultItemData setCost:0];
    [defaultItemData setProbability:75];
    
    defaultItemData = [DefaultItemData insertDefaultItemData];
    [defaultItemData setName:@"Major Ability Potion"];
    [defaultItemData setEffect:ItemEffectTypeRestoreAP];
    [defaultItemData setValue:45];
    [defaultItemData setCost:0];
    [defaultItemData setProbability:45];
    
    defaultItemData = [DefaultItemData insertDefaultItemData];
    [defaultItemData setName:@"Extreme Ability Potion"];
    [defaultItemData setEffect:ItemEffectTypeRestoreAP];
    [defaultItemData setValue:60];
    [defaultItemData setCost:0];
    [defaultItemData setProbability:15];
    
    defaultItemData = [DefaultItemData insertDefaultItemData];
    [defaultItemData setName:@"Small Revive Stone"];
    [defaultItemData setEffect:ItemEffectTypeReviveAlly];
    [defaultItemData setValue:0.25];
    [defaultItemData setCost:0];
    [defaultItemData setProbability:50];
    
    defaultItemData = [DefaultItemData insertDefaultItemData];
    [defaultItemData setName:@"Revive Stone"];
    [defaultItemData setEffect:ItemEffectTypeReviveAlly];
    [defaultItemData setValue:0.5];
    [defaultItemData setCost:0];
    [defaultItemData setProbability:35];
    
    defaultItemData = [DefaultItemData insertDefaultItemData];
    [defaultItemData setName:@"Large Revive Stone"];
    [defaultItemData setEffect:ItemEffectTypeReviveAlly];
    [defaultItemData setValue:0.75];
    [defaultItemData setCost:0];
    [defaultItemData setProbability:10];
    
    defaultItemData = [DefaultItemData insertDefaultItemData];
    [defaultItemData setName:@"Courage Potion"];
    [defaultItemData setEffect:ItemEffectTypeBuffCourage];
    [defaultItemData setValue:0.35];
    [defaultItemData setCost:0];
    [defaultItemData setProbability:30];
    
    defaultItemData = [DefaultItemData insertDefaultItemData];
    [defaultItemData setName:@"Defense Potion"];
    [defaultItemData setEffect:ItemEffectTypeBuffDefense];
    [defaultItemData setValue:0.35];
    [defaultItemData setCost:0];
    [defaultItemData setProbability:30];
    
    defaultItemData = [DefaultItemData insertDefaultItemData];
    [defaultItemData setName:@"Power Potion"];
    [defaultItemData setEffect:ItemEffectTypeBuffPower];
    [defaultItemData setValue:0.35];
    [defaultItemData setCost:0];
    [defaultItemData setProbability:30];
    
    defaultItemData = [DefaultItemData insertDefaultItemData];
    [defaultItemData setName:@"Speed Potion"];
    [defaultItemData setEffect:ItemEffectTypeBuffSpeed];
    [defaultItemData setValue:0.35];
    [defaultItemData setCost:0];
    [defaultItemData setProbability:30];
    
    defaultItemData = [DefaultItemData insertDefaultItemData];
    [defaultItemData setName:@"Willpower Potion"];
    [defaultItemData setEffect:ItemEffectTypeBuffWillpower];
    [defaultItemData setValue:0.35];
    [defaultItemData setCost:0];
    [defaultItemData setProbability:30];
    
    defaultItemData = [DefaultItemData insertDefaultItemData];
    [defaultItemData setName:@"Small Scanning Extension"];
    [defaultItemData setEffect:ItemEffectTypeExtraScans];
    [defaultItemData setValue:5];
    [defaultItemData setCost:-1];
    [defaultItemData setProbability:25];
    
    defaultItemData = [DefaultItemData insertDefaultItemData];
    [defaultItemData setName:@"Scanning Extension"];
    [defaultItemData setEffect:ItemEffectTypeExtraScans];
    [defaultItemData setValue:10];
    [defaultItemData setCost:-1];
    [defaultItemData setProbability:17];
    
    defaultItemData = [DefaultItemData insertDefaultItemData];
    [defaultItemData setName:@"Large Scanning Extension"];
    [defaultItemData setEffect:ItemEffectTypeExtraScans];
    [defaultItemData setValue:15];
    [defaultItemData setCost:-1];
    [defaultItemData setProbability:10];
    
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = [[CoreDataHelper sharedInstance] managedObjectContext];
    [managedObjectContext save:&error];
    
    if (error != nil)
    {
        NSLog(@"Failed to initialize ability data.");
    }
}

@end