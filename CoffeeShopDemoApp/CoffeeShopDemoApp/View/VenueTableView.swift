//
//  ListViewController.swift
//  CoffeeShopDemoApp
//
//  Created by Enkhjargal Gansukh on 2021.01.07.
//

import Foundation
import UIKit

class VenueTableView: UIViewController {
    
    let viewModel = VenueTableViewModel()
    var table = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        self.view.backgroundColor = .green
        table.register(VenueTableCell.self, forCellReuseIdentifier: "venueTableCell")
        table.delegate = self
        table.dataSource = self
        
        self.view.addSubview(table)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        table.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
        
        viewModel.fetchVenueList()
    }
}

extension VenueTableView: ViewModelDelegate {
    func dataChanged() {
        self.table.reloadData()
    }
}


extension VenueTableView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.venueList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "venueTableCell") as! VenueTableCell
        cell.venue = viewModel.venueList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(viewModel.venueList[indexPath.row])
    }
}
