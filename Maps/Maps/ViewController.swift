//
//  ViewController.swift
//  Maps
//
//  Created by Ishaan Sathaye on 7/11/19.
//  Copyright © 2019 NextGenTech. All rights reserved.
//

import UIKit
import MapKit // Map frameworks

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    
    
    @objc func userAction(gestureRecongnizer:UIGestureRecognizer) { // recieves a guesture into the function which has a type of gesturerecognizer
        
        print("Gesture recongized")
        
        let touchPoint = gestureRecongnizer.location(in: self.map) // gives the location relative to the location on the map    NOT ACTUAL POINTS IN THE WORLD
        
        let newCoordinates:CLLocationCoordinate2D = map.convert(touchPoint, toCoordinateFrom: self.map)
        
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = newCoordinates
        
        annotation.title = "New Place"
        
        annotation.subtitle = "Long Pressed Here"
        
        map.addAnnotation(annotation)
        
        
    }


}

