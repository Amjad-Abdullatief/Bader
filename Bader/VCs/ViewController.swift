//
//  ViewController.swift
//  Bader
//
//  Created by AMJAD - on ١٥ جما١، ١٤٤٠ هـ.
//  Copyright © ١٤٤٠ هـ aa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        getJsonFromUrl()
        
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let gotoNext = segue.description as! SignupVC
        
    }


    
    func getJsonFromUrl(){
        //creating a NSURL
        print("##getJsonFromUrl open")
        print("##performPostRequest open")
        var request = URLRequest(url: URL(string: "http://amjadsufyani-001-site1.itempurl.com/api/values/MyDonations?User_Id=4")!)
        
        let url = URL(string: "http://amjadsufyani-001-site1.itempurl.com/api/values/MyDonations?User_Id=4")! // Enter URL Here
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            print("##URLSession open")
            do {
                if let data = data,
                    let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
                    let blogs = json["result"] as? [[String: Any]] {
                    print("##URLSession blogs ")
                    for blog in blogs {
                       
                        
                        if let name = blog["Name"] as? String {print("##Name : \(name)")}
                        
                       // if let name1 = blog["Num_of_Clothes"] as? String {print("##Num_of_Clothes : \(name1)")}
                        
                        
                        
//                        self.arrayOfObject.append(self.userObject)
                    }
                }
            } catch {
                print("##Error deserializing JSON: \(error)")
            }
//            print("##names: \(self.names)")
            
//            print(self.names)
            self.showNames()
            
        }
        task.resume()
        
        
    }
    
    func showNames(){
        //looing through all the elements of the array
        DispatchQueue.main.async {
/*
     اضافة البيانات الراجعة على الكمبوننت بالشاشة//
            */
        }
    }
}

