//
//  HomeVC.swift
//  CareAndCure
//
//  Created by Mohamed M3aty on 3/7/20.
//  Copyright © 2020 Mohamed M3aty. All rights reserved.
//

import UIKit
import iOSDropDown
class HomeVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet var priceLabel: DropDown!
    @IBOutlet weak var locationLabel: DropDown!
    @IBOutlet weak var treatementTypeLabel: DropDown!
    
    let imog = ["😍","🚎","🚝"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        configreSearchController()
        configureTableView()
        
        priceLabel.text = "السعر"
        priceLabel.optionArray = ["20$","30$","50$","hhhh"]
        locationLabel.optionArray = ["المنصوره","الجيزه","دمياط","القاهرة"]
        treatementTypeLabel.optionArray = ["مسكنات","مضاد حيوي","كريمات"]
        
        
        
    }
    
    fileprivate func configreSearchController() {
        let searchController = UISearchController(searchResultsController: nil)
        // 1
        searchController.searchResultsUpdater = self
        // 2
        searchController.obscuresBackgroundDuringPresentation = false
        // 3
        searchController.searchBar.placeholder = "ابحث عن الدواء"
        searchController.searchBar.searchBarStyle = .prominent
        // 4
        navigationItem.searchController = searchController
        // 5
        definesPresentationContext = true
        
        var isSearchBarEmpty: Bool {
            return searchController.searchBar.text?.isEmpty ?? true
        }
//        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    
    fileprivate func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TreatmentCell", bundle: nil),forCellReuseIdentifier: "cellId")
    }
    
    
}


extension HomeVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! TreatmentCell
        cell.placeLabel.text = "المكان"
        cell.priceLabel.text = "السعر"
        cell.typeLabel.text = "النوع"
        cell.tradementImageView.image = #imageLiteral(resourceName: "tradement")
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToDetailVC", sender: nil)
    }
    
}

extension HomeVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    
}
