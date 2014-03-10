@interface CoreDataHelper : NSObject

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

typedef void (^ ErrorBlock)(NSError *);

+ (CoreDataHelper *)sharedInstance;

- (NSURL *)applicationDocumentsDirectory;
- (void)initializePersistentObjectStore;
- (BOOL)save;
- (void)saveWithErrorBlock:(ErrorBlock)errorBlock;

@end
