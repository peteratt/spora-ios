//
//  SPLocationManager.h
//  Spora
//
//  Created by Pedro Alvarez-Tabio on 4/14/13.
//  Copyright (c) 2013 Fantsix. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface SPLocationManager : NSObject <CLLocationManagerDelegate>
{
    CLLocationManager* _locationManager;
    CLLocation* _userLocation;
}

+ (id)sharedInstance;

- (CLLocationCoordinate2D)getUserLocation;

@end
