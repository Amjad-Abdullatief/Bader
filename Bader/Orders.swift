//
//  TheOrders.swift
//  Bader
//
//  Created by AMJAD - on 25 جما١، 1440 هـ.
//  Copyright © 1440 هـ aa. All rights reserved.
//

import Foundation

class Orders {
    
    var OrderId : Int
    var Name_of_Needy : String
    var Order_the_Needy : String
    var Address : String
    var Contact_Way : String
    var Date_of_Add : Data
    
    init(OrderId : Int, Name_of_Needy : String , Order_the_Needy : String,Address : String,Contact_Way : String,Date_of_Add : Data) {
        
        self.OrderId = OrderId
        self.Name_of_Needy = Name_of_Needy
        self.Order_the_Needy = Order_the_Needy
        self.Address = Address
        self.Contact_Way = Contact_Way
        self.Date_of_Add = Date_of_Add
    }
    
    
}
