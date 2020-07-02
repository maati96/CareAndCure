//
//  TreatmentCell.swift
//  CareAndCure
//
//  Created by Mohamed M3aty on 3/17/20.
//  Copyright © 2020 Mohamed M3aty. All rights reserved.
//

import UIKit
import Kingfisher

class TreatmentCell: UITableViewCell {

    @IBOutlet weak var tradementImageView: UIImageView!
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var treatmentNameLabel: UILabel!
    @IBOutlet weak var ownerNameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tradementImageView.layer.cornerRadius = 10
        tradementImageView.clipsToBounds = true
        
    }
    
    func configure(item: AllTreatment) {
        placeLabel.text = (item.city! as NSNumber).stringValue
        treatmentNameLabel.text = item.name
        priceLabel.text = (item.price! as NSNumber).stringValue
        ownerNameLabel.text = item.owner
        tradementImageView.kf.indicatorType = .activity
        tradementImageView.kf.setImage(with: URL(string: item.image ?? "no Image")!)
    }
    

}
