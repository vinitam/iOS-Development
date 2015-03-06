//
//  MapViewController.m
//  BeerSample
//
//  Created by Vinita Miranda on 3/6/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

#import "MapViewController.h"
#import <MapKit/MapKit.h>
@interface MapViewController ()
@property(nonatomic,weak) IBOutlet MKMapView *mapView;
@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    CLLocationCoordinate2D coord;
    coord.latitude = [[self.storeDictionary objectForKey:@"latitude"] doubleValue];
    coord.longitude = [[self.storeDictionary objectForKey:@"longitude"] doubleValue];

    MKCoordinateRegion adjustedRegion = [self.mapView regionThatFits:MKCoordinateRegionMakeWithDistance(coord, 200, 200)];
    [self.mapView setRegion:adjustedRegion animated:YES];
    
    
    MKPointAnnotation *pointAnnotation = [[MKPointAnnotation alloc]init];
    
    pointAnnotation.coordinate = coord;
    pointAnnotation.title = [self.storeDictionary objectForKey:@"name"];
    pointAnnotation.subtitle = [self.storeDictionary objectForKey:@"address"];
    [self.mapView addAnnotation:pointAnnotation];
}

-(void)viewWillAppear:(BOOL)animated
{
    self.title = [self.storeDictionary objectForKey:@"name"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
