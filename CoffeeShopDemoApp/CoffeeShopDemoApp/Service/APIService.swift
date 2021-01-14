//
//  APIService.swift
//  CoffeeShopDemoApp
//
//  Created by Enkhjargal Gansukh on 2021.01.08.
//

import Foundation

class APIService {
    
    func fetchData(callback: @escaping ([Venue]?)-> Void) {
        let urlString = Constants.getCompleteURL()
        guard let url = URL(string: urlString) else {
            print("url parsing failed")
            callback(nil)
            return
        }
        let session = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let err = error {
                print(err.localizedDescription)
                callback(nil)
                return
            }
            guard let d = data else {
                print("data is empty")
                callback(nil)
                return
            }
            do {
                let res = try JSONDecoder().decode(Results.self, from: d)
                callback(res.response.venues)
            }catch{
                print(error.localizedDescription)
                callback(nil)
            }
        }
        session.resume()
    }
    
    
    func fetchVenueDetail(){
        
    }
    
    func fetchImageURL(venueId: String, callback: @escaping (String?) -> Void) {
        let urlString = Constants.getImageCompleteURL(venueID: venueId, limit: 1)
        print(urlString)
        guard let url = URL(string: urlString) else {
            print("url unwrapping error")
            callback(nil)
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let err = error {
                print(err.localizedDescription)
                callback(nil)
                return
            }
            guard let d = data else {
                print("no data when getting image url")
                callback(nil)
                return
            }
            do {
                let res = try JSONDecoder().decode(ImageResult.self, from: d)
                let imageURL = res.response.photos.items[0].prefix + "300x500" + res.response.photos.items[0].suffix
                callback(imageURL)
            } catch {
                print(error.localizedDescription)
                callback(nil)
            }
        }.resume()
    }
    
    
    func fetchImage(venueId: String, callback: @escaping (Data?)->Void) {
        fetchImageURL(venueId: venueId) { response in
            guard let urlString = response else {
                callback(nil)
                return
            }
            print(urlString)
            guard let url = URL(string: urlString) else {
                callback(nil)
                return
            }
            
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let err = error {
                    print(err.localizedDescription)
                    callback(nil)
                    return
                }
                callback(data)
            }.resume()
        }
    }
}
