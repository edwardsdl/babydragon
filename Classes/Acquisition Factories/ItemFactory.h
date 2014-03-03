#import "Acquiring.h"
#import <Foundation/Foundation.h>
#import "ItemData.h"

@interface ItemFactory : NSObject <Acquiring>

- (ItemData *)newItemFromBarcode:(NSString *)barcode;

@end
