//
//  TableViewCell.swift
//  Bader
//
//  Created by AMJAD - on 20 جما١، 1440 هـ.
//  Copyright © 1440 هـ aa. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var images: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var descriptions : UILabel!
    @IBOutlet weak var UploadDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
