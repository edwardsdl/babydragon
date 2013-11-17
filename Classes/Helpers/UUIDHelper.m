#import "UUIDHelper.h"

@implementation UUIDHelper

+ (NSString *)createUUIDString
{
    return (__bridge NSString *) CFUUIDCreateString(kCFAllocatorDefault,
                                                    CFUUIDCreate(kCFAllocatorDefault));
}

@end
