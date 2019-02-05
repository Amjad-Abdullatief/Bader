//
//  TheOrders.swift
//  Bader
//
//  Created by AMJAD - on 25 جما١، 1440 هـ.
//  Copyright © 1440 هـ aa. All rights reserved.
//

import Foundation

class Orders {
    
    var OrderId : Int = 0
    var Name_of_Needy : String = ""
    var Order_the_Needy : String = ""
    var Address : String = ""
    var Contact_Way : String = ""
    var Date_of_Add : String = ""
    
    
    func getOrdersData( dataJson:[String: Any] ) -> (Orders) {
        var orders = Orders()
        orders.OrderId = dataJson["OrderId"] as? Int ?? 0
        orders.Name_of_Needy = dataJson["Name_of_Needy"] as? String ?? ""
        orders.Order_the_Needy = dataJson["Order_the_Needy"] as? String ?? ""
        orders.Address = dataJson["Address"] as? String ?? ""
        orders.Contact_Way = dataJson["Contact_Way"] as? String ?? ""
        orders.Date_of_Add = dataJson["Date_of_Add"] as? String ?? ""

        return orders
    }
    
}
