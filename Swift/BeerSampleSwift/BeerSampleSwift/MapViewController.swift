//
//  MapViewController.swift
//  BeerSampleSwift
//
//  Created by Vinita Miranda on 5/26/15.
//  Copyright (c) 2015 Vinita Miranda. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    var storeDictionary : NSDictionary?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.storeDictionary?.objectForKey("name") as? String
        
        var coord = CLLocationCoordinate2DMake(self.storeDictionary!.objectForKey("latitude")!.doubleValue, self.storeDictionary!.objectForKey("latitude")!.doubleValue)
        
        var theSpan:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
        var region:MKCoordinateRegion = MKCoordinateRegionMake(coord, theSpan)
        mapView.setRegion(region, animated: true)
        
        
        var objectAnnotation = MKPointAnnotation()
        objectAnnotation.coordinate = coord
        objectAnnotation.title = self.storeDictionary?.objectForKey("name") as? String
        objectAnnotation.subtitle = self.storeDictionary?.objectForKey("address") as? String
        self.mapView.addAnnotation(objectAnnotation)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
