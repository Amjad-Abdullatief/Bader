//
//  Charities.swift
//  Bader
//
//  Created by AMJAD - on 25 جما١، 1440 هـ.
//  Copyright © 1440 هـ aa. All rights reserved.
//

import Foundation

class Charities {
    
    var CharityId : Int
    var Name : String
    var Address : String
    var Coordinate_X : Float
    var Coordinate_Y : Float
    var Phone : String
    var city : String
    var working_hours_week_daysPM : String
    var working_hours_week_daysAM : String
    var working_hours_Friday : String
    var working_hours_Saturday : String
    
    init(CharityId : Int ,Name : String ,Address : String ,Coordinate_X : Float, Coordinate_Y : Float , Phone : String, city : String, working_hours_week_daysPM : String, working_hours_week_daysAM : String, working_hours_Friday : String,working_hours_Saturday : String) {
        
        self.CharityId = CharityId
        self.Name = Name
        self.Address = Address
        self.Coordinate_X = Coordinate_X
        self.Coordinate_Y = Coordinate_Y
        self.Phone = Phone
        self.city = city
        self.working_hours_week_daysPM = working_hours_week_daysPM
        self.working_hours_week_daysAM = working_hours_week_daysAM
        self.working_hours_Saturday = working_hours_Saturday
        self.working_hours_Friday = working_hours_Friday
        
    }
    
}
