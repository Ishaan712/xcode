//
//  ViewController.swift
//  Places
//
//  Created by Ishaan Sathaye on 7/15/19.
//  Copyright © 2019 NextGenTech. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var manager = CLLocationManager()

    @IBOutlet var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
        let uilpgr = UILongPressGestureRecognizer(target: self, action: #selector(action))
        
        uilpgr.minimumPressDuration = 2
        
        map.addGestureRecognizer(uilpgr)
        
    }
    
    @objc func action(gestureRecongnizer:UIGestureRecognizer) {
        
        if gestureRecongnizer.state == UIGestureRecognizer.State.began {
        
            let touchPoint = gestureRecongnizer.location(in: self.map)
            
            let newCoordinates:CLLocationCoordinate2D = map.convert(touchPoint, toCoordinateFrom: self.map)
            
            let annotation = MKPointAnnotation()
            
            annotation.coordinate = newCoordinates
            
            annotation.title = "New Annotation"
            
            map.addAnnotation(annotation)
            
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let userLocation:CLLocation = locations[0]
        
        var latitude = userLocation.coordinate.latitude
        var longitude = userLocation.coordinate.longitude
        
        var coordinate: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        let latDelta:CLLocationDegrees = 0.01
        let longDelta:CLLocationDegrees = 0.01
        
        var span:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
        
        var region:MKCoordinateRegion = MKCoordinateRegion(center: coordinate, span: span)
        
        self.map.setRegion(region, animated: true)
        
    }

}

