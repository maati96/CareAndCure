//
//  HomeVC.swift
//  CareAndCure
//
//  Created by Mohamed M3aty on 3/7/20.
//  Copyright © 2020 Mohamed M3aty. All rights reserved.
//

import UIKit
import Alamofire
import iOSDropDown



class HomeVC: UIViewController{
    
    @IBOutlet weak var searchbar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var locationLabel: DropDown!
    @IBOutlet weak var treatementTypeLabel: DropDown!
 
    var treatment =  [AllTreatment]()  { didSet { filteredTreatment = treatment  } }
    var filteredTreatment  = [AllTreatment]() { didSet { tableView.reloadData() }}

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isTranslucent = false
        configureTableView()
        searchbar.delegate = self
        
        locationLabel.optionArray = ["المنصوره","الجيزه","دمياط","القاهرة"]
        treatementTypeLabel.optionArray = ["مسكنات","مضاد حيوي","كريمات"]
        
        featchData()
    }
  
    fileprivate func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TreatmentCell", bundle: nil),forCellReuseIdentifier: "cellId")
    }
}


extension HomeVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredTreatment.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! TreatmentCell
        cell.configure(item: filteredTreatment[indexPath.row])
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let treatmentVC = storyboard?.instantiateViewController(identifier: "treatmentDetails") as! TreatmentDetailsVC
        
        treatmentVC.treatmentId = 2
        self.navigationController?.pushViewController(treatmentVC, animated: true)
    }
        
    func featchData()  {
        view.showActivityIndicator(isUserInteractionEnabled: true)
        Alamofire.request(TreatmentRouter.allTreatment).debugLog().responseData { [weak self] response in
            guard let self = self else { return }
            print("Show Response: ",String.init(data:response.data!, encoding:.utf8)!)
            self.view.hideActivityIndicator()
            switch response.result {
            case .success(let data):
                do {
                    let result = try JSONDecoder().decode(AllTreatmentContainer.self, from: data)
                    print(result)
                    self.treatment = result.data ?? []
                } catch {
                    print(error.localizedDescription)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}

extension HomeVC: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredTreatment = searchText.isEmpty ?  treatment : treatment.filter { $0.name!.lowercased().contains(searchText.lowercased())}
    }
}
