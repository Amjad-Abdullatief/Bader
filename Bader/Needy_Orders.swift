//
//  Needy_Orders.swift
//  Bader
//
//  Created by AMJAD - on 25 جما١، 1440 هـ.
//  Copyright © 1440 هـ aa. All rights reserved.
//

import Foundation

class NeedyOrders {
    
    var id : Int
    var User_id : Int
    var  Donation_id : Int
    var OrderUser_status : Int
    
    init(id : Int ,User_id : Int,Donation_id : Int,OrderUser_status : Int) {
        
        self.id = id 
        self.User_id = User_id
        self.Donation_id = Donation_id
        self.OrderUser_status = OrderUser_status
    }
}
