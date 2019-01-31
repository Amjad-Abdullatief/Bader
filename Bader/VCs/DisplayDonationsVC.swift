//
//  DisplayDonationsVC.swift
//  Bader
//
//  Created by AMJAD - on 20 جما١، 1440 هـ.
//  Copyright © 1440 هـ aa. All rights reserved.
//

import UIKit

class DisplayDonationsVC : UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    @IBOutlet weak var TableViewData: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableViewData.dequeueReusableCell(withIdentifier: "CellData", for: indexPath) as! TableViewCell
        
        cell.name.text = "name" + indexPath.row.description
        cell.descriptions.text = "description"
        // cell.images.image = UIImage(named: )
      
        return cell
    }
 
    
    
    
    
}
