#import "AttackType.h"
#import "DefaultItemData+Management.h"
#import "DefaultItemDataInitializer.h"
#import "EffectType.h"
#import "ElementType.h"
#import "TargetType.h"

@implementation DefaultItemDataInitializer

+ (void)initializeData
{
    [DefaultItemData removeAll];
    
    DefaultItemData *defaultItemData = [DefaultItemData insertDefaultItemDataForType:@"Lesser Potion of Healing"];
    [defaultItemData setAttackType:AttackTypeNone];
    [defaultItemData setEffectType:EffectTypeCure];
    [defaultItemData setElementType:ElementTypeNone];
    [defaultItemData setTargetType:TargetTypeSingleFriendly];
    [defaultItemData setValue:15];
    
    defaultItemData = [DefaultItemData insertDefaultItemDataForType:@"Potion of Healing"];
    [defaultItemData setAttackType:AttackTypeNone];
    [defaultItemData setEffectType:EffectTypeCure];
    [defaultItemData setElementType:ElementTypeNone];
    [defaultItemData setTargetType:TargetTypeSingleFriendly];
    [defaultItemData setValue:20];
    
    defaultItemData = [DefaultItemData insertDefaultItemDataForType:@"Greater Potion of Healing"];
    [defaultItemData setAttackType:AttackTypeNone];
    [defaultItemData setEffectType:EffectTypeCure];
    [defaultItemData setElementType:ElementTypeNone];
    [defaultItemData setTargetType:TargetTypeSingleFriendly];
    [defaultItemData setValue:28];
}

@end
