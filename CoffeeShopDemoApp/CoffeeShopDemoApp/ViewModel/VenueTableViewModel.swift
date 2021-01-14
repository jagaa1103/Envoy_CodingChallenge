//
//  ListViewModel.swift
//  CoffeeShopDemoApp
//
//  Created by Enkhjargal Gansukh on 2021.01.07.
//

import Foundation


class VenueTableViewModel {
    
    var apiService: APIService
    var delegate: ViewModelDelegate?
    
    var venueList = [Venue]() {
        didSet {
            self.delegate?.dataChanged()
        }
    }
    
    init(apiService: APIService = APIService()) {
        self.apiService = apiService
    }
    
    
    func fetchVenueList() {
        apiService.fetchData(){ venueList in
            if let list = venueList {
                DispatchQueue.main.async {
                    self.venueList = list
                }
            }
        }
    }
}
