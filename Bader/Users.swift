//
//  Users.swift
//  Bader
//
//  Created by AMJAD - on 25 جما١، 1440 هـ.
//  Copyright © 1440 هـ aa. All rights reserved.
//

import Foundation

class Users {
    var UserId : Int
    var Fname : String
    var Lname : String
    var email : String
    var password : String
    var city : String
    var active : Int
    var type : Int
    var DateOfRegister : Data
    

    
    init(UserId : Int ,Fname : String , Lname : String,email : String, password : String,city : String,active : Int,type : Int,DateOfRegister : Data) {
        
        self.UserId = UserId
        self.Fname = Fname
        self.Lname = Lname
        self.email = email
        self.password = password
        self.city = city
        self.active = active
        self.type = type
        self.DateOfRegister = DateOfRegister
        
    }

    
    
}
