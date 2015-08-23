//
//  ViewController.m
//  MapSearch
//
//  Created by Vinita Miranda on 8/23/15.
//  Copyright (c) 2015 bombaybrew. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    MKLocalSearchRequest *searchRequest = [[MKLocalSearchRequest alloc] init];
    [searchRequest setNaturalLanguageQuery:@"Hospital"];

    // Create the local search to perform the search
    MKLocalSearch *localSearch = [[MKLocalSearch alloc] initWithRequest:searchRequest];

    CLLocationCoordinate2D cornerCoordinate = CLLocationCoordinate2DMake(19.2, 72.3);
    searchRequest.region = MKCoordinateRegionMakeWithDistance(cornerCoordinate, 50000, 50000);

    [localSearch startWithCompletionHandler:^(MKLocalSearchResponse *response, NSError *error) {
        if (!error) {
            for (MKMapItem *mapItem in [response mapItems]) {
                NSLog(@"Name: %@, Placemark title: %@", [mapItem name], [[mapItem placemark] title]);
            }
        } else {
            NSLog(@"Search Request Error: %@", [error localizedDescription]);
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
