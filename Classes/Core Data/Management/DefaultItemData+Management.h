#import "DefaultItemData.h"

@interface DefaultItemData (Management)

+ (NSArray *)allDefaultItemData;
+ (DefaultItemData *)defaultItemDataWithUUID:(NSString *)uuid;
+ (DefaultItemData *)insertDefaultItemData;
+ (void)removeAll;

@end
