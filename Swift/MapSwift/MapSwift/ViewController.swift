//
//  ViewController.swift
//  MapSwift
//
//  Created by Vinita Miranda on 5/18/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    var locationManager:CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (CLLocationManager.locationServicesEnabled())
        {
            self.locationManager = CLLocationManager()
            self.locationManager.requestWhenInUseAuthorization()
            self.locationManager.delegate = self
            self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
            self.locationManager.startUpdatingLocation()
        }
        
        

        
        var theSpan:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
        var pointLocation:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 19.0728300, longitude: 72.8826100)
        var region:MKCoordinateRegion = MKCoordinateRegionMake(pointLocation, theSpan)
        mapView.setRegion(region, animated: true)
        
        
        var objectAnnotation = MKPointAnnotation()
        objectAnnotation.coordinate = pointLocation
        objectAnnotation.title = "Mumbai"
        self.mapView.addAnnotation(objectAnnotation)
        
        var pinLocation1 : CLLocationCoordinate2D = CLLocationCoordinate2DMake(19.12,72.82)
        objectAnnotation = MKPointAnnotation()
        objectAnnotation.coordinate = pinLocation1
        objectAnnotation.title = "Andheri"
        self.mapView.addAnnotation(objectAnnotation)
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        let location = locations.last as! CLLocation
        let currentLocation = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        var objectAnnotation = MKPointAnnotation()
        objectAnnotation.coordinate = currentLocation
        objectAnnotation.title = "Updated Location"
        self.mapView.addAnnotation(objectAnnotation)

        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

