//
//  ListItem.swift
//  CoffeeShop
//
//  Created by Enkhjargal Gansukh on 2021.01.13.
//

import SwiftUI

struct ListItemView: View {
    let venue: Venue
    let apiService = APIService()
    @State var image = UIImage()
    var body: some View {
        HStack(spacing: 30) {
            Image(uiImage: image)
                .resizable()
                .frame(width: 40.0, height: 40.0)
            VStack(alignment: .leading, spacing: 10) {
                Text("\(venue.name)")
                    .font(Font.system(size: 18))
                Text("\(venue.location.address),  \(String(format: "%.1f", Float(venue.location.distance) * 0.000621)) MI")
                    .font(Font.system(size: 12))
                    .foregroundColor(.gray)
            }
        }
        .onAppear {
            DispatchQueue.global().async {
                fetchImage()
            }
        }
    }
    
    func fetchImage() {
        apiService.fetchImage(venueId: venue.id) { data in
            guard let d = data else {
                print("no image data")
                return
            }
            guard let img = UIImage(data: d) else {
                print("cannot create uiimage")
                return
            }
            DispatchQueue.main.async {
                self.image = img
            }
        }
    }
}
