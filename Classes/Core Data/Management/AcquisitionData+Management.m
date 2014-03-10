#import "AcquisitionData+Management.h"

@implementation AcquisitionData (Management)

- (void)awakeFromInsert
{
    [super awakeFromInsert];
    
    CLLocationManager* locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyKilometer;
    locationManager.distanceFilter = DBL_MAX;
    [locationManager startUpdatingLocation];
}


- (void)locationManager:(CLLocationManager *)manager
	 didUpdateLocations:(NSArray *)locations
{
    CLLocation * location = [locations lastObject];
    
    self.latitude = location.coordinate.latitude;
    self.longitude = location.coordinate.longitude;
}

@end
