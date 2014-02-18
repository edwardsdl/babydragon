#import "AttackType.h"
#import "DefaultItemData+Management.h"
#import "DefaultItemDataInitializer.h"
#import "EffectType.h"
#import "ElementType.h"
#import "TargetType.h"

@implementation DefaultItemDataInitializer

+(void) initializeData
{
    [DefaultItemData removeAll];
    
    DefaultItemData *defaultItemData = [DefaultItemData insertDefaultItemDataWithName:@"Lesser Potion of Healing"];
    [defaultItemData setAttackType:AttackTypeNone];
    [defaultItemData setEffectType:EffectTypeCure];
    [defaultItemData setElementType:ElementTypeNone];
    [defaultItemData setTargetType:TargetTypeSingleFriendly];
    [defaultItemData setValue:15];
    
    defaultItemData = [DefaultItemData insertDefaultItemDataWithName:@"Potion of Healing"];
    [defaultItemData setAttackType:AttackTypeNone];
    [defaultItemData setEffectType:EffectTypeCure];
    [defaultItemData setElementType:ElementTypeNone];
    [defaultItemData setTargetType:TargetTypeSingleFriendly];
    [defaultItemData setValue:20];
    
    defaultItemData = [DefaultItemData insertDefaultItemDataWithName:@"Greater Potion of Healing"];
    [defaultItemData setAttackType:AttackTypeNone];
    [defaultItemData setEffectType:EffectTypeCure];
    [defaultItemData setElementType:ElementTypeNone];
    [defaultItemData setTargetType:TargetTypeSingleFriendly];
    [defaultItemData setValue:28];
}

@end
