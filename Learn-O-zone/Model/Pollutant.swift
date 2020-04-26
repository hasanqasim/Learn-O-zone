//
//  Pollutant.swift
//  Maps-Revision
//
//  Created by Hasan Qasim on 25/4/20.
//  Copyright © 2020 Hasan Qasim. All rights reserved.
//

import Foundation

struct Pollutant: Codable {
    var name: String
    var description: String
    var value: Double
    var units: String
}
