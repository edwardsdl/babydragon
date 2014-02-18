#import "CoreDataHelper.h"
#import "GoldData+Management.h"
#import "NSManagedObjectContext+Management.h"

@implementation GoldData (Management)

static NSString *entityName = @"GoldData";

+ (NSArray *)allGold
{
    NSManagedObjectContext *managedObjectContext = [[CoreDataHelper sharedInstance] managedObjectContext];
    
    return [managedObjectContext objectsForEntityName:entityName];
}

+ (GoldData *)insertGoldWithAmount:(int)amount barcode:(NSString *)barcode
{
    NSManagedObjectContext *managedObjectContext = [[CoreDataHelper sharedInstance] managedObjectContext];
    
    GoldData *goldData = [NSEntityDescription insertNewObjectForEntityForName:entityName
                                                       inManagedObjectContext:managedObjectContext];
    [goldData setAmount:amount];
    
    return goldData;
}

+ (void)removeAll
{
    NSManagedObjectContext *managedObjectContext = [[CoreDataHelper sharedInstance] managedObjectContext];
    
    for (GoldData *goldData in [self allGold])
    {
        [managedObjectContext deleteObject:goldData];
    }
    
    NSError *error = nil;
    [managedObjectContext save:&error];
}

@end
