#import "Acquiring.h"
#import <Foundation/Foundation.h>
#import "SinglePlayerContentData.h"

@interface SinglePlayerContentFactory : NSObject <Acquiring>

- (SinglePlayerContentData *) newSinglePlayerContentFromHash:(NSData *)hash;

@end
