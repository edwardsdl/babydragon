typedef NS_ENUM(int32_t, LootQualityType) {
    LowLootQuality,
    MediumLootQuality,
    HighLootQuality,
    
    // HACK: This value exists because enumeration over enumerations doesn't exist in
    // Objective-C. Do not place any values after this. See http://stackoverflow.com/a/6910685
    // for more information.
    LootQualityTypeCount
};