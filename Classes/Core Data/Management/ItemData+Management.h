#import "ItemData.h"

@interface ItemData (Management)

+ (NSArray *)allItemData;
+ (ItemData *)itemDataWithUUID:(NSString *)uuid;
+ (ItemData *)insertItemDataWithDefaultItemDataUUID:(NSString *)uuid;
+ (void)removeAll;

@end
