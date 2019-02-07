//
//  DisplayOrdersCell.swift
//  Bader
//
//  Created by AMJAD - on 2 جما٢، 1440 هـ.
//  Copyright © 1440 هـ aa. All rights reserved.
//

import UIKit

class DisplayOrdersCell: UITableViewCell {
    
    
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var OrderOfNeedy: UILabel!
    @IBOutlet weak var Address: UILabel!
    @IBOutlet weak var ContactWay: UILabel!
    @IBOutlet weak var DateOfUpload: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
