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
    
    @IBOutlet weak var segment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        
        if activePlace == -1 {
            
            manager.requestWhenInUseAuthorization()
            manager.startUpdatingLocation()
            
        } else {
            
            let latitude = NSString(string: places[activePlace]["lat"]!).doubleValue
            let longitude = NSString(string: places[activePlace]["lon"]!).doubleValue
            
            let coordinate: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            let latDelta:CLLocationDegrees = 0.01
            let longDelta:CLLocationDegrees = 0.01
            let span:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
            let region:MKCoordinateRegion = MKCoordinateRegion(center: coordinate, span: span)
            self.map.setRegion(region, animated: true)
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            annotation.title = places[activePlace]["name"]
            self.map.addAnnotation(annotation)
            
        }
        
        let uilpgr = UILongPressGestureRecognizer(target: self, action: #selector(action))
        
        uilpgr.minimumPressDuration = 2
        
        map.addGestureRecognizer(uilpgr)
        
    }
    
    @IBAction func segmentTapped(_ sender: Any) {
        
        let getIndex = segment.selectedSegmentIndex
        
        if getIndex == 0 {
            
            map.mapType = MKMapType.standard
        
        } else if getIndex == 1{
            
            map.mapType = MKMapType.hybrid
            
        } else if getIndex == 2 {
            
            map.mapType = MKMapType.satellite
            
        }
        
    }
    
    // when user long presses at a location on the map runs this:
    @objc func action(gestureRecongnizer:UIGestureRecognizer) {
        
        if gestureRecongnizer.state == UIGestureRecognizer.State.began {
        
            let touchPoint = gestureRecongnizer.location(in: self.map)
            
            let newCoordinates:CLLocationCoordinate2D = map.convert(touchPoint, toCoordinateFrom: self.map)
            
            let location = CLLocation(latitude: newCoordinates.latitude, longitude: newCoordinates.longitude)
            
            
            // Get address of the locaiton using the coordinates
            CLGeocoder().reverseGeocodeLocation(location, completionHandler: { (placemarks, error) -> Void in
                
                var title = ""
                
                if (error == nil) {
                    
                    if let p:CLPlacemark = CLPlacemark(placemark: placemarks?[0] as! CLPlacemark) {
                        
                        var subThoroughfare:String = ""
                        var thoroughfare:String = ""
                        
                        if p.subThoroughfare != nil {
                            
                            subThoroughfare = p.subThoroughfare!
                            
                        }
                        
                        if p.thoroughfare != nil {
                            
                            thoroughfare = p.thoroughfare!
                            
                        }
                        
                        title = "\(subThoroughfare) \(thoroughfare)"

                    }
                    
                }
                
                if title == "" {
                    
                    title = "Added \(NSDate())"
                    
                }
                
                places.append(["name":title, "lat":"\(newCoordinates.latitude)", "lon":"\(newCoordinates.longitude)"])
                
                UserDefaults.standard.setValue(places, forKey: "places")
                
                let annotation = MKPointAnnotation()
                
                annotation.coordinate = newCoordinates
                
                annotation.title = title
                
                self.map.addAnnotation(annotation)
                
            })
            
            
        }
        
    }
    
    // to get the user's location:
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let userLocation:CLLocation = locations[0]
        
        let latitude = userLocation.coordinate.latitude
        let longitude = userLocation.coordinate.longitude
        
        let coordinate: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        let latDelta:CLLocationDegrees = 0.01
        let longDelta:CLLocationDegrees = 0.01
        
        let span:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
        
        let region:MKCoordinateRegion = MKCoordinateRegion(center: coordinate, span: span)
        
        self.map.setRegion(region, animated: true)
        
    }

}

