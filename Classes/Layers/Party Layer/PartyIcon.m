#import "CCSprite.h"
#import "PartyIcon.h"

@implementation PartyIcon

- (id)initWithImage:(CCSprite *)image label:(NSString *)label delegate:(id)delegate
{
    if (self = [super init])
    {
        
    }
    
    return self;
}

- (id)initWithDelegate:(id)delegate
{
    return [self initWithImage:nil label:@"New Party" delegate:delegate];
}



@end
