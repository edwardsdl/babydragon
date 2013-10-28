#import "BaseData.h"

@implementation BaseData (Management)

- (void)awakeFromInsert
{
    if ([self dateCreated] == 0)
    {
        [self setDateCreated:[NSDate timeIntervalSinceReferenceDate]];
    }
    
    [self setDateUpdated:[NSDate timeIntervalSinceReferenceDate]];
}

@end
