#import "DefaultItemData.h"

@interface DefaultItemData (Management)

+ (NSArray *)allDefaultItemData;
+ (DefaultItemData *)defaultItemDataWithUUID:(NSString *)uuid;
+ (DefaultItemData *)insertDefaultItemDataForType:(NSString *)type;
+ (void)removeAll;

@end
