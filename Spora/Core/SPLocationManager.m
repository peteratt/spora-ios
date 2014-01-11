//
//  SPLocationManager.m
//  Spora
//
//  Created by Pedro Alvarez-Tabio on 4/14/13.
//  Copyright (c) 2013 Fantsix. All rights reserved.
//

#import "SPLocationManager.h"

@interface SPLocationManager ()

@property (nonatomic, strong) CLLocation* userLocation;
@property (nonatomic, strong) CLLocationManager* locationManager;

@end

@implementation SPLocationManager

@synthesize userLocation = _userLocation,
            locationManager = _locationManager;

- (id)init
{
    self = [super init];
    if (self) {
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.delegate = self;
        _locationManager.distanceFilter = kCLDistanceFilterNone;
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        [_locationManager startUpdatingLocation];
    }
    return self;
}

+ (id)sharedInstance
{
    static SPLocationManager* sharedLocationManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedLocationManager = [[self alloc] init];
    });
    return sharedLocationManager;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    NSLog(@"OldLocation %f %f", oldLocation.coordinate.latitude, oldLocation.coordinate.longitude);
    NSLog(@"NewLocation %f %f", newLocation.coordinate.latitude, newLocation.coordinate.longitude);
    
    _userLocation = newLocation;
}

- (CLLocationCoordinate2D)getUserLocation
{
    return _userLocation.coordinate;
}

@end
