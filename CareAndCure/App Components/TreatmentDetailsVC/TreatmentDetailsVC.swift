//
//  TreatmentDetailsVC.swift
//  CareAndCure
//
//  Created by Mohamed M3aty on 3/7/20.
//  Copyright © 2020 Mohamed M3aty. All rights reserved.
//

import UIKit
import Alamofire

class TreatmentDetailsVC: UIViewController {
    
    @IBOutlet weak var treatmentImageView: UIImageView! {
        didSet {
            treatmentImageView.layer.cornerRadius = 10
            treatmentImageView.clipsToBounds = true
        }
    }
    
    @IBOutlet weak var treatmentNameLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var expireDateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var treatmentPriceLabel: UILabel!
    @IBOutlet weak var ownerNameLabel: UILabel!
    
    var treatmentId:Int!
    override func viewDidLoad() {
        super.viewDidLoad()
        featchData(id: treatmentId)
        
    }
    
    func configure(item: TreatmentDetails) {
        treatmentNameLabel.text = item.name
        cityLabel.text          = ((item.city!) as NSNumber).stringValue
        quantityLabel.text      = ((item.quantity!) as NSNumber).stringValue
        priceLabel.text         = ((item.price!) as NSNumber).stringValue
        expireDateLabel.text    = item.expireDate
        descriptionLabel.text   = item.descriptionField
        ownerNameLabel.text     = item.owner
        treatmentImageView.kf.indicatorType = .activity
        treatmentImageView.kf.setImage(with: URL(string: item.image ?? "no Image")!)
    }
    
    func featchData(id: Int)  {
        view.showActivityIndicator(isUserInteractionEnabled: true)
        Alamofire.request(TreatmentRouter.treatmentDetail(id: id)).debugLog().responseData { [weak self] response in
            guard let self = self else { return }
            self.view.hideActivityIndicator()
            print("Show Response: ",String.init(data:response.data!, encoding:.utf8)!)
            
            switch response.result {
            case .success(let data):
                do {
                    let result = try JSONDecoder().decode(DetailsResponse.self, from: data)
                    let serlize = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: Any]
                    print("serilize data: ", serlize)
                    if let data = result.data {
                        print(data)   
                    }
                    
                } catch {
                    print(error.localizedDescription)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
