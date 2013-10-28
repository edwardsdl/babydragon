#import "BarcodeHelper.h"
#import <CommonCrypto/CommonDigest.h>

@implementation BarcodeHelper

// TODO: Fix memory leak
+ (NSData *)hashForBarcode:(NSString *)barcode
{
    const char * data = barcode.UTF8String;
    unsigned char * result = CC_SHA256(data, strlen(data), malloc(CC_SHA256_DIGEST_LENGTH * sizeof(unsigned char)));
    
    return [NSData dataWithBytes:result
                          length:CC_SHA256_DIGEST_LENGTH * sizeof(unsigned char)];
}

@end
