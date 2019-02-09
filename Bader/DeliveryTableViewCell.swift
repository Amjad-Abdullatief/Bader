//
//  DeliveryTableViewCell.swift
//  Bader
//
//  Created by AMJAD - on 4 جما٢، 1440 هـ.
//  Copyright © 1440 هـ aa. All rights reserved.
//

import UIKit

class DeliveryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var DonationName: UILabel!
    @IBOutlet weak var DonationImage: UIImageView!
    @IBOutlet weak var NeedyName: UILabel!
    @IBOutlet weak var Email: UILabel!
    @IBOutlet weak var City: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
