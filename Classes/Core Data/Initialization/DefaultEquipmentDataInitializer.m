#import "CoreDataHelper.h"
#import "DefaultEquipmentData+Management.h"
#import "DefaultEquipmentDataInitializer.h"
#import "ElementType.h"
#import "EquipmentEffectType.h"

@implementation DefaultEquipmentDataInitializer

+(void) initializeData
{
    [DefaultEquipmentData removeAll];
    
    DefaultEquipmentData *defaultEquipmentData;
    
    defaultEquipmentData = [DefaultEquipmentData insertDefaultEquipmentData];
    [defaultEquipmentData setName:@"Fire Gem"];
    [defaultEquipmentData setEffect:EquipmentEffectTypeIncreaseElementalAttack];
    [defaultEquipmentData setElementType:ElementTypeFire];
    [defaultEquipmentData setValue:15];
    [defaultEquipmentData setCost:0];
    [defaultEquipmentData setProbability:100];
    
    defaultEquipmentData = [DefaultEquipmentData insertDefaultEquipmentData];
    [defaultEquipmentData setName:@"Water Gem"];
    [defaultEquipmentData setEffect:EquipmentEffectTypeIncreaseElementalAttack];
    [defaultEquipmentData setElementType:ElementTypeWater];
    [defaultEquipmentData setValue:15];
    [defaultEquipmentData setCost:0];
    [defaultEquipmentData setProbability:100];
    
    defaultEquipmentData = [DefaultEquipmentData insertDefaultEquipmentData];
    [defaultEquipmentData setName:@"Earth Gem"];
    [defaultEquipmentData setEffect:EquipmentEffectTypeIncreaseElementalAttack];
    [defaultEquipmentData setElementType:ElementTypeEarth];
    [defaultEquipmentData setValue:15];
    [defaultEquipmentData setCost:0];
    [defaultEquipmentData setProbability:100];
    
    defaultEquipmentData = [DefaultEquipmentData insertDefaultEquipmentData];
    [defaultEquipmentData setName:@"Holy Gem"];
    [defaultEquipmentData setEffect:EquipmentEffectTypeIncreaseElementalAttack];
    [defaultEquipmentData setElementType:ElementTypeHoly];
    [defaultEquipmentData setValue:15];
    [defaultEquipmentData setCost:0];
    [defaultEquipmentData setProbability:100];
    
    defaultEquipmentData = [DefaultEquipmentData insertDefaultEquipmentData];
    [defaultEquipmentData setName:@"Dark Gem"];
    [defaultEquipmentData setEffect:EquipmentEffectTypeIncreaseElementalAttack];
    [defaultEquipmentData setElementType:ElementTypeDarkness];
    [defaultEquipmentData setValue:15];
    [defaultEquipmentData setCost:0];
    [defaultEquipmentData setProbability:100];
    
    defaultEquipmentData = [DefaultEquipmentData insertDefaultEquipmentData];
    [defaultEquipmentData setName:@"Rare Fire Gem"];
    [defaultEquipmentData setEffect:EquipmentEffectTypeIncreaseElementalAttack];
    [defaultEquipmentData setElementType:ElementTypeFire];
    [defaultEquipmentData setValue:20];
    [defaultEquipmentData setCost:0];
    [defaultEquipmentData setProbability:50];
    
    defaultEquipmentData = [DefaultEquipmentData insertDefaultEquipmentData];
    [defaultEquipmentData setName:@"Rare Water Gem"];
    [defaultEquipmentData setEffect:EquipmentEffectTypeIncreaseElementalAttack];
    [defaultEquipmentData setElementType:ElementTypeWater];
    [defaultEquipmentData setValue:20];
    [defaultEquipmentData setCost:0];
    [defaultEquipmentData setProbability:50];
    
    defaultEquipmentData = [DefaultEquipmentData insertDefaultEquipmentData];
    [defaultEquipmentData setName:@"Rare Earth Gem"];
    [defaultEquipmentData setEffect:EquipmentEffectTypeIncreaseElementalAttack];
    [defaultEquipmentData setElementType:ElementTypeEarth];
    [defaultEquipmentData setValue:20];
    [defaultEquipmentData setCost:0];
    [defaultEquipmentData setProbability:50];
    
    defaultEquipmentData = [DefaultEquipmentData insertDefaultEquipmentData];
    [defaultEquipmentData setName:@"Rare Holy Gem"];
    [defaultEquipmentData setEffect:EquipmentEffectTypeIncreaseElementalAttack];
    [defaultEquipmentData setElementType:ElementTypeHoly];
    [defaultEquipmentData setValue:20];
    [defaultEquipmentData setCost:0];
    [defaultEquipmentData setProbability:50];
    
    defaultEquipmentData = [DefaultEquipmentData insertDefaultEquipmentData];
    [defaultEquipmentData setName:@"Rare Dark Gem"];
    [defaultEquipmentData setEffect:EquipmentEffectTypeIncreaseElementalAttack];
    [defaultEquipmentData setElementType:ElementTypeDarkness];
    [defaultEquipmentData setValue:20];
    [defaultEquipmentData setCost:0];
    [defaultEquipmentData setProbability:50];
    
    defaultEquipmentData = [DefaultEquipmentData insertDefaultEquipmentData];
    [defaultEquipmentData setName:@"Epic Fire Gem"];
    [defaultEquipmentData setEffect:EquipmentEffectTypeIncreaseElementalAttack];
    [defaultEquipmentData setElementType:ElementTypeFire];
    [defaultEquipmentData setValue:25];
    [defaultEquipmentData setCost:0];
    [defaultEquipmentData setProbability:25];
    
    defaultEquipmentData = [DefaultEquipmentData insertDefaultEquipmentData];
    [defaultEquipmentData setName:@"Epic Water Gem"];
    [defaultEquipmentData setEffect:EquipmentEffectTypeIncreaseElementalAttack];
    [defaultEquipmentData setElementType:ElementTypeWater];
    [defaultEquipmentData setValue:25];
    [defaultEquipmentData setCost:0];
    [defaultEquipmentData setProbability:25];
    
    defaultEquipmentData = [DefaultEquipmentData insertDefaultEquipmentData];
    [defaultEquipmentData setName:@"Epic Earth Gem"];
    [defaultEquipmentData setEffect:EquipmentEffectTypeIncreaseElementalAttack];
    [defaultEquipmentData setElementType:ElementTypeEarth];
    [defaultEquipmentData setValue:25];
    [defaultEquipmentData setCost:0];
    [defaultEquipmentData setProbability:25];
    
    defaultEquipmentData = [DefaultEquipmentData insertDefaultEquipmentData];
    [defaultEquipmentData setName:@"Epic Holy Gem"];
    [defaultEquipmentData setEffect:EquipmentEffectTypeIncreaseElementalAttack];
    [defaultEquipmentData setElementType:ElementTypeHoly];
    [defaultEquipmentData setValue:25];
    [defaultEquipmentData setCost:0];
    [defaultEquipmentData setProbability:25];
    
    defaultEquipmentData = [DefaultEquipmentData insertDefaultEquipmentData];
    [defaultEquipmentData setName:@"Epic Dark Gem"];
    [defaultEquipmentData setEffect:EquipmentEffectTypeIncreaseElementalAttack];
    [defaultEquipmentData setElementType:ElementTypeDarkness];
    [defaultEquipmentData setValue:25];
    [defaultEquipmentData setCost:0];
    [defaultEquipmentData setProbability:25];
    
    defaultEquipmentData = [DefaultEquipmentData insertDefaultEquipmentData];
    [defaultEquipmentData setName:@"Aegis of Flame"];
    [defaultEquipmentData setEffect:EquipmentEffectTypeIncreaseElementalDefense];
    [defaultEquipmentData setElementType:ElementTypeFire];
    [defaultEquipmentData setValue:30];
    [defaultEquipmentData setCost:0];
    [defaultEquipmentData setProbability:100];
    
    defaultEquipmentData = [DefaultEquipmentData insertDefaultEquipmentData];
    [defaultEquipmentData setName:@"Aegis of Ice"];
    [defaultEquipmentData setEffect:EquipmentEffectTypeIncreaseElementalDefense];
    [defaultEquipmentData setElementType:ElementTypeWater];
    [defaultEquipmentData setValue:30];
    [defaultEquipmentData setCost:0];
    [defaultEquipmentData setProbability:100];
    
    defaultEquipmentData = [DefaultEquipmentData insertDefaultEquipmentData];
    [defaultEquipmentData setName:@"Aegis of Gem"];
    [defaultEquipmentData setEffect:EquipmentEffectTypeIncreaseElementalDefense];
    [defaultEquipmentData setElementType:ElementTypeEarth];
    [defaultEquipmentData setValue:30];
    [defaultEquipmentData setCost:0];
    [defaultEquipmentData setProbability:100];
    
    defaultEquipmentData = [DefaultEquipmentData insertDefaultEquipmentData];
    [defaultEquipmentData setName:@"Aegis of Light"];
    [defaultEquipmentData setEffect:EquipmentEffectTypeIncreaseElementalDefense];
    [defaultEquipmentData setElementType:ElementTypeHoly];
    [defaultEquipmentData setValue:30];
    [defaultEquipmentData setCost:0];
    [defaultEquipmentData setProbability:100];
    
    defaultEquipmentData = [DefaultEquipmentData insertDefaultEquipmentData];
    [defaultEquipmentData setName:@"Aegis of Shadow"];
    [defaultEquipmentData setEffect:EquipmentEffectTypeIncreaseElementalDefense];
    [defaultEquipmentData setElementType:ElementTypeDarkness];
    [defaultEquipmentData setValue:30];
    [defaultEquipmentData setCost:0];
    [defaultEquipmentData setProbability:100];
    
    defaultEquipmentData = [DefaultEquipmentData insertDefaultEquipmentData];
    [defaultEquipmentData setName:@"Rare Aegis of Flame"];
    [defaultEquipmentData setEffect:EquipmentEffectTypeIncreaseElementalDefense];
    [defaultEquipmentData setElementType:ElementTypeFire];
    [defaultEquipmentData setValue:45];
    [defaultEquipmentData setCost:0];
    [defaultEquipmentData setProbability:50];
    
    defaultEquipmentData = [DefaultEquipmentData insertDefaultEquipmentData];
    [defaultEquipmentData setName:@"Rare Aegis of Ice"];
    [defaultEquipmentData setEffect:EquipmentEffectTypeIncreaseElementalDefense];
    [defaultEquipmentData setElementType:ElementTypeWater];
    [defaultEquipmentData setValue:45];
    [defaultEquipmentData setCost:0];
    [defaultEquipmentData setProbability:50];
    
    defaultEquipmentData = [DefaultEquipmentData insertDefaultEquipmentData];
    [defaultEquipmentData setName:@"Rare Aegis of Gem"];
    [defaultEquipmentData setEffect:EquipmentEffectTypeIncreaseElementalDefense];
    [defaultEquipmentData setElementType:ElementTypeEarth];
    [defaultEquipmentData setValue:45];
    [defaultEquipmentData setCost:0];
    [defaultEquipmentData setProbability:50];
    
    defaultEquipmentData = [DefaultEquipmentData insertDefaultEquipmentData];
    [defaultEquipmentData setName:@"Rare Aegis of Light"];
    [defaultEquipmentData setEffect:EquipmentEffectTypeIncreaseElementalDefense];
    [defaultEquipmentData setElementType:ElementTypeHoly];
    [defaultEquipmentData setValue:45];
    [defaultEquipmentData setCost:0];
    [defaultEquipmentData setProbability:50];
    
    defaultEquipmentData = [DefaultEquipmentData insertDefaultEquipmentData];
    [defaultEquipmentData setName:@"Rare Aegis of Shadow"];
    [defaultEquipmentData setEffect:EquipmentEffectTypeIncreaseElementalDefense];
    [defaultEquipmentData setElementType:ElementTypeDarkness];
    [defaultEquipmentData setValue:45];
    [defaultEquipmentData setCost:0];
    [defaultEquipmentData setProbability:50];
    
    defaultEquipmentData = [DefaultEquipmentData insertDefaultEquipmentData];
    [defaultEquipmentData setName:@"Epic Aegis of Flame"];
    [defaultEquipmentData setEffect:EquipmentEffectTypeIncreaseElementalDefense];
    [defaultEquipmentData setElementType:ElementTypeFire];
    [defaultEquipmentData setValue:60];
    [defaultEquipmentData setCost:0];
    [defaultEquipmentData setProbability:25];
    
    defaultEquipmentData = [DefaultEquipmentData insertDefaultEquipmentData];
    [defaultEquipmentData setName:@"Epic Aegis of Ice"];
    [defaultEquipmentData setEffect:EquipmentEffectTypeIncreaseElementalDefense];
    [defaultEquipmentData setElementType:ElementTypeWater];
    [defaultEquipmentData setValue:60];
    [defaultEquipmentData setCost:0];
    [defaultEquipmentData setProbability:25];
    
    defaultEquipmentData = [DefaultEquipmentData insertDefaultEquipmentData];
    [defaultEquipmentData setName:@"Epic Aegis of Gem"];
    [defaultEquipmentData setEffect:EquipmentEffectTypeIncreaseElementalDefense];
    [defaultEquipmentData setElementType:ElementTypeEarth];
    [defaultEquipmentData setValue:60];
    [defaultEquipmentData setCost:0];
    [defaultEquipmentData setProbability:25];
    
    defaultEquipmentData = [DefaultEquipmentData insertDefaultEquipmentData];
    [defaultEquipmentData setName:@"Epic Aegis of Light"];
    [defaultEquipmentData setEffect:EquipmentEffectTypeIncreaseElementalDefense];
    [defaultEquipmentData setElementType:ElementTypeHoly];
    [defaultEquipmentData setValue:60];
    [defaultEquipmentData setCost:0];
    [defaultEquipmentData setProbability:25];
    
    defaultEquipmentData = [DefaultEquipmentData insertDefaultEquipmentData];
    [defaultEquipmentData setName:@"Epic Aegis of Shadow"];
    [defaultEquipmentData setEffect:EquipmentEffectTypeIncreaseElementalDefense];
    [defaultEquipmentData setElementType:ElementTypeDarkness];
    [defaultEquipmentData setValue:60];
    [defaultEquipmentData setCost:0];
    [defaultEquipmentData setProbability:25];
    
    defaultEquipmentData = [DefaultEquipmentData insertDefaultEquipmentData];
    [defaultEquipmentData setName:@"Pendant of Health"];
    [defaultEquipmentData setEffect:EquipmentEffectTypeIncreaseHealth];
    [defaultEquipmentData setElementType:ElementTypeNone];
    [defaultEquipmentData setValue:10];
    [defaultEquipmentData setCost:0];
    [defaultEquipmentData setProbability:100];
    
    defaultEquipmentData = [DefaultEquipmentData insertDefaultEquipmentData];
    [defaultEquipmentData setName:@"Rare Pendant of Health"];
    [defaultEquipmentData setEffect:EquipmentEffectTypeIncreaseHealth];
    [defaultEquipmentData setElementType:ElementTypeNone];
    [defaultEquipmentData setValue:20];
    [defaultEquipmentData setCost:0];
    [defaultEquipmentData setProbability:50];
    
    defaultEquipmentData = [DefaultEquipmentData insertDefaultEquipmentData];
    [defaultEquipmentData setName:@"Epic Pendant of Health"];
    [defaultEquipmentData setEffect:EquipmentEffectTypeIncreaseHealth];
    [defaultEquipmentData setElementType:ElementTypeNone];
    [defaultEquipmentData setValue:30];
    [defaultEquipmentData setCost:0];
    [defaultEquipmentData setProbability:25];
    
    defaultEquipmentData = [DefaultEquipmentData insertDefaultEquipmentData];
    [defaultEquipmentData setName:@"Ring of Skill"];
    [defaultEquipmentData setEffect:EquipmentEffectTypeIncreaseAbility];
    [defaultEquipmentData setElementType:ElementTypeNone];
    [defaultEquipmentData setValue:10];
    [defaultEquipmentData setCost:0];
    [defaultEquipmentData setProbability:100];
    
    defaultEquipmentData = [DefaultEquipmentData insertDefaultEquipmentData];
    [defaultEquipmentData setName:@"Rare Ring of Skill"];
    [defaultEquipmentData setEffect:EquipmentEffectTypeIncreaseAbility];
    [defaultEquipmentData setElementType:ElementTypeNone];
    [defaultEquipmentData setValue:20];
    [defaultEquipmentData setCost:0];
    [defaultEquipmentData setProbability:50];
    
    defaultEquipmentData = [DefaultEquipmentData insertDefaultEquipmentData];
    [defaultEquipmentData setName:@"Epic Ring of Skill"];
    [defaultEquipmentData setEffect:EquipmentEffectTypeIncreaseAbility];
    [defaultEquipmentData setElementType:ElementTypeNone];
    [defaultEquipmentData setValue:30];
    [defaultEquipmentData setCost:0];
    [defaultEquipmentData setProbability:25];
    
    defaultEquipmentData = [DefaultEquipmentData insertDefaultEquipmentData];
    [defaultEquipmentData setName:@"Knight's Badge"];
    [defaultEquipmentData setEffect:EquipmentEffectTypeIncreaseCourage];
    [defaultEquipmentData setElementType:ElementTypeNone];
    [defaultEquipmentData setValue:10];
    [defaultEquipmentData setCost:0];
    [defaultEquipmentData setProbability:100];
    
    defaultEquipmentData = [DefaultEquipmentData insertDefaultEquipmentData];
    [defaultEquipmentData setName:@"Rare Knight's Badge"];
    [defaultEquipmentData setEffect:EquipmentEffectTypeIncreaseCourage];
    [defaultEquipmentData setElementType:ElementTypeNone];
    [defaultEquipmentData setValue:20];
    [defaultEquipmentData setCost:0];
    [defaultEquipmentData setProbability:50];
    
    defaultEquipmentData = [DefaultEquipmentData insertDefaultEquipmentData];
    [defaultEquipmentData setName:@"Epic Knight's Badge"];
    [defaultEquipmentData setEffect:EquipmentEffectTypeIncreaseCourage];
    [defaultEquipmentData setElementType:ElementTypeNone];
    [defaultEquipmentData setValue:30];
    [defaultEquipmentData setCost:0];
    [defaultEquipmentData setProbability:25];
    
    defaultEquipmentData = [DefaultEquipmentData insertDefaultEquipmentData];
    [defaultEquipmentData setName:@"Paladin's Armor"];
    [defaultEquipmentData setEffect:EquipmentEffectTypeIncreaseDefense];
    [defaultEquipmentData setElementType:ElementTypeNone];
    [defaultEquipmentData setValue:10];
    [defaultEquipmentData setCost:0];
    [defaultEquipmentData setProbability:100];
    
    defaultEquipmentData = [DefaultEquipmentData insertDefaultEquipmentData];
    [defaultEquipmentData setName:@"Rare Paladin's Armor"];
    [defaultEquipmentData setEffect:EquipmentEffectTypeIncreaseDefense];
    [defaultEquipmentData setElementType:ElementTypeNone];
    [defaultEquipmentData setValue:20];
    [defaultEquipmentData setCost:0];
    [defaultEquipmentData setProbability:50];
    
    defaultEquipmentData = [DefaultEquipmentData insertDefaultEquipmentData];
    [defaultEquipmentData setName:@"Epic Paladin's Armor"];
    [defaultEquipmentData setEffect:EquipmentEffectTypeIncreaseDefense];
    [defaultEquipmentData setElementType:ElementTypeNone];
    [defaultEquipmentData setValue:30];
    [defaultEquipmentData setCost:0];
    [defaultEquipmentData setProbability:25];
    
    defaultEquipmentData = [DefaultEquipmentData insertDefaultEquipmentData];
    [defaultEquipmentData setName:@"Warrior's Mace"];
    [defaultEquipmentData setEffect:EquipmentEffectTypeIncreasePower];
    [defaultEquipmentData setElementType:ElementTypeNone];
    [defaultEquipmentData setValue:10];
    [defaultEquipmentData setCost:0];
    [defaultEquipmentData setProbability:100];
    
    defaultEquipmentData = [DefaultEquipmentData insertDefaultEquipmentData];
    [defaultEquipmentData setName:@"Rare Warrior's Mace"];
    [defaultEquipmentData setEffect:EquipmentEffectTypeIncreasePower];
    [defaultEquipmentData setElementType:ElementTypeNone];
    [defaultEquipmentData setValue:20];
    [defaultEquipmentData setCost:0];
    [defaultEquipmentData setProbability:50];
    
    defaultEquipmentData = [DefaultEquipmentData insertDefaultEquipmentData];
    [defaultEquipmentData setName:@"Epic Warrior's Mace"];
    [defaultEquipmentData setEffect:EquipmentEffectTypeIncreasePower];
    [defaultEquipmentData setElementType:ElementTypeNone];
    [defaultEquipmentData setValue:30];
    [defaultEquipmentData setCost:0];
    [defaultEquipmentData setProbability:25];
    
    defaultEquipmentData = [DefaultEquipmentData insertDefaultEquipmentData];
    [defaultEquipmentData setName:@"Thief's Boots"];
    [defaultEquipmentData setEffect:EquipmentEffectTypeIncreaseSpeed];
    [defaultEquipmentData setElementType:ElementTypeNone];
    [defaultEquipmentData setValue:10];
    [defaultEquipmentData setCost:0];
    [defaultEquipmentData setProbability:100];
    
    defaultEquipmentData = [DefaultEquipmentData insertDefaultEquipmentData];
    [defaultEquipmentData setName:@"Rare Thief's Boots"];
    [defaultEquipmentData setEffect:EquipmentEffectTypeIncreaseSpeed];
    [defaultEquipmentData setElementType:ElementTypeNone];
    [defaultEquipmentData setValue:20];
    [defaultEquipmentData setCost:0];
    [defaultEquipmentData setProbability:50];
    
    defaultEquipmentData = [DefaultEquipmentData insertDefaultEquipmentData];
    [defaultEquipmentData setName:@"Epic Thief's Boots"];
    [defaultEquipmentData setEffect:EquipmentEffectTypeIncreaseSpeed];
    [defaultEquipmentData setElementType:ElementTypeNone];
    [defaultEquipmentData setValue:30];
    [defaultEquipmentData setCost:0];
    [defaultEquipmentData setProbability:25];
    
    defaultEquipmentData = [DefaultEquipmentData insertDefaultEquipmentData];
    [defaultEquipmentData setName:@"Caster's Hat"];
    [defaultEquipmentData setEffect:EquipmentEffectTypeIncreaseWillpower];
    [defaultEquipmentData setElementType:ElementTypeNone];
    [defaultEquipmentData setValue:10];
    [defaultEquipmentData setCost:0];
    [defaultEquipmentData setProbability:100];
    
    defaultEquipmentData = [DefaultEquipmentData insertDefaultEquipmentData];
    [defaultEquipmentData setName:@"Rare Caster's Hat"];
    [defaultEquipmentData setEffect:EquipmentEffectTypeIncreaseWillpower];
    [defaultEquipmentData setElementType:ElementTypeNone];
    [defaultEquipmentData setValue:20];
    [defaultEquipmentData setCost:0];
    [defaultEquipmentData setProbability:50];
    
    defaultEquipmentData = [DefaultEquipmentData insertDefaultEquipmentData];
    [defaultEquipmentData setName:@"Epic Caster's Hat"];
    [defaultEquipmentData setEffect:EquipmentEffectTypeIncreaseWillpower];
    [defaultEquipmentData setElementType:ElementTypeNone];
    [defaultEquipmentData setValue:30];
    [defaultEquipmentData setCost:0];
    [defaultEquipmentData setProbability:25];
    
    defaultEquipmentData = [DefaultEquipmentData insertDefaultEquipmentData];
    [defaultEquipmentData setName:@"Healer's Staff"];
    [defaultEquipmentData setEffect:EquipmentEffectTypeIncreaseHealing];
    [defaultEquipmentData setElementType:ElementTypeNone];
    [defaultEquipmentData setValue:10];
    [defaultEquipmentData setCost:0];
    [defaultEquipmentData setProbability:100];
    
    defaultEquipmentData = [DefaultEquipmentData insertDefaultEquipmentData];
    [defaultEquipmentData setName:@"Rare Healer's Staff"];
    [defaultEquipmentData setEffect:EquipmentEffectTypeIncreaseHealing];
    [defaultEquipmentData setElementType:ElementTypeNone];
    [defaultEquipmentData setValue:15];
    [defaultEquipmentData setCost:0];
    [defaultEquipmentData setProbability:50];
    
    defaultEquipmentData = [DefaultEquipmentData insertDefaultEquipmentData];
    [defaultEquipmentData setName:@"Epic Healer's Staff"];
    [defaultEquipmentData setEffect:EquipmentEffectTypeIncreaseHealing];
    [defaultEquipmentData setElementType:ElementTypeNone];
    [defaultEquipmentData setValue:20];
    [defaultEquipmentData setCost:0];
    [defaultEquipmentData setProbability:25];
    
    defaultEquipmentData = [DefaultEquipmentData insertDefaultEquipmentData];
    [defaultEquipmentData setName:@"Warlock's Cloak"];
    [defaultEquipmentData setEffect:EquipmentEffectTypeIncreaseDebuff];
    [defaultEquipmentData setElementType:ElementTypeNone];
    [defaultEquipmentData setValue:15];
    [defaultEquipmentData setCost:0];
    [defaultEquipmentData setProbability:100];
    
    defaultEquipmentData = [DefaultEquipmentData insertDefaultEquipmentData];
    [defaultEquipmentData setName:@"Rare Warlock's Cloak"];
    [defaultEquipmentData setEffect:EquipmentEffectTypeIncreaseDebuff];
    [defaultEquipmentData setElementType:ElementTypeNone];
    [defaultEquipmentData setValue:20];
    [defaultEquipmentData setCost:0];
    [defaultEquipmentData setProbability:50];
    
    defaultEquipmentData = [DefaultEquipmentData insertDefaultEquipmentData];
    [defaultEquipmentData setName:@"Epic Warlock's Cloak"];
    [defaultEquipmentData setEffect:EquipmentEffectTypeIncreaseDebuff];
    [defaultEquipmentData setElementType:ElementTypeNone];
    [defaultEquipmentData setValue:25];
    [defaultEquipmentData setCost:0];
    [defaultEquipmentData setProbability:25];
    
    defaultEquipmentData = [DefaultEquipmentData insertDefaultEquipmentData];
    [defaultEquipmentData setName:@"Cleric's Symbol"];
    [defaultEquipmentData setEffect:EquipmentEffectTypeIncreaseBuff];
    [defaultEquipmentData setElementType:ElementTypeNone];
    [defaultEquipmentData setValue:15];
    [defaultEquipmentData setCost:0];
    [defaultEquipmentData setProbability:100];
    
    defaultEquipmentData = [DefaultEquipmentData insertDefaultEquipmentData];
    [defaultEquipmentData setName:@"Rare Cleric's Symbol"];
    [defaultEquipmentData setEffect:EquipmentEffectTypeIncreaseBuff];
    [defaultEquipmentData setElementType:ElementTypeNone];
    [defaultEquipmentData setValue:20];
    [defaultEquipmentData setCost:0];
    [defaultEquipmentData setProbability:50];
    
    defaultEquipmentData = [DefaultEquipmentData insertDefaultEquipmentData];
    [defaultEquipmentData setName:@"Epic Cleric's Symbol"];
    [defaultEquipmentData setEffect:EquipmentEffectTypeIncreaseBuff];
    [defaultEquipmentData setElementType:ElementTypeNone];
    [defaultEquipmentData setValue:25];
    [defaultEquipmentData setCost:0];
    [defaultEquipmentData setProbability:25];
    
    defaultEquipmentData = [DefaultEquipmentData insertDefaultEquipmentData];
    [defaultEquipmentData setName:@"Assassin's Blade"];
    [defaultEquipmentData setEffect:EquipmentEffectTypeIncreaseDamageOverTime];
    [defaultEquipmentData setElementType:ElementTypeNone];
    [defaultEquipmentData setValue:15];
    [defaultEquipmentData setCost:0];
    [defaultEquipmentData setProbability:100];
    
    defaultEquipmentData = [DefaultEquipmentData insertDefaultEquipmentData];
    [defaultEquipmentData setName:@"Rare Assassin's Blade"];
    [defaultEquipmentData setEffect:EquipmentEffectTypeIncreaseDamageOverTime];
    [defaultEquipmentData setElementType:ElementTypeNone];
    [defaultEquipmentData setValue:20];
    [defaultEquipmentData setCost:0];
    [defaultEquipmentData setProbability:50];
    
    defaultEquipmentData = [DefaultEquipmentData insertDefaultEquipmentData];
    [defaultEquipmentData setName:@"Epic Assassin's Blade"];
    [defaultEquipmentData setEffect:EquipmentEffectTypeIncreaseDamageOverTime];
    [defaultEquipmentData setElementType:ElementTypeNone];
    [defaultEquipmentData setValue:25];
    [defaultEquipmentData setCost:0];
    [defaultEquipmentData setProbability:25];
    
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = [[CoreDataHelper sharedInstance] managedObjectContext];
    [managedObjectContext save:&error];
    
    if (error != nil)
    {
        NSLog(@"Failed to initialize item data.");
    }
}

@end