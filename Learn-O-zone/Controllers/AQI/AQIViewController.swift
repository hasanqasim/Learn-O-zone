//
//  AQIViewController.swift
//  Learn-O-zone
//
//  Created by Hasan Qasim on 17/4/20.
//  Copyright © 2020 Hasan Qasim. All rights reserved.
//

import UIKit
import MapKit

//This controller manages the AQI screen. It also has code for location services, fetching json api response and parsisng the json to display relevant information
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
    
    var airQualityResponseObj: AirQualityResponse?
    
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
    
    // start updating location
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        locationManager.startUpdatingLocation()
    }
    
    //stop updating location
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        locationManager.stopUpdatingLocation()
    }
    
    // get the new location update, reverse geocode to get the location name from coordinates, detch api response using those cordinates
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last!
        currentLocationCoordinates = location.coordinate
        reverseGeocode()
        fetchResponse(currentLocationCoordinates!.latitude, currentLocationCoordinates!.longitude)
        aqiValue.text = "\(airQualityResponseObj!.aqiValue)"
        airCondition.text = "\(airQualityResponseObj!.aqiCategory)"
        dateFormatting(timestampString: airQualityResponseObj!.datetime)
        
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
    
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "segueTwo" {
            let destination = segue.destination as! PollutantInformationViewController
            destination.aqiObject = airQualityResponseObj
        } else if segue.identifier == "segueThree" {
            let destination = segue.destination as! GuessAQIViewController
            destination.aqiObject = airQualityResponseObj
        }
    }
    
    
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
    
    // following code snippet parses the json response into an airqualityresponse object that includes a pollutant object array
    func fetchResponse(_ latitude: Double, _ longitude: Double) {
        let urlString = "https://api.breezometer.com/air-quality/v2/current-conditions?lat=\(latitude)&lon=\(longitude)&key=428cad28697443b2814a0983cd9e8b1a&features=local_aqi,health_recommendations,pollutants_concentrations"
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                // we're OK to parse!
                let nestedDict = parseIncomingJSONResponse(json: data)
                let pm25Obj = parsePollutantJSONANDCreatePollutantObject(nestedDict, pollutantName: "pm25")
                let pm10Obj = parsePollutantJSONANDCreatePollutantObject(nestedDict, pollutantName: "pm10")
                let so2Obj = parsePollutantJSONANDCreatePollutantObject(nestedDict, pollutantName: "so2")
                let o3Obj = parsePollutantJSONANDCreatePollutantObject(nestedDict, pollutantName: "so2")
                let no2Obj = parsePollutantJSONANDCreatePollutantObject(nestedDict, pollutantName: "no2")
                let coObj = parsePollutantJSONANDCreatePollutantObject(nestedDict, pollutantName: "co")
                let pollutants = [pm25Obj, pm10Obj, so2Obj, o3Obj, no2Obj, coObj]
                airQualityResponseObj = parseAQIJSONANDCreateAQIObject(nestedDict, pollutants)
                
            }
        }
    }
    
    // parse the incoming json data object into sub json dictionaries
    func parseIncomingJSONResponse(json: Data) -> [String:Any]{
        let dict = try? JSONSerialization.jsonObject(with: json, options:  []) as? [String:Any]
        let jsonObj = try? JSONSerialization.data(withJSONObject: dict!["data"]!, options: [])
        let nestedDict = try? JSONSerialization.jsonObject(with: jsonObj!, options: []) as? [String:Any]
        return nestedDict!
    }
    
    // parse pollutant information from the nested json object
    func parsePollutantJSONANDCreatePollutantObject(_ nestedDict: [String:Any]?, pollutantName: String) -> Pollutant {
        
        let jsonObjPollutants = try? JSONSerialization.data(withJSONObject: nestedDict!["pollutants"]!, options: [])
        let pollutantsDict = try? JSONSerialization.jsonObject(with: jsonObjPollutants!, options: []) as? [String:Any]
        
        let jsonObjPollutantName = try? JSONSerialization.data(withJSONObject: pollutantsDict![pollutantName]!, options: [])
        let pollutantNameDict = try? JSONSerialization.jsonObject(with: jsonObjPollutantName!, options: []) as? [String:Any]
        let jsonObjPM25Concentraion = try? JSONSerialization.data(withJSONObject: pollutantNameDict!["concentration"]!, options: [])
        let pollutantNameConcentrationDict = try? JSONSerialization.jsonObject(with: jsonObjPM25Concentraion!, options: []) as? [String:Any]
        
        let name = pollutantNameDict!["display_name"] as! String
        let description = pollutantNameDict!["full_name"] as! String
        let value = pollutantNameConcentrationDict!["value"] as! Double
        let units = pollutantNameConcentrationDict!["units"] as! String
        
        let pollutantObj = Pollutant(name: name, description: description, value: value, units: units)
        return pollutantObj
    }
    
    // parse datetime, health recommendation and local aqi data from the json object
    func parseAQIJSONANDCreateAQIObject(_ nestedDict: [String:Any]?, _ pollutants: [Pollutant]) -> AirQualityResponse {
        
        let jsonObjAQI = try? JSONSerialization.data(withJSONObject: nestedDict!["indexes"]!, options: [])
        let aqiDict = try? JSONSerialization.jsonObject(with: jsonObjAQI!, options: []) as? [String:Any]
        let jsonObjAQIDetails = try? JSONSerialization.data(withJSONObject: aqiDict!["aus_combined"]!, options: [])
        let aqiDetailsDict = try? JSONSerialization.jsonObject(with: jsonObjAQIDetails!, options: []) as? [String:Any]
        
        let jsonObjHealthRec = try? JSONSerialization.data(withJSONObject: nestedDict!["health_recommendations"]!, options: [])
        let healthRecDict = try? JSONSerialization.jsonObject(with: jsonObjHealthRec!, options: []) as? [String:Any]
        
        let datetime = nestedDict!["datetime"] as! String
        let aqiValue = aqiDetailsDict!["aqi"] as! Double
        let aqiColor = aqiDetailsDict!["color"] as! String
        let aqiCategory = aqiDetailsDict!["category"] as! String
        let healthRecommendation = healthRecDict!["children"] as! String
        
        let airQualityResponseObj = AirQualityResponse(datetime: datetime, aqiValue: aqiValue, aqiColor: aqiColor, aqiCategory: aqiCategory, pollutants: pollutants, healthRecommendation: healthRecommendation)
        
        return airQualityResponseObj
    }
    
    // format datetime to display on the aqi screen for last updated aqi 
    func dateFormatting(timestampString: String) {
        //let dateFormatter = DateFormatter()
        //dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        //dateFormatter.timeZone = TimeZone(abbreviation: TimeZone.current.abbreviation() ?? "")
        //let timestamp = dateFormatter.date(from: timestampString)
        let start = timestampString.index(timestampString.startIndex, offsetBy: 11)
        let end = timestampString.index(timestampString.endIndex, offsetBy: -4)
        let range = start..<end
        let substr = timestampString[range]
        datetime.text = "last updated \(substr)"

    }

       
 
}
