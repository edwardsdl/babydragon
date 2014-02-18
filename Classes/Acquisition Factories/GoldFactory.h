#import "Acquiring.h"
#import <Foundation/Foundation.h>
#import "GoldData+Management.h"

@interface GoldFactory : NSObject <Acquiring>

- (GoldData *) newGoldFromBarcode:(NSString *)barcode;

@end
