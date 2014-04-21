#import "CoreDataHelper.h"
#import "DefaultTraitData+Management.h"
#import "DefaultTraitDataInitializer.h"
#import "TraitEffectType.h"

@implementation DefaultTraitDataInitializer

+(void) initializeData
{
    [DefaultTraitData removeAll];
    
    DefaultTraitData *defaultTraitData;
    
    defaultTraitData = [DefaultTraitData insertDefaultTraitData];
    [defaultTraitData setName:@"Healthy"];
    [defaultTraitData setDescriptionText:@"Gain more health per level"];
    [defaultTraitData setEffect:TraitEffectTypeMoreHealthPerLevel];
    [defaultTraitData setValue:0.4];
    
    defaultTraitData = [DefaultTraitData insertDefaultTraitData];
    [defaultTraitData setName:@"Skillful"];
    [defaultTraitData setDescriptionText:@"Gain more ability points per level"];
    [defaultTraitData setEffect:TraitEffectTypeMoreApPerLevel];
    [defaultTraitData setValue:0.4];
    
    defaultTraitData = [DefaultTraitData insertDefaultTraitData];
    [defaultTraitData setName:@"Courageous"];
    [defaultTraitData setDescriptionText:@"Gain more courage per level"];
    [defaultTraitData setEffect:TraitEffectTypeMoreCouragePerLevel];
    [defaultTraitData setValue:0.2];
    
    defaultTraitData = [DefaultTraitData insertDefaultTraitData];
    [defaultTraitData setName:@"Defensive"];
    [defaultTraitData setDescriptionText:@"Gain more defense per level"];
    [defaultTraitData setEffect:TraitEffectTypeMoreDefensePerLevel];
    [defaultTraitData setValue:0.2];
    
    defaultTraitData = [DefaultTraitData insertDefaultTraitData];
    [defaultTraitData setName:@"Powerful"];
    [defaultTraitData setDescriptionText:@"Gain more power per level"];
    [defaultTraitData setEffect:TraitEffectTypeMorePowerPerLevel];
    [defaultTraitData setValue:0.2];
    
    defaultTraitData = [DefaultTraitData insertDefaultTraitData];
    [defaultTraitData setName:@"Quick"];
    [defaultTraitData setDescriptionText:@"Gain more speed per level"];
    [defaultTraitData setEffect:TraitEffectTypeMoreSpeedPerLevel];
    [defaultTraitData setValue:0.2];
    
    defaultTraitData = [DefaultTraitData insertDefaultTraitData];
    [defaultTraitData setName:@"Intelligent"];
    [defaultTraitData setDescriptionText:@"Gain more willpower per level"];
    [defaultTraitData setEffect:TraitEffectTypeMoreWillpowerPerLevel];
    [defaultTraitData setValue:0.2];
    
    defaultTraitData = [DefaultTraitData insertDefaultTraitData];
    [defaultTraitData setName:@"Clever"];
    [defaultTraitData setDescriptionText:@"Gain more experience per battle"];
    [defaultTraitData setEffect:TraitEffectTypeMoreXpPerBattle];
    [defaultTraitData setValue:10];
    
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = [[CoreDataHelper sharedInstance] managedObjectContext];
    [managedObjectContext save:&error];
    
    if (error != nil)
    {
        NSLog(@"Failed to initialize trait data.");
    }
}

@end