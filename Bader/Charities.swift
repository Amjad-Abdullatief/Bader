//
//  Charities.swift
//  Bader
//
//  Created by AMJAD - on 25 جما١، 1440 هـ.
//  Copyright © 1440 هـ aa. All rights reserved.
//

import Foundation

class Charities {
    
    var CharityId : Int = 0
    var Name : String = ""
    var Address : String = ""
    var Coordinate_X : Float = 0.0
    var Coordinate_Y : Float = 0.0
    var Phone : String = ""
    var city : String = ""
    var working_hours_week_daysPM : String = ""
    var working_hours_week_daysAM : String = ""
    var working_hours_Friday : String = ""
    var working_hours_Saturday : String = ""
    

    func getCharitiesData( dataJson:[String: Any] ) -> (Charities) {
        let charity = Charities()
        charity.CharityId = dataJson["CharityId"] as? Int ?? 0
        charity.Name = dataJson["Name"] as? String ?? ""
        charity.Address = dataJson["Address"] as? String ?? ""
        charity.Coordinate_X = dataJson["Coordinate_X"] as? Float ?? 0.0
        charity.Coordinate_Y = dataJson["Coordinate_Y"] as? Float ?? 0.0
        charity.Phone = dataJson["Phone"] as? String ?? ""
        charity.city = dataJson["city"] as? String ?? ""
        charity.working_hours_week_daysPM = dataJson["working_hours_week_daysPM"] as? String ?? ""
        charity.working_hours_week_daysAM = dataJson["working_hours_week_daysAM"] as? String ?? ""
        charity.working_hours_Saturday = dataJson["working_hours_Saturday"] as? String ?? ""
        charity.working_hours_Friday = dataJson["working_hours_Friday"] as? String ?? ""
        
        
        return charity
    }
}
