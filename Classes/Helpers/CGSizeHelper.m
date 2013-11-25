#import "CGSizeHelper.h"

@implementation CGSizeHelper

+ (CGSize)sizeEnclosingRects:(NSValue *)value, ...
{
    va_list args;
    va_start(args, value);
    
    NSValue *arg;
    CGRect enclosingRect = [value CGRectValue];
    while ((arg = va_arg(args, NSValue *)))
    {
        enclosingRect = CGRectUnion(enclosingRect, [arg CGRectValue]);
    }
    
    va_end(args);
    
    return enclosingRect.size;
}

@end
