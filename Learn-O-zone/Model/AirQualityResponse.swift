//
//  AirQualityResponse.swift
//  Maps-Revision
//
//  Created by Hasan Qasim on 24/4/20.
//  Copyright © 2020 Hasan Qasim. All rights reserved.
//

import Foundation
import MapKit
// data model for air quality resposne
struct AirQualityResponse {
    var datetime: String
    var aqiValue: Double
    var aqiColor: String
    var aqiCategory: String
    var pollutants: [Pollutant]
    var healthRecommendation: String
}
