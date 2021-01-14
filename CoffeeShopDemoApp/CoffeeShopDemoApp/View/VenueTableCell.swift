//
//  ListCell.swift
//  CoffeeShopDemoApp
//
//  Created by Enkhjargal Gansukh on 2021.01.07.
//

import Foundation
import UIKit


class VenueTableCell: UITableViewCell {
    
    let apiService = APIService()
    
    var img = UIImageView()
    var name = UILabel()
    var address = UILabel()
    
    var venue: Venue! {
        didSet {
            self.setContents(venue: venue)
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setViews()
    }
    
    func setViews() {
        
        address.textColor = .lightGray
        
        self.contentView.addSubview(img)
        self.contentView.addSubview(name)
        self.contentView.addSubview(address)
        
        img.backgroundColor = .lightGray
        
        img.translatesAutoresizingMaskIntoConstraints = false
        name.translatesAutoresizingMaskIntoConstraints = false
        address.translatesAutoresizingMaskIntoConstraints = false
        
        
        let viewsDict = [ "img": img, "name": name, "address": address, ]

        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[img(50)]", options: [], metrics: nil, views: viewsDict))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[img(50)]", options: [], metrics: nil, views: viewsDict))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[name]-[address]-|", options: [], metrics: nil, views: viewsDict))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[img]-[name]-|", options: [], metrics: nil, views: viewsDict))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[img]-[address]-|", options: [], metrics: nil, views: viewsDict))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setContents(venue: Venue){
        name.text = venue.name
        address.text = venue.location.address
        self.setImage(venueId: venue.id)
    }
    
    func setImage(venueId: String) {
        apiService.fetchImage(venueId: venueId) { data in
            guard let data = data else {
                print("No Image")
                return
            }
            DispatchQueue.main.async {
                self.img.image = UIImage(data: data)
            }
        }
    }
}
