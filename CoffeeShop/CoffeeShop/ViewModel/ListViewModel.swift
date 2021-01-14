//
//  ListViewModel.swift
//  CoffeeShop
//
//  Created by Enkhjargal Gansukh on 2021.01.13.
//

import Foundation

class ListViewModel: ObservableObject {
    let apiService = APIService()
    @Published var venueList = [Venue]()
    
    func fetchVenueList() {
        apiService.fetchData() { data in
            guard let list = data else {
                print("no data")
                return
            }
            DispatchQueue.main.async {
                self.venueList = list
            }
        }
    }
}
