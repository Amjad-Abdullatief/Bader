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
        user.UserId = dataJson["User_Id"] as? Int ?? 0
        user.Fname = dataJson["First_name"] as? String ?? ""
        user.Lname = dataJson["Last_name"] as? String ?? ""
        user.email = dataJson["Email"] as? String ?? ""
        user.password = dataJson["Password"] as? String ?? ""
        user.city = dataJson["City"] as? String ?? ""
        user.type = dataJson["Type"] as? Int ??  0
        
        return user
    }
    
    
}
