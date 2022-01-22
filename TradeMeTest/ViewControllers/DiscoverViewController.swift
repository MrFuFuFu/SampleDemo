//
//  DiscoverViewController.swift
//  TradeMeTest
//
//  Created by Yuan on 20/01/22.
//

import UIKit

class DiscoverViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private var listingsModel: ListingsModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "ItemTableViewCell", bundle: nil), forCellReuseIdentifier: "ItemTableViewCell")

        requestList()
    }
    
    private func requestList() {
        APIClient.shared.latestListings { [weak self] (listingsModel, error) in
            self?.listingsModel = listingsModel
            self?.tableView.reloadData()
            if let listingsModel = listingsModel {
                print(listingsModel)
            } else if let error = error {
                print(error.localizedDescription)
            }
            
        }
    }

    @IBAction func onSearchBarItemClick(_ sender: UIBarButtonItem) {
        alert(msg: "Search Clicked")
    }
    
    @IBAction func onCartBarItemClick(_ sender: UIBarButtonItem) {
        alert(msg: "Cart Clicked")
    }

}

extension DiscoverViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listingsModel?.list?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemTableViewCell") as! ItemTableViewCell
        cell.listModel = listingsModel?.list?[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let index = self.tableView.indexPathForSelectedRow{
            self.tableView.deselectRow(at: index, animated: true)
        }
        
        if let itemTableViewCell = tableView.cellForRow(at: indexPath) as? ItemTableViewCell, let title = itemTableViewCell.listModel?.title {
            alert(msg: "Item \"\(title)\" Clicked")
        } else {
            alert(msg: "Row \(indexPath.row) Clicked")
        }
    }
}
