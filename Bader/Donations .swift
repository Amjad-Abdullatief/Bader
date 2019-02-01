//
//  Donations .swift
//  Bader
//
//  Created by AMJAD - on 25 جما١، 1440 هـ.
//  Copyright © 1440 هـ aa. All rights reserved.
//

import Foundation

class Donations {
    
    var DonationId : Int
    var name : String
    var description : String
    var image : String
    var type : Int
    var OrderStatus : Int
    var DateOfOrder : Data
    var DateOfUpload : Data
    
    init(DonationId : Int, name : String ,description : String, image : String , type : Int,OrderStatus : Int, DateOfOrder : Data ,DateOfUpload : Data) {
        
        self.DonationId = DonationId
        self.name = name
        self.description = description
        self.image = image
        self.type = type
        self.OrderStatus = OrderStatus
        self.DateOfOrder = DateOfOrder
        self.DateOfUpload = DateOfUpload
    }
    
    
}
