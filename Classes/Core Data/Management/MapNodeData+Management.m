
#import "MapNodeData+Management.h"
#import "CoreDataHelper.h"
#import "NSManagedObjectContext+Management.h"

@implementation MapNodeData (Management)

static NSString *entityName = @"MapNodeData";

+ (NSArray *)allMapNodes
{
    NSManagedObjectContext *managedObjectContext = [[CoreDataHelper sharedInstance] managedObjectContext];
    
    return [managedObjectContext objectsForEntityName:entityName];
}

+ (MapNodeData *)insertMapNode
{
    NSManagedObjectContext *managedObjectContext = [[CoreDataHelper sharedInstance] managedObjectContext];
    
    MapNodeData *mapNode = [NSEntityDescription insertNewObjectForEntityForName:entityName inManagedObjectContext:managedObjectContext];
    
    return mapNode;
}

+ (MapNodeData*) mapNodeForWorldIndex:(int) worldIndex
{
    NSManagedObjectContext *managedObjectContext = [[CoreDataHelper sharedInstance] managedObjectContext];
    
    NSArray * results = [managedObjectContext objectsFromFetchRequestTemplateWithName:@"GetMapNodeForWorldIndex"
                                                                substitutionVariables:@{@"WORLDINDEX": [NSString stringWithFormat:@"%i", worldIndex]}];
    
    return [results count] > 0
    ? (MapNodeData *)[results objectAtIndex:0]
    : nil;

}

@end
