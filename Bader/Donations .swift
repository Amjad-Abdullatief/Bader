//
//  Donations .swift
//  Bader
//
//  Created by AMJAD - on 25 جما١، 1440 هـ.
//  Copyright © 1440 هـ aa. All rights reserved.
//

import Foundation
import UIKit

class Donations {
    
    var DonationId : Int = 0
    var name : String = ""
    var description : String = ""
    var image : String = ""
    var type : Int = 0
    var OrderStatus : Int = 0
    var DateOfOrder : String = ""
    var DateOfUpload : String = ""
    
    //    init(_ dictionary: [String: Any]) {
    //
    //        self.DonationId = dictionary["DonationId"] as? Int ?? 0
    //        self.name = dictionary["name"] as? String ?? ""
    //        self.description = dictionary["description"] as? String ?? ""
    //        self.image = dictionary["image"] as? String ?? ""
    //        self.type = dictionary["type"] as? Int ?? 0
    //        self.OrderStatus = dictionary["OrderStatus"] as? Int ?? 0
    //        self.DateOfOrder = (dictionary["DateOfOrder"] as? Data ??  nil)!
    //        self.DateOfUpload = (dictionary["DateOfUpload"] as? Data ?? nil)!
    //    }
    
    func getDonationsData( dataJson:[String: Any] ) -> (Donations) {
        var donation = Donations()
        donation.DonationId = dataJson["Donation_id"] as? Int ?? 0
        donation.name = dataJson["Name"] as? String ?? ""
        donation.description = dataJson["Description"] as? String ?? ""
        donation.image = dataJson["Image"] as? String ?? ""
        donation.type = dataJson["Type"] as? Int ?? 0
        donation.OrderStatus = dataJson["Order_Status"] as? Int ?? 0
        donation.DateOfOrder = dataJson["Date_of_Order"] as? String ?? ""
        donation.DateOfUpload = dataJson["Date_of_Upload"] as? String ?? ""
        
        return donation 
    }
    
    
}
