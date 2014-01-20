#import <Foundation/Foundation.h>
#import "MapNodeData.h"

@interface MapNodeData (Management)

+ (NSArray *)allMapNodes;

+ (MapNodeData *)insertMapNode;

+ (MapNodeData*) mapNodeForWorldIndex:(int) worldIndex;

@end
