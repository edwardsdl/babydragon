#import "BarcodeHelper.h"
#import "SinglePlayerContentFactory.h"
#import "Tile.h"

@interface SinglePlayerContentData()

- (void)generateTiles;

@end

@implementation SinglePlayerContentFactory
{
    CGSize _size;
}

#pragma mark - Initializers
- (id)init
{
    if (self = [super init])
    {
        _size = CGSizeMake(10, 10);
        
    }
    
    return self;
}

#pragma mark - Public methods

- (SinglePlayerContentData *)newSinglePlayerContentFromHash:(NSData *)hash
{
    return nil;
}

#pragma mark - Acquiring protocol methods

- (AcquisitionData *)newAcquisitionFromBarcode:(NSString *)barcode
{
    return [self newSinglePlayerContentFromHash:[BarcodeHelper hashForBarcode:barcode]];
}

#pragma mark - Private methods

- (void)generateTiles
{
//    Tile *tiles = malloc((int)size.width * (int)size.height * sizeof(Tile));
//    for (int i = 0; i < _size.width; i++)
//    {
//        for (int j = 0; j < _size.height; j++)
//        {
//            tiles[i][j] = [[Tile alloc] initWithType:Open];
//        }
//    }
}

@end
