//
//  ViewController.swift
//  LocationServiceSwift
//
//  Created by Vinita Miranda on 5/20/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

import UIKit
import CoreLocation
class ViewController: UIViewController,CLLocationManagerDelegate    {

    var locationManager : CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewDidAppear(animated: Bool) {

            self.locationManager = CLLocationManager()
            self.locationManager.requestAlwaysAuthorization()
            self.locationManager.delegate = self
            self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
            self.locationManager.startUpdatingLocation()
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!)
    {
        var location = locations.last as! CLLocation
        var center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        self.locationManager.stopUpdatingLocation()
        self.locationManager.delegate = nil;

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

