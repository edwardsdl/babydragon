#import "AcquisitionData.h"
#import <Foundation/Foundation.h>

@protocol Acquiring <NSObject>

- (AcquisitionData *)newAcquisitionFromBarcode:(NSString *)barcode;

@end