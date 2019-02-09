//
//  ListNeedyCell.swift
//  Bader
//
//  Created by AMJAD - on 30 جما١، 1440 هـ.
//  Copyright © 1440 هـ aa. All rights reserved.
//

import UIKit

class ListNeedyCell: UITableViewCell {

    @IBOutlet weak var NeedyNames: UILabel!
    @IBOutlet weak var NeedyEmail: UILabel!
    @IBOutlet weak var NeedyAcceptButton: UIButton!
    @IBOutlet weak var NeedyStets: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
