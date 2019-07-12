//
//  ViewController.swift
//  Where Am I
//
//  Created by Ishaan Sathaye on 7/12/19.
//  Copyright © 2019 NextGenTech. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var manager = CLLocationManager()
    
    
    @IBOutlet var latitudeLabel: UILabel!
    @IBOutlet var longitudeLabel: UILabel!
    @IBOutlet var courseLabel: UILabel!
    @IBOutlet var altitudeLabel: UILabel!
    @IBOutlet var speedLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) { // will be called when a new location is registered by the phone
        
        //print(locations)
        
        let userLocation:CLLocation = locations[0]
        
        self.latitudeLabel.text = "\(userLocation.coordinate.latitude)"
        
        self.longitudeLabel.text = "\(userLocation.coordinate.longitude)"
        
        self.courseLabel.text = "\(userLocation.course)" // gets course
        
        self.speedLabel.text = "\(userLocation.speed)" // gets speed
        
        self.altitudeLabel.text = "\(userLocation.altitude)" // gets altitude
        
        
        CLGeocoder().reverseGeocodeLocation(userLocation, completionHandler: { (placemarks, error) -> Void in // taking a location and converting to an address
            
            if (error != nil) {
                
                print(error!)
                
            } else {
                
                if let p:CLPlacemark = CLPlacemark(placemark: placemarks?[0] as! CLPlacemark) {
                    
                    let country = p.country
                    let postalCode = p.postalCode
                    let subAdministrativeArea = p.subAdministrativeArea
                    let subLocality = p.subLocality
                    let thoroughfare = p.thoroughfare
                    
                    var subThoroughfare = ""
                    
                    if p.subThoroughfare != nil {
                        
                        subThoroughfare = p.subThoroughfare!
                        
                    }
                    
                    self.addressLabel.text = "\(subThoroughfare) \(thoroughfare!) \n \(subLocality!) \n \(subAdministrativeArea!) \n \(postalCode!) \n \(country!)"
                    
                    
                }
                
            }
            
        })
        
        /*let latDelta:CLLocationDegrees = 0.001 // zoom in or out; 1 being zommed out and 0.00001 being zommed in
        
        let longDelta:CLLocationDegrees = 0.001
        
        let span:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
        
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        let region:MKCoordinateRegion = MKCoordinateRegion(center: location, span: span)
        
        self.map.setRegion(region, animated: true)*/
        
        
    }


}

