typedef NS_ENUM(int32_t, ElementType)
{
    ElementTypeNone,
    ElementTypeDarkness,
    ElementTypeEarth,
    ElementTypeFire,
    ElementTypeHoly,
    ElementTypeWater,
    
    // HACK: This value exists because it isn't possible to iterate over enumerations in
    // Objective-C. Do not place any values after this. See http://stackoverflow.com/a/6910685
    // for more information.
    ElementTypeCount
};
