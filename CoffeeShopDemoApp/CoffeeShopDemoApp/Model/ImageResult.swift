//
//  ImageResult.swift
//  CoffeeShopDemoApp
//
//  Created by Enkhjargal Gansukh on 2021.01.07.
//

import Foundation

struct ImageResult: Decodable {
    let response: ImageResponse
}

struct ImageResponse: Decodable {
    let photos: PhotoList
}

struct PhotoList: Decodable {
    let items: [Photo]
}

struct Photo: Decodable {
    let id: String
    let createdAt: Int
    let prefix: String
    let suffix: String
    let width: Int
    let height: Int
}
