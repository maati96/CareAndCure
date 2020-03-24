//
//  TreatmentCell.swift
//  CareAndCure
//
//  Created by Mohamed M3aty on 3/17/20.
//  Copyright © 2020 Mohamed M3aty. All rights reserved.
//

import UIKit

class TreatmentCell: UITableViewCell {

    @IBOutlet weak var tradementImageView: UIImageView!
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tradementImageView.layer.cornerRadius = 10
        tradementImageView.clipsToBounds = true
        
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
   
    

    
}
