#import "AcquisitionData+Management.h"

@implementation AcquisitionData (Management)

- (void)awakeFromInsert
{
    CLLocationManager* locationManager = [[CLLocationManager alloc] init];
    [locationManager setDelegate:self];
    [locationManager setDesiredAccuracy:kCLLocationAccuracyKilometer];
    [locationManager setDistanceFilter:DBL_MAX];
    [locationManager startUpdatingLocation];
}


- (void)locationManager:(CLLocationManager *)manager
	 didUpdateLocations:(NSArray *)locations
{
    CLLocation * location = [locations lastObject];
    
    [self setLatitude:[location coordinate].latitude];
    [self setLongitude:[location coordinate].longitude];
}

@end
