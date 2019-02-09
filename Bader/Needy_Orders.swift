//
//  Needy_Orders.swift
//  Bader
//
//  Created by AMJAD - on 25 جما١، 1440 هـ.
//  Copyright © 1440 هـ aa. All rights reserved.
//

import Foundation

class NeedyOrders {
    
    var id : Int = 0
    var User_id : Int = 0
    var  Donation_id : Int = 0
    var OrderUser_status : Int = 0

    
    func getOrdersData( dataJson:[String: Any] ) -> (NeedyOrders) {
        var order = NeedyOrders()
        order.id = dataJson["ID"] as? Int ?? 0
        order.User_id = dataJson["User_id"] as? Int ?? 0
        order.Donation_id = dataJson["Donation_id"] as? Int ?? 0
        order.OrderUser_status = dataJson["OrderUser_status"] as? Int ?? 0

        return order
    }
}
