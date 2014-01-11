//
//  MapViewController.h
//  MKMapCamera-Demo
//
//  Created by Andrew on 1/10/14.
//  Copyright (c) 2014 AA Engineering LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MapViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>
{
}

@property (nonatomic) MKMapView *mapView;
@property (nonatomic) CLLocationManager *locationManager;
@property (nonatomic) CLLocation *lastLocation;
@property (nonatomic) CLLocation *firstLocation;

@end
