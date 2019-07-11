//
//  ViewController.swift
//  Maps
//
//  Created by Ishaan Sathaye on 7/11/19.
//  Copyright © 2019 NextGenTech. All rights reserved.
//

import UIKit
import MapKit // Map frameworks
import CoreLocation

// In Build Phase by clicking on the top folder of app: add core location framework

//In Info.plist which has all info about app: add NSLocationWhenInUseUsageDescription (when app is running) and NSLocationAlwaysUsageDescription (when running in the background)

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {// get user's location within view controller

    @IBOutlet var map: MKMapView!
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Request user's location
        
        locationManager.delegate = self
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest // how strong for accuracy of the location
        
        locationManager.requestWhenInUseAuthorization() // request the location only when the app is in use
        
        locationManager.startUpdatingLocation()
        
        
        
        // setting up the map and zooming in on a particular location
        
        let latitude:CLLocationDegrees = 37.460927
        
        let longitude:CLLocationDegrees = -121.896987
        
        let latDelta:CLLocationDegrees = 0.001 // zoom in or out; 1 being zommed out and 0.00001 being zommed in
        
        let longDelta:CLLocationDegrees = 0.001
        
        let span:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
        
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        let region:MKCoordinateRegion = MKCoordinateRegion(center: location, span: span)
        
        map.setRegion(region, animated: true)
        
        
        
        // Make points on the map or annotations
        
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = location
        
        annotation.title = "Home"
        
        annotation.subtitle = "830 London Drive"
        
        map.addAnnotation(annotation)
        
        
        
        
        
        
        // Long press will put a pin:
        
        let uilpgr = UILongPressGestureRecognizer(target: self, action: #selector(userAction))
        
        uilpgr.minimumPressDuration = 2
        
        map.addGestureRecognizer(uilpgr)
    }
    
    // for putting a pin after a long press at a location
    @objc func userAction(gestureRecongnizer:UIGestureRecognizer) { // recieves a guesture into the function which has a type of gesturerecognizer
        
        print("Gesture recongized")
        
        let touchPoint = gestureRecongnizer.location(in: self.map) // gives the location relative to the location on the map    NOT ACTUAL POINTS IN THE WORLD
        
        let newCoordinates:CLLocationCoordinate2D = map.convert(touchPoint, toCoordinateFrom: self.map) // convert from points on the map to actual points in the world
        
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = newCoordinates
        
        annotation.title = "New Place" // put a pin with annotation on the new place
        
        annotation.subtitle = "Long Pressed Here"
        
        map.addAnnotation(annotation)
        
        
    }
    
    
    // for getting the user's locations
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) { // will be called when a new location is registered by the phone
        
        print(locations)r
        
        let userLocation:CLLocation = locations[0] // extracted the location fromt the variable: locations
        
        let latitude = userLocation.coordinate.latitude // put the latitude into a variable
        
        let longitude = userLocation.coordinate.longitude // put the longitude into a variable
        
        let latDelta:CLLocationDegrees = 0.001 // zoom in or out; 1 being zommed out and 0.00001 being zommed in
        
        let longDelta:CLLocationDegrees = 0.001
        
        let span:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
        
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        let region:MKCoordinateRegion = MKCoordinateRegion(center: location, span: span)
        
        self.map.setRegion(region, animated: true)
        
        
    }


}

