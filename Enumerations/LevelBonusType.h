typedef NS_ENUM(int32_t, LevelBonusType)
{
    NoBonus,
    SmallGoldBonus,
    MediumGoldBonus,
    LargeGoldBonus,
    SmallExperienceBonus,
    MediumExperienceBonus,
    LargeExperienceBonus,
    
    // HACK: This value exists because it isn't possible to iterate over enumerations in
    // Objective-C. Do not place any values after this. See http://stackoverflow.com/a/6910685
    // for more information.
    LevelBonusTypeCount
};