#import "BaseData+Management.h"
#import "CoreDataHelper.h"
#import "NSManagedObjectContext+Management.h"
#import "UUIDHelper.h"

@implementation BaseData (Management)

- (void)awakeFromInsert
{
    if (self.dateCreated == 0)
    {
        self.dateCreated = [NSDate timeIntervalSinceReferenceDate];
    }
    
    self.dateUpdated = [NSDate timeIntervalSinceReferenceDate];
    self.uuid = [UUIDHelper createUUIDString];
}

+ (BaseData *)baseDataWithUUID:(NSString *)uuid
{
    NSManagedObjectContext *managedObjectContext = [[CoreDataHelper sharedInstance] managedObjectContext];
    
    NSArray *results = [managedObjectContext objectsFromFetchRequestTemplateWithName:@"GetBaseDataWithUUID"
                                                              substitutionVariables:@{@"UUID": uuid}];
    
    return results.count > 0
    ? (BaseData *)[results objectAtIndex:0]
    : nil;
}

@end
