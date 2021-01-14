//
//  Venue.swift
//  DemoApp
//
//  Created by Enkhjargal Gansukh on 2021.01.07.
//

import Foundation


struct Venue: Codable {
    let id: String
    let name: String
    let location: Location
    let referralId: String
    let hasPerk: Bool
}
