#import "Acquiring.h"
#import <Foundation/Foundation.h>
#import "MonsterData+Management.h"

@interface MonsterFactory : NSObject <Acquiring>

- (MonsterData *)newMonsterFromBarcode:(NSString *)barcode;

@end
