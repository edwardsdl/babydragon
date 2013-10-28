#import "Acquiring.h"
#import <Foundation/Foundation.h>
#import "GoldData.h"

@interface GoldFactory : NSObject <Acquiring>

- (GoldData *) newGoldFromHash:(NSData *)hash;

@end
