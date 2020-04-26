//
//  AQIViewController.swift
//  Learn-O-zone
//
//  Created by Hasan Qasim on 17/4/20.
//  Copyright © 2020 Hasan Qasim. All rights reserved.
//

import UIKit
import MapKit

class AQIViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var locationName: UILabel!
    @IBOutlet weak var aqiValue: UILabel!
    @IBOutlet weak var airCondition: UILabel!
    @IBOutlet weak var datetime: UILabel!
    
    
    @IBOutlet weak var oneIV: UIImageView!
    @IBOutlet weak var twoIV: UIImageView!
    @IBOutlet weak var threeIV: UIImageView!
    
    var locationManager: CLLocationManager = CLLocationManager()
    var currentLocationCoordinates: CLLocationCoordinate2D?
    var currentLocationName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // enable image navigation
        let tapGestureRecognizerOne = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        oneIV.isUserInteractionEnabled = true
        oneIV.addGestureRecognizer(tapGestureRecognizerOne)
        let tapGestureRecognizerTwo = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        twoIV.isUserInteractionEnabled = true
        twoIV.addGestureRecognizer(tapGestureRecognizerTwo)
        let tapGestureRecognizerThree = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        threeIV.isUserInteractionEnabled = true
        threeIV.addGestureRecognizer(tapGestureRecognizerThree)
        
        //location updates
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        locationManager.startUpdatingLocation()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        locationManager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last!
        currentLocationCoordinates = location.coordinate
        reverseGeocode()
    }
    
    func reverseGeocode() {
        let geocoder = CLGeocoder()
        let currentLocation = CLLocation(latitude: currentLocationCoordinates!.latitude, longitude: currentLocationCoordinates!.longitude)
        geocoder.reverseGeocodeLocation(currentLocation) { (placemark, error) in
            if error == nil {
                let firstLocation = placemark?[0]
                self.locationName.text = firstLocation?.locality
            }
        }
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
           let tappedImage = tapGestureRecognizer.view as! UIImageView
           
           if tappedImage.accessibilityLabel!.contains("one") {
               performSegue(withIdentifier: "segueOne", sender: self)
           } else if tappedImage.accessibilityLabel!.contains("two") {
               performSegue(withIdentifier: "segueTwo", sender: self)
           } else if tappedImage.accessibilityLabel!.contains("three") {
               performSegue(withIdentifier: "segueThree", sender: self)
           }
       }
       
 
}
