//
//  Constants.swift
//  CoffeeShop
//
//  Created by Enkhjargal Gansukh on 2021.01.13.
//

import Foundation

class Constants {
    static let venueURLString = "https://api.foursquare.com/v2/venues/search"
    static let imageURLString = "https://api.foursquare.com/v2/venues/"
    static let CLIENT_ID = "JVV51ZLI3JUU0BXVMC1B30FCYLVHBR0XRWJM3YYTZRDPLCOT"
    static let CLIENT_KEY = "YOTRNQSVFR0SB35RVDXFQT2RUADCX0YKVW1GUFER3SLPW3ES"
    static let LOCATION = "37.77514373775431,-122.39786396394504"
    static let CATEGORY_TYPE = "coffee"
    static let DEFAULT_DATE = "20210307"
    
    static func getCompleteURL() -> String {
      return "\(venueURLString)?client_id=\(CLIENT_ID)&client_secret=\(CLIENT_KEY)&query=\(CATEGORY_TYPE)&limit=15&v=\(DEFAULT_DATE)&ll=\(LOCATION)"
    }
    
    static func getImageCompleteURL(venueID: String, limit: Int) -> String {
        return "\(imageURLString)"+"\(String(venueID))/photos?client_id=\(CLIENT_ID)&client_secret=\(CLIENT_KEY)&v=\(DEFAULT_DATE)&limit=\(limit)"
    }
}
