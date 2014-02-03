#import "CoreDataHelper.h"
#import "AbilityDataInitializer.h"
#import "AbilityData.h"
#import "AbilityData+Management.h"
#import "ElementType.h"
#import "AttackType.h"
#import "TargetType.h"
#import "EffectType.h"

@implementation AbilityDataInitializer

+(void) initializeData
{
    [AbilityData removeAll];
    
    AbilityData *ability;
    
    //Inferno 1
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Inferno"];
    [ability setElementType:ElementTypeFire];
    [ability setAttackType:AttackTypeMagic];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:1];
    [ability setApCost:7];
    [ability setEffectType:EffectTypeAttack];
    [ability setValue:1.2];
    
    //Inferno 2
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Inferno"];
    [ability setElementType:ElementTypeFire];
    [ability setAttackType:AttackTypeMagic];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:2];
    [ability setApCost:15];
    [ability setEffectType:EffectTypeAttack];
    [ability setValue:1.4];
    
    //Inferno 3
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Inferno"];
    [ability setElementType:ElementTypeFire];
    [ability setAttackType:AttackTypeMagic];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:3];
    [ability setApCost:22];
    [ability setEffectType:EffectTypeAttack];
    [ability setValue:1.6];
    
    //Inferno 4
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Inferno"];
    [ability setElementType:ElementTypeFire];
    [ability setAttackType:AttackTypeMagic];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:4];
    [ability setApCost:30];
    [ability setEffectType:EffectTypeAttack];
    [ability setValue:1.8];
    
    //Blizzard 1
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Blizzard"];
    [ability setElementType:ElementTypeWater];
    [ability setAttackType:AttackTypeMagic];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:1];
    [ability setApCost:7];
    [ability setEffectType:EffectTypeAttack];
    [ability setValue:1.2];
    
    //Blizzard 2
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Blizzard"];
    [ability setElementType:ElementTypeWater];
    [ability setAttackType:AttackTypeMagic];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:2];
    [ability setApCost:15];
    [ability setEffectType:EffectTypeAttack];
    [ability setValue:1.4];
    
    //Blizzard 3
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Blizzard"];
    [ability setElementType:ElementTypeWater];
    [ability setAttackType:AttackTypeMagic];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:3];
    [ability setApCost:22];
    [ability setEffectType:EffectTypeAttack];
    [ability setValue:1.6];
    
    //Blizzard 4
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Blizzard"];
    [ability setElementType:ElementTypeWater];
    [ability setAttackType:AttackTypeMagic];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:4];
    [ability setApCost:30];
    [ability setEffectType:EffectTypeAttack];
    [ability setValue:1.8];
    
    //Thorns 1
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Thorns"];
    [ability setElementType:ElementTypeEarth];
    [ability setAttackType:AttackTypeMagic];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:1];
    [ability setApCost:7];
    [ability setEffectType:EffectTypeAttack];
    [ability setValue:1.2];
    
    //Thorns 2
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Thorns"];
    [ability setElementType:ElementTypeEarth];
    [ability setAttackType:AttackTypeMagic];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:2];
    [ability setApCost:15];
    [ability setEffectType:EffectTypeAttack];
    [ability setValue:1.4];
    
    //Thorns 3
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Thorns"];
    [ability setElementType:ElementTypeEarth];
    [ability setAttackType:AttackTypeMagic];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:3];
    [ability setApCost:22];
    [ability setEffectType:EffectTypeAttack];
    [ability setValue:1.6];
    
    //Thorns 4
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Thorns"];
    [ability setElementType:ElementTypeEarth];
    [ability setAttackType:AttackTypeMagic];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:4];
    [ability setApCost:30];
    [ability setEffectType:EffectTypeAttack];
    [ability setValue:1.8];
    
    //Piercing Light 1
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Piercing_Light"];
    [ability setElementType:ElementTypeHoly];
    [ability setAttackType:AttackTypeMagic];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:1];
    [ability setApCost:7];
    [ability setEffectType:EffectTypeAttack];
    [ability setValue:1.2];
    
    //Piercing Light 2
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Piercing_Light"];
    [ability setElementType:ElementTypeHoly];
    [ability setAttackType:AttackTypeMagic];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:2];
    [ability setApCost:15];
    [ability setEffectType:EffectTypeAttack];
    [ability setValue:1.4];
    
    //Piercing Light 3
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Piercing_Light"];
    [ability setElementType:ElementTypeHoly];
    [ability setAttackType:AttackTypeMagic];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:3];
    [ability setApCost:22];
    [ability setEffectType:EffectTypeAttack];
    [ability setValue:1.6];
    
    //Piercing Light 4
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Piercing_Light"];
    [ability setElementType:ElementTypeHoly];
    [ability setAttackType:AttackTypeMagic];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:4];
    [ability setApCost:30];
    [ability setEffectType:EffectTypeAttack];
    [ability setValue:1.8];
    
    //Devouring Shadows 1
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Devouring_Shadows"];
    [ability setElementType:ElementTypeDarkness];
    [ability setAttackType:AttackTypeMagic];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:1];
    [ability setApCost:7];
    [ability setEffectType:EffectTypeAttack];
    [ability setValue:1.2];
    
    //Devouring Shadows 2
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Devouring_Shadows"];
    [ability setElementType:ElementTypeDarkness];
    [ability setAttackType:AttackTypeMagic];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:2];
    [ability setApCost:15];
    [ability setEffectType:EffectTypeAttack];
    [ability setValue:1.4];
    
    //Devouring Shadows 3
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Devouring_Shadows"];
    [ability setElementType:ElementTypeDarkness];
    [ability setAttackType:AttackTypeMagic];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:3];
    [ability setApCost:22];
    [ability setEffectType:EffectTypeAttack];
    [ability setValue:1.6];
    
    //Devouring Shadows 4
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Devouring_Shadows"];
    [ability setElementType:ElementTypeDarkness];
    [ability setAttackType:AttackTypeMagic];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:4];
    [ability setApCost:30];
    [ability setEffectType:EffectTypeAttack];
    [ability setValue:1.8];
    
    //Flame Strike 1
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Flame_Strike"];
    [ability setElementType:ElementTypeFire];
    [ability setAttackType:AttackTypePhysical];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:1];
    [ability setApCost:8];
    [ability setEffectType:EffectTypeAttack];
    [ability setValue:1.1];
    
    //Flame Strike 2
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Flame_Strike"];
    [ability setElementType:ElementTypeFire];
    [ability setAttackType:AttackTypePhysical];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:2];
    [ability setApCost:17];
    [ability setEffectType:EffectTypeAttack];
    [ability setValue:1.3];
    
    //Flame Strike 3
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Flame_Strike"];
    [ability setElementType:ElementTypeFire];
    [ability setAttackType:AttackTypePhysical];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:3];
    [ability setApCost:25];
    [ability setEffectType:EffectTypeAttack];
    [ability setValue:1.5];
    
    //Flame Strike 4
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Flame_Strike"];
    [ability setElementType:ElementTypeFire];
    [ability setAttackType:AttackTypePhysical];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:4];
    [ability setApCost:34];
    [ability setEffectType:EffectTypeAttack];
    [ability setValue:1.7];
    
    //Water Assault 1
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Water_Assault"];
    [ability setElementType:ElementTypeWater];
    [ability setAttackType:AttackTypePhysical];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:1];
    [ability setApCost:8];
    [ability setEffectType:EffectTypeAttack];
    [ability setValue:1.1];
    
    //Water Assault 2
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Water_Assault"];
    [ability setElementType:ElementTypeWater];
    [ability setAttackType:AttackTypePhysical];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:2];
    [ability setApCost:17];
    [ability setEffectType:EffectTypeAttack];
    [ability setValue:1.3];
    
    //Water Assault 3
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Water_Assault"];
    [ability setElementType:ElementTypeWater];
    [ability setAttackType:AttackTypePhysical];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:3];
    [ability setApCost:25];
    [ability setEffectType:EffectTypeAttack];
    [ability setValue:1.5];
    
    //Water Assault 4
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Water_Assault"];
    [ability setElementType:ElementTypeWater];
    [ability setAttackType:AttackTypePhysical];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:4];
    [ability setApCost:34];
    [ability setEffectType:EffectTypeAttack];
    [ability setValue:1.7];
    
    //Stone Barrage 1
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Stone_Barrage"];
    [ability setElementType:ElementTypeEarth];
    [ability setAttackType:AttackTypePhysical];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:1];
    [ability setApCost:8];
    [ability setEffectType:EffectTypeAttack];
    [ability setValue:1.1];
    
    //Stone Barrage 2
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Stone_Barrage"];
    [ability setElementType:ElementTypeEarth];
    [ability setAttackType:AttackTypePhysical];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:2];
    [ability setApCost:17];
    [ability setEffectType:EffectTypeAttack];
    [ability setValue:1.3];
    
    //Stone Barrage 3
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Stone_Barrage"];
    [ability setElementType:ElementTypeEarth];
    [ability setAttackType:AttackTypePhysical];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:3];
    [ability setApCost:25];
    [ability setEffectType:EffectTypeAttack];
    [ability setValue:1.5];
    
    //Stone Barrage 4
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Stone_Barrage"];
    [ability setElementType:ElementTypeEarth];
    [ability setAttackType:AttackTypePhysical];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:4];
    [ability setApCost:34];
    [ability setEffectType:EffectTypeAttack];
    [ability setValue:1.7];
    
    //Holy Charge 1
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Holy_Charge"];
    [ability setElementType:ElementTypeHoly];
    [ability setAttackType:AttackTypePhysical];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:1];
    [ability setApCost:8];
    [ability setEffectType:EffectTypeAttack];
    [ability setValue:1.1];
    
    //Holy Charge 2
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Holy_Charge"];
    [ability setElementType:ElementTypeHoly];
    [ability setAttackType:AttackTypePhysical];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:2];
    [ability setApCost:17];
    [ability setEffectType:EffectTypeAttack];
    [ability setValue:1.3];
    
    //Holy Charge 3
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Holy_Charge"];
    [ability setElementType:ElementTypeHoly];
    [ability setAttackType:AttackTypePhysical];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:3];
    [ability setApCost:25];
    [ability setEffectType:EffectTypeAttack];
    [ability setValue:1.5];
    
    //Holy Charge 4
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Holy_Charge"];
    [ability setElementType:ElementTypeHoly];
    [ability setAttackType:AttackTypePhysical];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:4];
    [ability setApCost:34];
    [ability setEffectType:EffectTypeAttack];
    [ability setValue:1.7];
    
    //Dark Rampage 1
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Dark_Rampage"];
    [ability setElementType:ElementTypeDarkness];
    [ability setAttackType:AttackTypePhysical];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:1];
    [ability setApCost:8];
    [ability setEffectType:EffectTypeAttack];
    [ability setValue:1.1];
    
    //Dark Rampage 2
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Dark_Rampage"];
    [ability setElementType:ElementTypeDarkness];
    [ability setAttackType:AttackTypePhysical];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:2];
    [ability setApCost:17];
    [ability setEffectType:EffectTypeAttack];
    [ability setValue:1.3];
    
    //Dark Rampage 3
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Dark_Rampage"];
    [ability setElementType:ElementTypeDarkness];
    [ability setAttackType:AttackTypePhysical];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:3];
    [ability setApCost:25];
    [ability setEffectType:EffectTypeAttack];
    [ability setValue:1.5];
    
    //Dark Rampage 4
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Dark_Rampage"];
    [ability setElementType:ElementTypeDarkness];
    [ability setAttackType:AttackTypePhysical];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:4];
    [ability setApCost:34];
    [ability setEffectType:EffectTypeAttack];
    [ability setValue:1.7];
    
    //Backdraft 1
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Backdraft"];
    [ability setElementType:ElementTypeFire];
    [ability setAttackType:AttackTypeMagic];
    [ability setTargetType:TargetTypeAllHostile];
    [ability setLevel:1];
    [ability setApCost:16];
    [ability setEffectType:EffectTypeGroupAttack];
    [ability setValue:0.5];
    
    //Backdraft 2
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Backdraft"];
    [ability setElementType:ElementTypeFire];
    [ability setAttackType:AttackTypeMagic];
    [ability setTargetType:TargetTypeAllHostile];
    [ability setLevel:2];
    [ability setApCost:32];
    [ability setEffectType:EffectTypeGroupAttack];
    [ability setValue:0.75];
    
    //Backdraft 3
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Backdraft"];
    [ability setElementType:ElementTypeFire];
    [ability setAttackType:AttackTypeMagic];
    [ability setTargetType:TargetTypeAllHostile];
    [ability setLevel:3];
    [ability setApCost:64];
    [ability setEffectType:EffectTypeGroupAttack];
    [ability setValue:1];
    
    //Flood 1
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Flood"];
    [ability setElementType:ElementTypeWater];
    [ability setAttackType:AttackTypeMagic];
    [ability setTargetType:TargetTypeAllHostile];
    [ability setLevel:1];
    [ability setApCost:16];
    [ability setEffectType:EffectTypeGroupAttack];
    [ability setValue:0.5];
    
    //Flood 2
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Flood"];
    [ability setElementType:ElementTypeWater];
    [ability setAttackType:AttackTypeMagic];
    [ability setTargetType:TargetTypeAllHostile];
    [ability setLevel:2];
    [ability setApCost:32];
    [ability setEffectType:EffectTypeGroupAttack];
    [ability setValue:0.75];
    
    //Flood 3
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Flood"];
    [ability setElementType:ElementTypeWater];
    [ability setAttackType:AttackTypeMagic];
    [ability setTargetType:TargetTypeAllHostile];
    [ability setLevel:3];
    [ability setApCost:64];
    [ability setEffectType:EffectTypeGroupAttack];
    [ability setValue:1];
    
    //Sinkhole 1
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Sinkhole"];
    [ability setElementType:ElementTypeEarth];
    [ability setAttackType:AttackTypeMagic];
    [ability setTargetType:TargetTypeAllHostile];
    [ability setLevel:1];
    [ability setApCost:16];
    [ability setEffectType:EffectTypeGroupAttack];
    [ability setValue:0.5];
    
    //Sinkhole 2
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Sinkhole"];
    [ability setElementType:ElementTypeEarth];
    [ability setAttackType:AttackTypeMagic];
    [ability setTargetType:TargetTypeAllHostile];
    [ability setLevel:2];
    [ability setApCost:32];
    [ability setEffectType:EffectTypeGroupAttack];
    [ability setValue:0.75];
    
    //Sinkhole 3
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Sinkhole"];
    [ability setElementType:ElementTypeEarth];
    [ability setAttackType:AttackTypeMagic];
    [ability setTargetType:TargetTypeAllHostile];
    [ability setLevel:3];
    [ability setApCost:64];
    [ability setEffectType:EffectTypeGroupAttack];
    [ability setValue:1];
    
    //Retribution 1
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Retribution"];
    [ability setElementType:ElementTypeHoly];
    [ability setAttackType:AttackTypeMagic];
    [ability setTargetType:TargetTypeAllHostile];
    [ability setLevel:1];
    [ability setApCost:16];
    [ability setEffectType:EffectTypeGroupAttack];
    [ability setValue:0.5];
    
    //Retribution 2
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Retribution"];
    [ability setElementType:ElementTypeHoly];
    [ability setAttackType:AttackTypeMagic];
    [ability setTargetType:TargetTypeAllHostile];
    [ability setLevel:2];
    [ability setApCost:32];
    [ability setEffectType:EffectTypeGroupAttack];
    [ability setValue:0.75];
    
    //Retribution 3
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Retribution"];
    [ability setElementType:ElementTypeHoly];
    [ability setAttackType:AttackTypeMagic];
    [ability setTargetType:TargetTypeAllHostile];
    [ability setLevel:3];
    [ability setApCost:64];
    [ability setEffectType:EffectTypeGroupAttack];
    [ability setValue:1];
    
    //Annihilate 1
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Annihilate"];
    [ability setElementType:ElementTypeDarkness];
    [ability setAttackType:AttackTypeMagic];
    [ability setTargetType:TargetTypeAllHostile];
    [ability setLevel:1];
    [ability setApCost:16];
    [ability setEffectType:EffectTypeGroupAttack];
    [ability setValue:0.5];
    
    //Annihilate 2
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Annihilate"];
    [ability setElementType:ElementTypeDarkness];
    [ability setAttackType:AttackTypeMagic];
    [ability setTargetType:TargetTypeAllHostile];
    [ability setLevel:2];
    [ability setApCost:32];
    [ability setEffectType:EffectTypeGroupAttack];
    [ability setValue:0.75];
    
    //Annihilate 3
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Annihilate"];
    [ability setElementType:ElementTypeDarkness];
    [ability setAttackType:AttackTypeMagic];
    [ability setTargetType:TargetTypeAllHostile];
    [ability setLevel:3];
    [ability setApCost:64];
    [ability setEffectType:EffectTypeGroupAttack];
    [ability setValue:1];
    
    //Combust 1
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Combust"];
    [ability setElementType:ElementTypeFire];
    [ability setAttackType:AttackTypeMagic];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:1];
    [ability setApCost:9];
    [ability setEffectType:EffectTypeDamageOverTime];
    [ability setValue:1.3];
    
    //Combust 2
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Combust"];
    [ability setElementType:ElementTypeFire];
    [ability setAttackType:AttackTypeMagic];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:2];
    [ability setApCost:21];
    [ability setEffectType:EffectTypeDamageOverTime];
    [ability setValue:1.6];
    
    //Combust 3
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Combust"];
    [ability setElementType:ElementTypeFire];
    [ability setAttackType:AttackTypeMagic];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:3];
    [ability setApCost:36];
    [ability setEffectType:EffectTypeDamageOverTime];
    [ability setValue:1.9];
    
    //Drown 1
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Drown"];
    [ability setElementType:ElementTypeWater];
    [ability setAttackType:AttackTypeMagic];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:1];
    [ability setApCost:9];
    [ability setEffectType:EffectTypeDamageOverTime];
    [ability setValue:1.3];
    
    //Drown 2
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Drown"];
    [ability setElementType:ElementTypeWater];
    [ability setAttackType:AttackTypeMagic];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:2];
    [ability setApCost:21];
    [ability setEffectType:EffectTypeDamageOverTime];
    [ability setValue:1.6];
    
    //Drown 3
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Drown"];
    [ability setElementType:ElementTypeWater];
    [ability setAttackType:AttackTypeMagic];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:3];
    [ability setApCost:36];
    [ability setEffectType:EffectTypeDamageOverTime];
    [ability setValue:1.9];
    
    //Poison 1
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Poison"];
    [ability setElementType:ElementTypeEarth];
    [ability setAttackType:AttackTypeMagic];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:1];
    [ability setApCost:9];
    [ability setEffectType:EffectTypeDamageOverTime];
    [ability setValue:1.3];
    
    //Poison 2
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Poison"];
    [ability setElementType:ElementTypeEarth];
    [ability setAttackType:AttackTypeMagic];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:2];
    [ability setApCost:21];
    [ability setEffectType:EffectTypeDamageOverTime];
    [ability setValue:1.6];
    
    //Poison 3
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Poison"];
    [ability setElementType:ElementTypeEarth];
    [ability setAttackType:AttackTypeMagic];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:3];
    [ability setApCost:36];
    [ability setEffectType:EffectTypeDamageOverTime];
    [ability setValue:1.9];
    
    //Judgement 1
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Judgement"];
    [ability setElementType:ElementTypeHoly];
    [ability setAttackType:AttackTypeMagic];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:1];
    [ability setApCost:9];
    [ability setEffectType:EffectTypeDamageOverTime];
    [ability setValue:1.3];
    
    //Judgement 2
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Judgement"];
    [ability setElementType:ElementTypeHoly];
    [ability setAttackType:AttackTypeMagic];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:2];
    [ability setApCost:21];
    [ability setEffectType:EffectTypeDamageOverTime];
    [ability setValue:1.6];
    
    //Judgement 3
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Judgement"];
    [ability setElementType:ElementTypeHoly];
    [ability setAttackType:AttackTypeMagic];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:3];
    [ability setApCost:36];
    [ability setEffectType:EffectTypeDamageOverTime];
    [ability setValue:1.9];
    
    //Affliction 1
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Affliction"];
    [ability setElementType:ElementTypeDarkness];
    [ability setAttackType:AttackTypeMagic];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:1];
    [ability setApCost:9];
    [ability setEffectType:EffectTypeDamageOverTime];
    [ability setValue:1.3];
    
    //Affliction 2
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Affliction"];
    [ability setElementType:ElementTypeDarkness];
    [ability setAttackType:AttackTypeMagic];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:2];
    [ability setApCost:21];
    [ability setEffectType:EffectTypeDamageOverTime];
    [ability setValue:1.6];
    
    //Affliction 3
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Affliction"];
    [ability setElementType:ElementTypeDarkness];
    [ability setAttackType:AttackTypeMagic];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:3];
    [ability setApCost:36];
    [ability setEffectType:EffectTypeDamageOverTime];
    [ability setValue:1.9];
    
    //Burning Claw 1
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Burning_Claw"];
    [ability setElementType:ElementTypeFire];
    [ability setAttackType:AttackTypePhysical];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:1];
    [ability setApCost:10];
    [ability setEffectType:EffectTypeDamageOverTime];
    [ability setValue:1.2];
    
    //Burning Claw 2
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Burning_Claw"];
    [ability setElementType:ElementTypeFire];
    [ability setAttackType:AttackTypePhysical];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:2];
    [ability setApCost:23];
    [ability setEffectType:EffectTypeDamageOverTime];
    [ability setValue:1.4];
    
    //Burning Claw 3
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Burning_Claw"];
    [ability setElementType:ElementTypeFire];
    [ability setAttackType:AttackTypePhysical];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:3];
    [ability setApCost:39];
    [ability setEffectType:EffectTypeDamageOverTime];
    [ability setValue:1.6];
    
    //Undertow 1
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Undertow"];
    [ability setElementType:ElementTypeWater];
    [ability setAttackType:AttackTypePhysical];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:1];
    [ability setApCost:10];
    [ability setEffectType:EffectTypeDamageOverTime];
    [ability setValue:1.2];
    
    //Undertow 2
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Undertow"];
    [ability setElementType:ElementTypeWater];
    [ability setAttackType:AttackTypePhysical];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:2];
    [ability setApCost:23];
    [ability setEffectType:EffectTypeDamageOverTime];
    [ability setValue:1.4];
    
    //Undertow 3
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Undertow"];
    [ability setElementType:ElementTypeWater];
    [ability setAttackType:AttackTypePhysical];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:3];
    [ability setApCost:39];
    [ability setEffectType:EffectTypeDamageOverTime];
    [ability setValue:1.6];
    
    //Viral Injection 1
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Viral_Injection"];
    [ability setElementType:ElementTypeEarth];
    [ability setAttackType:AttackTypePhysical];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:1];
    [ability setApCost:10];
    [ability setEffectType:EffectTypeDamageOverTime];
    [ability setValue:1.2];
    
    //Viral Injection 2
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Viral_Injection"];
    [ability setElementType:ElementTypeEarth];
    [ability setAttackType:AttackTypePhysical];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:2];
    [ability setApCost:23];
    [ability setEffectType:EffectTypeDamageOverTime];
    [ability setValue:1.4];
    
    //Viral Injection 3
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Viral_Injection"];
    [ability setElementType:ElementTypeEarth];
    [ability setAttackType:AttackTypePhysical];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:3];
    [ability setApCost:39];
    [ability setEffectType:EffectTypeDamageOverTime];
    [ability setValue:1.6];
    
    //Holy Thrust 1
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Holy_Thrust"];
    [ability setElementType:ElementTypeHoly];
    [ability setAttackType:AttackTypePhysical];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:1];
    [ability setApCost:10];
    [ability setEffectType:EffectTypeDamageOverTime];
    [ability setValue:1.2];
    
    //Holy Thrust 2
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Holy_Thrust"];
    [ability setElementType:ElementTypeHoly];
    [ability setAttackType:AttackTypePhysical];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:2];
    [ability setApCost:23];
    [ability setEffectType:EffectTypeDamageOverTime];
    [ability setValue:1.4];
    
    //Holy Thrust 3
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Holy_Thrust"];
    [ability setElementType:ElementTypeHoly];
    [ability setAttackType:AttackTypePhysical];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:3];
    [ability setApCost:39];
    [ability setEffectType:EffectTypeDamageOverTime];
    [ability setValue:1.6];
    
    //Back Stab 1
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Back_Stab"];
    [ability setElementType:ElementTypeDarkness];
    [ability setAttackType:AttackTypePhysical];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:1];
    [ability setApCost:10];
    [ability setEffectType:EffectTypeDamageOverTime];
    [ability setValue:1.2];
    
    //Back Stab 2
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Back_Stab"];
    [ability setElementType:ElementTypeDarkness];
    [ability setAttackType:AttackTypePhysical];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:2];
    [ability setApCost:23];
    [ability setEffectType:EffectTypeDamageOverTime];
    [ability setValue:1.4];
    
    //Back Stab 3
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Back_Stab"];
    [ability setElementType:ElementTypeDarkness];
    [ability setAttackType:AttackTypePhysical];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:3];
    [ability setApCost:40];
    [ability setEffectType:EffectTypeDamageOverTime];
    [ability setValue:1.6];
    
    //Flame Shield 1
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Flame_Shield"];
    [ability setElementType:ElementTypeFire];
    [ability setAttackType:AttackTypePhysical];
    [ability setTargetType:TargetTypeSingleFriendly];
    [ability setLevel:1];
    [ability setApCost:5];
    [ability setEffectType:EffectTypeShield];
    [ability setValue:0.3];
    
    //Flame Shield 2
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Flame_Shield"];
    [ability setElementType:ElementTypeFire];
    [ability setAttackType:AttackTypePhysical];
    [ability setTargetType:TargetTypeSingleFriendly];
    [ability setLevel:2];
    [ability setApCost:10];
    [ability setEffectType:EffectTypeShield];
    [ability setValue:0.4];
    
    //Flame Shield 3
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Flame_Shield"];
    [ability setElementType:ElementTypeFire];
    [ability setAttackType:AttackTypePhysical];
    [ability setTargetType:TargetTypeSingleFriendly];
    [ability setLevel:3];
    [ability setApCost:15];
    [ability setEffectType:EffectTypeShield];
    [ability setValue:0.5];
    
    //Flame Shield 4
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Flame_Shield"];
    [ability setElementType:ElementTypeFire];
    [ability setAttackType:AttackTypePhysical];
    [ability setTargetType:TargetTypeSingleFriendly];
    [ability setLevel:4];
    [ability setApCost:20];
    [ability setEffectType:EffectTypeShield];
    [ability setValue:0.6];
    
    //Water Shield 1
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Water_Shield"];
    [ability setElementType:ElementTypeWater];
    [ability setAttackType:AttackTypePhysical];
    [ability setTargetType:TargetTypeSingleFriendly];
    [ability setLevel:1];
    [ability setApCost:5];
    [ability setEffectType:EffectTypeShield];
    [ability setValue:0.3];
    
    //Water Shield 2
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Water_Shield"];
    [ability setElementType:ElementTypeWater];
    [ability setAttackType:AttackTypePhysical];
    [ability setTargetType:TargetTypeSingleFriendly];
    [ability setLevel:2];
    [ability setApCost:10];
    [ability setEffectType:EffectTypeShield];
    [ability setValue:0.4];
    
    //Water Shield 3
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Water_Shield"];
    [ability setElementType:ElementTypeWater];
    [ability setAttackType:AttackTypePhysical];
    [ability setTargetType:TargetTypeSingleFriendly];
    [ability setLevel:3];
    [ability setApCost:15];
    [ability setEffectType:EffectTypeShield];
    [ability setValue:0.5];
    
    //Water Shield 4
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Water_Shield"];
    [ability setElementType:ElementTypeWater];
    [ability setAttackType:AttackTypePhysical];
    [ability setTargetType:TargetTypeSingleFriendly];
    [ability setLevel:4];
    [ability setApCost:20];
    [ability setEffectType:EffectTypeShield];
    [ability setValue:0.6];
    
    //Earth Shield 1
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Earth_Shield"];
    [ability setElementType:ElementTypeEarth];
    [ability setAttackType:AttackTypePhysical];
    [ability setTargetType:TargetTypeSingleFriendly];
    [ability setLevel:1];
    [ability setApCost:5];
    [ability setEffectType:EffectTypeShield];
    [ability setValue:0.3];
    
    //Earth Shield 2
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Earth_Shield"];
    [ability setElementType:ElementTypeEarth];
    [ability setAttackType:AttackTypePhysical];
    [ability setTargetType:TargetTypeSingleFriendly];
    [ability setLevel:2];
    [ability setApCost:10];
    [ability setEffectType:EffectTypeShield];
    [ability setValue:0.4];
    
    //Earth Shield 3
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Earth_Shield"];
    [ability setElementType:ElementTypeEarth];
    [ability setAttackType:AttackTypePhysical];
    [ability setTargetType:TargetTypeSingleFriendly];
    [ability setLevel:3];
    [ability setApCost:15];
    [ability setEffectType:EffectTypeShield];
    [ability setValue:0.5];
    
    //Earth Shield 4
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Earth_Shield"];
    [ability setElementType:ElementTypeEarth];
    [ability setAttackType:AttackTypePhysical];
    [ability setTargetType:TargetTypeSingleFriendly];
    [ability setLevel:4];
    [ability setApCost:20];
    [ability setEffectType:EffectTypeShield];
    [ability setValue:0.6];
    
    //Holy Shield 1
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Holy_Shield"];
    [ability setElementType:ElementTypeHoly];
    [ability setAttackType:AttackTypePhysical];
    [ability setTargetType:TargetTypeSingleFriendly];
    [ability setLevel:1];
    [ability setApCost:5];
    [ability setEffectType:EffectTypeShield];
    [ability setValue:0.3];
    
    //Holy Shield 2
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Holy_Shield"];
    [ability setElementType:ElementTypeHoly];
    [ability setAttackType:AttackTypePhysical];
    [ability setTargetType:TargetTypeSingleFriendly];
    [ability setLevel:2];
    [ability setApCost:10];
    [ability setEffectType:EffectTypeShield];
    [ability setValue:0.4];
    
    //Holy Shield 3
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Holy_Shield"];
    [ability setElementType:ElementTypeHoly];
    [ability setAttackType:AttackTypePhysical];
    [ability setTargetType:TargetTypeSingleFriendly];
    [ability setLevel:3];
    [ability setApCost:15];
    [ability setEffectType:EffectTypeShield];
    [ability setValue:0.5];
    
    //Holy Shield 4
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Holy_Shield"];
    [ability setElementType:ElementTypeHoly];
    [ability setAttackType:AttackTypePhysical];
    [ability setTargetType:TargetTypeSingleFriendly];
    [ability setLevel:4];
    [ability setApCost:20];
    [ability setEffectType:EffectTypeShield];
    [ability setValue:0.6];
    
    //Dark Shield 1
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Dark_Shield"];
    [ability setElementType:ElementTypeDarkness];
    [ability setAttackType:AttackTypePhysical];
    [ability setTargetType:TargetTypeSingleFriendly];
    [ability setLevel:1];
    [ability setApCost:5];
    [ability setEffectType:EffectTypeShield];
    [ability setValue:0.3];
    
    //Dark Shield 2
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Dark_Shield"];
    [ability setElementType:ElementTypeDarkness];
    [ability setAttackType:AttackTypePhysical];
    [ability setTargetType:TargetTypeSingleFriendly];
    [ability setLevel:2];
    [ability setApCost:10];
    [ability setEffectType:EffectTypeShield];
    [ability setValue:0.4];
    
    //Dark Shield 3
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Dark_Shield"];
    [ability setElementType:ElementTypeDarkness];
    [ability setAttackType:AttackTypePhysical];
    [ability setTargetType:TargetTypeSingleFriendly];
    [ability setLevel:3];
    [ability setApCost:15];
    [ability setEffectType:EffectTypeShield];
    [ability setValue:0.5];
    
    //Dark Shield 4
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Dark_Shield"];
    [ability setElementType:ElementTypeDarkness];
    [ability setAttackType:AttackTypePhysical];
    [ability setTargetType:TargetTypeSingleFriendly];
    [ability setLevel:4];
    [ability setApCost:20];
    [ability setEffectType:EffectTypeShield];
    [ability setValue:0.6];
    
    //Cure 1
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Cure"];
    [ability setElementType:ElementTypeNone];
    [ability setAttackType:AttackTypeMagic];
    [ability setTargetType:TargetTypeSingleFriendly];
    [ability setLevel:1];
    [ability setApCost:7];
    [ability setEffectType:EffectTypeCure];
    [ability setValue:15];
    
    //Cure 2
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Cure"];
    [ability setElementType:ElementTypeNone];
    [ability setAttackType:AttackTypeMagic];
    [ability setTargetType:TargetTypeSingleFriendly];
    [ability setLevel:2];
    [ability setApCost:15];
    [ability setEffectType:EffectTypeCure];
    [ability setValue:20];
    
    //Cure 3
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Cure"];
    [ability setElementType:ElementTypeNone];
    [ability setAttackType:AttackTypeMagic];
    [ability setTargetType:TargetTypeSingleFriendly];
    [ability setLevel:3];
    [ability setApCost:22];
    [ability setEffectType:EffectTypeCure];
    [ability setValue:28];
    
    //Cure 4
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Cure"];
    [ability setElementType:ElementTypeNone];
    [ability setAttackType:AttackTypeMagic];
    [ability setTargetType:TargetTypeSingleFriendly];
    [ability setLevel:4];
    [ability setApCost:30];
    [ability setEffectType:EffectTypeCure];
    [ability setValue:40];
    
    //Restore 1
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Restore"];
    [ability setElementType:ElementTypeNone];
    [ability setAttackType:AttackTypeMagic];
    [ability setTargetType:TargetTypeAllFriendly];
    [ability setLevel:1];
    [ability setApCost:16];
    [ability setEffectType:EffectTypeGroupCure];
    [ability setValue:14];
    
    //Restore 2
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Restore"];
    [ability setElementType:ElementTypeNone];
    [ability setAttackType:AttackTypeMagic];
    [ability setTargetType:TargetTypeAllFriendly];
    [ability setLevel:2];
    [ability setApCost:32];
    [ability setEffectType:EffectTypeGroupCure];
    [ability setValue:25];
    
    //Restore 3
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Restore"];
    [ability setElementType:ElementTypeNone];
    [ability setAttackType:AttackTypeMagic];
    [ability setTargetType:TargetTypeAllFriendly];
    [ability setLevel:3];
    [ability setApCost:64];
    [ability setEffectType:EffectTypeGroupCure];
    [ability setValue:36];
    
    //Invigorate 1
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Invigorate"];
    [ability setElementType:ElementTypeNone];
    [ability setAttackType:AttackTypePhysical];
    [ability setTargetType:TargetTypeSingleFriendly];
    [ability setLevel:1];
    [ability setApCost:8];
    [ability setEffectType:EffectTypeCure];
    [ability setValue:15];
    
    //Invigorate 2
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Invigorate"];
    [ability setElementType:ElementTypeNone];
    [ability setAttackType:AttackTypePhysical];
    [ability setTargetType:TargetTypeSingleFriendly];
    [ability setLevel:2];
    [ability setApCost:17];
    [ability setEffectType:EffectTypeCure];
    [ability setValue:20];
    
    //Invigorate 3
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Invigorate"];
    [ability setElementType:ElementTypeNone];
    [ability setAttackType:AttackTypePhysical];
    [ability setTargetType:TargetTypeSingleFriendly];
    [ability setLevel:3];
    [ability setApCost:25];
    [ability setEffectType:EffectTypeCure];
    [ability setValue:28];
    
    //Invigorate 4
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Invigorate"];
    [ability setElementType:ElementTypeNone];
    [ability setAttackType:AttackTypePhysical];
    [ability setTargetType:TargetTypeSingleFriendly];
    [ability setLevel:4];
    [ability setApCost:34];
    [ability setEffectType:EffectTypeCure];
    [ability setValue:40];
    
    //Rally 1
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Rally"];
    [ability setElementType:ElementTypeNone];
    [ability setAttackType:AttackTypePhysical];
    [ability setTargetType:TargetTypeAllFriendly];
    [ability setLevel:1];
    [ability setApCost:18];
    [ability setEffectType:EffectTypeGroupCure];
    [ability setValue:14];
    
    //Rally 2
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Rally"];
    [ability setElementType:ElementTypeNone];
    [ability setAttackType:AttackTypePhysical];
    [ability setTargetType:TargetTypeAllFriendly];
    [ability setLevel:2];
    [ability setApCost:36];
    [ability setEffectType:EffectTypeGroupCure];
    [ability setValue:25];
    
    //Rally 3
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Rally"];
    [ability setElementType:ElementTypeNone];
    [ability setAttackType:AttackTypePhysical];
    [ability setTargetType:TargetTypeAllFriendly];
    [ability setLevel:3];
    [ability setApCost:68];
    [ability setEffectType:EffectTypeGroupCure];
    [ability setValue:36];
    
    //Revive 1
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Revive"];
    [ability setElementType:ElementTypeNone];
    [ability setAttackType:AttackTypeNone];
    [ability setTargetType:TargetTypeSingleFriendlyKO];
    [ability setLevel:1];
    [ability setApCost:10];
    [ability setEffectType:EffectTypeRevive];
    [ability setValue:25];
    
    //Revive 2
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Revive"];
    [ability setElementType:ElementTypeNone];
    [ability setAttackType:AttackTypeNone];
    [ability setTargetType:TargetTypeSingleFriendlyKO];
    [ability setLevel:2];
    [ability setApCost:25];
    [ability setEffectType:EffectTypeRevive];
    [ability setValue:50];
    
    //Revive 3
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Revive"];
    [ability setElementType:ElementTypeNone];
    [ability setAttackType:AttackTypeNone];
    [ability setTargetType:TargetTypeSingleFriendlyKO];
    [ability setLevel:3];
    [ability setApCost:40];
    [ability setEffectType:EffectTypeRevive];
    [ability setValue:75];
    
    //Revive 4
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Revive"];
    [ability setElementType:ElementTypeNone];
    [ability setAttackType:AttackTypeNone];
    [ability setTargetType:TargetTypeSingleFriendlyKO];
    [ability setLevel:4];
    [ability setApCost:60];
    [ability setEffectType:EffectTypeRevive];
    [ability setValue:100];
    
    //Haste 1
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Haste"];
    [ability setElementType:ElementTypeFire];
    [ability setAttackType:AttackTypeNone];
    [ability setTargetType:TargetTypeSingleFriendly];
    [ability setLevel:1];
    [ability setApCost:5];
    [ability setEffectType:EffectTypeAlterSpeed];
    [ability setValue:0.05];
    
    //Haste 2
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Haste"];
    [ability setElementType:ElementTypeFire];
    [ability setAttackType:AttackTypeNone];
    [ability setTargetType:TargetTypeSingleFriendly];
    [ability setLevel:2];
    [ability setApCost:12];
    [ability setEffectType:EffectTypeAlterSpeed];
    [ability setValue:0.075];
    
    //Haste 3
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Haste"];
    [ability setElementType:ElementTypeFire];
    [ability setAttackType:AttackTypeNone];
    [ability setTargetType:TargetTypeSingleFriendly];
    [ability setLevel:3];
    [ability setApCost:18];
    [ability setEffectType:EffectTypeAlterSpeed];
    [ability setValue:0.1];
    
    //Haste 4
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Haste"];
    [ability setElementType:ElementTypeFire];
    [ability setAttackType:AttackTypeNone];
    [ability setTargetType:TargetTypeSingleFriendly];
    [ability setLevel:4];
    [ability setApCost:25];
    [ability setEffectType:EffectTypeAlterSpeed];
    [ability setValue:-0.125];
    
    //Slow 1
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Slow"];
    [ability setElementType:ElementTypeFire];
    [ability setAttackType:AttackTypeNone];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:1];
    [ability setApCost:5];
    [ability setEffectType:EffectTypeAlterSpeed];
    [ability setValue:-0.05];
    
    //Slow 2
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Slow"];
    [ability setElementType:ElementTypeFire];
    [ability setAttackType:AttackTypeNone];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:2];
    [ability setApCost:12];
    [ability setEffectType:EffectTypeAlterSpeed];
    [ability setValue:-0.075];
    
    //Slow 3
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Slow"];
    [ability setElementType:ElementTypeFire];
    [ability setAttackType:AttackTypeNone];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:3];
    [ability setApCost:18];
    [ability setEffectType:EffectTypeAlterSpeed];
    [ability setValue:-0.1];
    
    //Slow 4
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Slow"];
    [ability setElementType:ElementTypeFire];
    [ability setAttackType:AttackTypeNone];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:4];
    [ability setApCost:25];
    [ability setEffectType:EffectTypeAlterSpeed];
    [ability setValue:-0.125];
    
    //Fortify 1
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Fortify"];
    [ability setElementType:ElementTypeWater];
    [ability setAttackType:AttackTypeNone];
    [ability setTargetType:TargetTypeSingleFriendly];
    [ability setLevel:1];
    [ability setApCost:5];
    [ability setEffectType:EffectTypeAlterWillpower];
    [ability setValue:0.05];
    
    //Fortify 2
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Fortify"];
    [ability setElementType:ElementTypeWater];
    [ability setAttackType:AttackTypeNone];
    [ability setTargetType:TargetTypeSingleFriendly];
    [ability setLevel:2];
    [ability setApCost:12];
    [ability setEffectType:EffectTypeAlterWillpower];
    [ability setValue:0.075];
    
    //Fortify 3
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Fortify"];
    [ability setElementType:ElementTypeWater];
    [ability setAttackType:AttackTypeNone];
    [ability setTargetType:TargetTypeSingleFriendly];
    [ability setLevel:3];
    [ability setApCost:18];
    [ability setEffectType:EffectTypeAlterWillpower];
    [ability setValue:0.1];
    
    //Fortify 4
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Fortify"];
    [ability setElementType:ElementTypeWater];
    [ability setAttackType:AttackTypeNone];
    [ability setTargetType:TargetTypeSingleFriendly];
    [ability setLevel:4];
    [ability setApCost:25];
    [ability setEffectType:EffectTypeAlterWillpower];
    [ability setValue:-0.125];
    
    //Daze 1
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Daze"];
    [ability setElementType:ElementTypeWater];
    [ability setAttackType:AttackTypeNone];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:1];
    [ability setApCost:5];
    [ability setEffectType:EffectTypeAlterWillpower];
    [ability setValue:-0.05];
    
    //Daze 2
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Daze"];
    [ability setElementType:ElementTypeWater];
    [ability setAttackType:AttackTypeNone];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:2];
    [ability setApCost:12];
    [ability setEffectType:EffectTypeAlterWillpower];
    [ability setValue:-0.075];
    
    //Daze 3
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Daze"];
    [ability setElementType:ElementTypeWater];
    [ability setAttackType:AttackTypeNone];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:3];
    [ability setApCost:18];
    [ability setEffectType:EffectTypeAlterWillpower];
    [ability setValue:-0.1];
    
    //Daze 4
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Daze"];
    [ability setElementType:ElementTypeWater];
    [ability setAttackType:AttackTypeNone];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:4];
    [ability setApCost:25];
    [ability setEffectType:EffectTypeAlterWillpower];
    [ability setValue:-0.125];
    
    //Toughen 1
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Toughen"];
    [ability setElementType:ElementTypeEarth];
    [ability setAttackType:AttackTypeNone];
    [ability setTargetType:TargetTypeSingleFriendly];
    [ability setLevel:1];
    [ability setApCost:5];
    [ability setEffectType:EffectTypeAlterDefense];
    [ability setValue:0.05];
    
    //Toughen 2
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Toughen"];
    [ability setElementType:ElementTypeEarth];
    [ability setAttackType:AttackTypeNone];
    [ability setTargetType:TargetTypeSingleFriendly];
    [ability setLevel:2];
    [ability setApCost:12];
    [ability setEffectType:EffectTypeAlterDefense];
    [ability setValue:0.075];
    
    //Toughen 3
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Toughen"];
    [ability setElementType:ElementTypeEarth];
    [ability setAttackType:AttackTypeNone];
    [ability setTargetType:TargetTypeSingleFriendly];
    [ability setLevel:3];
    [ability setApCost:18];
    [ability setEffectType:EffectTypeAlterDefense];
    [ability setValue:0.1];
    
    //Toughen 4
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Toughen"];
    [ability setElementType:ElementTypeEarth];
    [ability setAttackType:AttackTypeNone];
    [ability setTargetType:TargetTypeSingleFriendly];
    [ability setLevel:4];
    [ability setApCost:25];
    [ability setEffectType:EffectTypeAlterDefense];
    [ability setValue:-0.125];
    
    //Dimish 1
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Dimish"];
    [ability setElementType:ElementTypeEarth];
    [ability setAttackType:AttackTypeNone];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:1];
    [ability setApCost:5];
    [ability setEffectType:EffectTypeAlterDefense];
    [ability setValue:-0.05];
    
    //Dimish 2
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Dimish"];
    [ability setElementType:ElementTypeEarth];
    [ability setAttackType:AttackTypeNone];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:2];
    [ability setApCost:12];
    [ability setEffectType:EffectTypeAlterDefense];
    [ability setValue:-0.075];
    
    //Dimish 3
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Dimish"];
    [ability setElementType:ElementTypeEarth];
    [ability setAttackType:AttackTypeNone];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:3];
    [ability setApCost:18];
    [ability setEffectType:EffectTypeAlterDefense];
    [ability setValue:-0.1];
    
    //Dimish 4
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Dimish"];
    [ability setElementType:ElementTypeEarth];
    [ability setAttackType:AttackTypeNone];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:4];
    [ability setApCost:25];
    [ability setEffectType:EffectTypeAlterDefense];
    [ability setValue:-0.125];
    
    //Embolden 1
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Embolden"];
    [ability setElementType:ElementTypeHoly];
    [ability setAttackType:AttackTypeNone];
    [ability setTargetType:TargetTypeSingleFriendly];
    [ability setLevel:1];
    [ability setApCost:5];
    [ability setEffectType:EffectTypeAlterCourage];
    [ability setValue:0.05];
    
    //Embolden 2
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Embolden"];
    [ability setElementType:ElementTypeHoly];
    [ability setAttackType:AttackTypeNone];
    [ability setTargetType:TargetTypeSingleFriendly];
    [ability setLevel:2];
    [ability setApCost:12];
    [ability setEffectType:EffectTypeAlterCourage];
    [ability setValue:0.075];
    
    //Embolden 3
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Embolden"];
    [ability setElementType:ElementTypeHoly];
    [ability setAttackType:AttackTypeNone];
    [ability setTargetType:TargetTypeSingleFriendly];
    [ability setLevel:3];
    [ability setApCost:18];
    [ability setEffectType:EffectTypeAlterCourage];
    [ability setValue:0.1];
    
    //Embolden 4
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Embolden"];
    [ability setElementType:ElementTypeHoly];
    [ability setAttackType:AttackTypeNone];
    [ability setTargetType:TargetTypeSingleFriendly];
    [ability setLevel:4];
    [ability setApCost:25];
    [ability setEffectType:EffectTypeAlterCourage];
    [ability setValue:-0.125];
    
    //Intimidate 1
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Intimidate"];
    [ability setElementType:ElementTypeHoly];
    [ability setAttackType:AttackTypeNone];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:1];
    [ability setApCost:5];
    [ability setEffectType:EffectTypeAlterCourage];
    [ability setValue:-0.05];
    
    //Intimidate 2
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Intimidate"];
    [ability setElementType:ElementTypeHoly];
    [ability setAttackType:AttackTypeNone];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:2];
    [ability setApCost:12];
    [ability setEffectType:EffectTypeAlterCourage];
    [ability setValue:-0.075];
    
    //Intimidate 3
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Intimidate"];
    [ability setElementType:ElementTypeHoly];
    [ability setAttackType:AttackTypeNone];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:3];
    [ability setApCost:18];
    [ability setEffectType:EffectTypeAlterCourage];
    [ability setValue:-0.1];
    
    //Intimidate 4
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Intimidate"];
    [ability setElementType:ElementTypeHoly];
    [ability setAttackType:AttackTypeNone];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:4];
    [ability setApCost:25];
    [ability setEffectType:EffectTypeAlterCourage];
    [ability setValue:-0.125];
    
    //Enhance 1
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Enhance"];
    [ability setElementType:ElementTypeDarkness];
    [ability setAttackType:AttackTypeNone];
    [ability setTargetType:TargetTypeSingleFriendly];
    [ability setLevel:1];
    [ability setApCost:5];
    [ability setEffectType:EffectTypeAlterPower];
    [ability setValue:0.05];
    
    //Enhance 2
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Enhance"];
    [ability setElementType:ElementTypeDarkness];
    [ability setAttackType:AttackTypeNone];
    [ability setTargetType:TargetTypeSingleFriendly];
    [ability setLevel:2];
    [ability setApCost:12];
    [ability setEffectType:EffectTypeAlterPower];
    [ability setValue:0.075];
    
    //Enhance 3
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Enhance"];
    [ability setElementType:ElementTypeDarkness];
    [ability setAttackType:AttackTypeNone];
    [ability setTargetType:TargetTypeSingleFriendly];
    [ability setLevel:3];
    [ability setApCost:18];
    [ability setEffectType:EffectTypeAlterPower];
    [ability setValue:0.1];
    
    //Enhance 4
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Enhance"];
    [ability setElementType:ElementTypeDarkness];
    [ability setAttackType:AttackTypeNone];
    [ability setTargetType:TargetTypeSingleFriendly];
    [ability setLevel:4];
    [ability setApCost:25];
    [ability setEffectType:EffectTypeAlterPower];
    [ability setValue:-0.125];
    
    //Weaken 1
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Weaken"];
    [ability setElementType:ElementTypeDarkness];
    [ability setAttackType:AttackTypeNone];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:1];
    [ability setApCost:5];
    [ability setEffectType:EffectTypeAlterPower];
    [ability setValue:-0.05];
    
    //Weaken 2
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Weaken"];
    [ability setElementType:ElementTypeDarkness];
    [ability setAttackType:AttackTypeNone];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:2];
    [ability setApCost:12];
    [ability setEffectType:EffectTypeAlterPower];
    [ability setValue:-0.075];
    
    //Weaken 3
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Weaken"];
    [ability setElementType:ElementTypeDarkness];
    [ability setAttackType:AttackTypeNone];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:3];
    [ability setApCost:18];
    [ability setEffectType:EffectTypeAlterPower];
    [ability setValue:-0.1];
    
    //Weaken 4
    ability = [AbilityData insertAbilityData];
    [ability setName:@"Weaken"];
    [ability setElementType:ElementTypeDarkness];
    [ability setAttackType:AttackTypeNone];
    [ability setTargetType:TargetTypeSingleHostile];
    [ability setLevel:4];
    [ability setApCost:25];
    [ability setEffectType:EffectTypeAlterPower];
    [ability setValue:-0.125];
    
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = [[CoreDataHelper sharedInstance] managedObjectContext];
    [managedObjectContext save:&error];
    
    if (error != nil)
    {
        NSLog(@"Failed to initialize ability data.");
    }
}

@end