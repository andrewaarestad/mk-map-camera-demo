//
//  MapViewController.m
//  MKMapCamera-Demo
//
//  Created by Andrew on 1/10/14.
//  Copyright (c) 2014 AA Engineering LLC. All rights reserved.
//

#import "MapViewController.h"

#define CAMERA_ALTITUDE 10

@interface MapViewController ()

@end

@implementation MapViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // setup map view
    self.mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
    self.mapView.delegate = self;
    self.mapView.showsUserLocation = YES;
    self.mapView.userInteractionEnabled = YES;
    self.mapView.zoomEnabled = NO;
    [self.mapView setShowsBuildings:YES];
    [self.view addSubview:self.mapView];
    
    // Start GPS location udpates
    self.locationManager = [[CLLocationManager alloc] init];
    [self.locationManager setDelegate:self];
    [self.locationManager startUpdatingLocation];
    [self.locationManager startUpdatingHeading];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *newLocation = [locations objectAtIndex:0];
    
    if (!self.firstLocation)
    {
        self.firstLocation = newLocation;
    }
    
    if (self.lastLocation)
    {
        MKMapCamera *newCamera = [MKMapCamera cameraLookingAtCenterCoordinate:[newLocation coordinate]
                                                            fromEyeCoordinate:[self.lastLocation coordinate]
                                                                  eyeAltitude:CAMERA_ALTITUDE];
        
        newCamera = [MKMapCamera cameraLookingAtCenterCoordinate:[newLocation coordinate] fromEyeCoordinate:[newLocation coordinate] eyeAltitude:CAMERA_ALTITUDE];
        [newCamera setPitch:60];
        [newCamera setHeading:newLocation.course];
        
        [self.mapView setCamera:newCamera animated:NO];
    }
    
    self.lastLocation = newLocation;
}

-(void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading
{
    NSLog(@"Heading: %@",[newHeading description]);
}


@end
