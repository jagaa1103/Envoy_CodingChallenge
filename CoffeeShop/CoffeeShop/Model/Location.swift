//
//  Location.swift
//  DemoApp
//
//  Created by Enkhjargal Gansukh on 2021.01.07.
//

import Foundation


struct Location: Codable {
    let address: String
    let lat: Double
    let lng: Double
    let distance: Int
    let city: String
    let state: String
    let country: String
}
