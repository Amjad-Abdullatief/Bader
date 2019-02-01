//
//  Users.swift
//  Bader
//
//  Created by AMJAD - on 25 جما١، 1440 هـ.
//  Copyright © 1440 هـ aa. All rights reserved.
//

import Foundation

class Users {
    var UserId : Int = 0
    var Fname : String = ""
    var Lname : String=""
    var email : String=""
    var password : String=""
    var city : String=""
    var active : Int=0
    var type : Int=0
    var DateOfRegister : String=""
    

    
//    init(UserId : Int ,Fname : String , Lname : String,email : String, password : String,city : String,active : Int,type : Int,DateOfRegister : Data) {
//
//        self.UserId = UserId
//        self.Fname = Fname
//        self.Lname = Lname
//        self.email = email
//        self.password = password
//        self.city = city
//        self.active = active
//        self.type = type
//        self.DateOfRegister = DateOfRegister
//
//    }

    
    func getUsersData( dataJson:[String: Any] ) -> (Users) {
        var user = Users()
        user.UserId = dataJson["Donation_id"] as? Int ?? 0
        user.Fname = dataJson["Name"] as? String ?? ""
        user.Lname = dataJson["Description"] as? String ?? ""
        user.email = dataJson["Image"] as? String ?? ""
        user.password = dataJson["Type"] as? String ?? ""
        user.city = dataJson["Order_Status"] as? String ?? ""
        user.type = dataJson["Date_of_Order"] as? Int ??  0
        
        return user
    }
    
    
}
