//
//  DisplayCharityVC.swift
//  Bader
//
//  Created by AMJAD - on 2 جما٢، 1440 هـ.
//  Copyright © 1440 هـ aa. All rights reserved.
//

//
//  MyDonationsDetailsVC.swift
//  Bader
//
//  Created by AMJAD - on 29 جما١، 1440 هـ.
//  Copyright © 1440 هـ aa. All rights reserved.
//


import UIKit

class DisplayCharityVC: UIViewController {
    
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var Address: UILabel!
    
    
    @IBOutlet weak var Saturday: UILabel!
    @IBOutlet weak var Friday: UILabel!
    @IBOutlet weak var SundayToThursdayAM: UILabel!
    @IBOutlet weak var city: UILabel!
    
    @IBOutlet weak var SundayToThursday: UILabel!
    
    var charity = Charities()
    var view1 = UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getJsonFromUrl()
        // Do any additional setup after loading the view.
    }
    
    func getJsonFromUrl(){
        print("##getJsonFromUrl open")
        print("##performPostRequest open")
        
        let url = URL(string: "http://amjadsufyani-001-site1.itempurl.com/api/values/getCharityDetails?Charity_ID=7")! // Enter URL Here
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            print("##URLSession open")
            do {
                if let data = data,
                    let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
                    let blogs = json["result"] as? [[String: Any]] {
                    //                    print("##URLSession blogs ")
                    
                    for blog in blogs {
                        self.charity=Charities()
                        self.charity = self.charity.getCharitiesData(dataJson: blog)
                        
                     
                        print("##Name = \(self.charity.Name)")
                        print("##Address = \(self.charity.Address)")
                        print("##working_hours_week_daysAM = \(self.charity.working_hours_week_daysAM)")
                        print("##working_hours_week_daysPM = \(self.charity.working_hours_week_daysPM)")
                        print("##working_hours_Friday = \(self.charity.working_hours_Friday)")
                        print("##working_hours_Saturday = \(self.charity.working_hours_Saturday)")
                        print("##user city = \(self.charity.city)")
                        
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
            
            self.Name.text = self.charity.Name
            self.Address.text = self.charity.Address
            self.SundayToThursday.text = self.charity.working_hours_week_daysPM
            self.SundayToThursdayAM.text = self.charity.working_hours_week_daysAM
            self.Saturday.text = self.charity.working_hours_Saturday
            self.Friday.text = self.charity.working_hours_Friday
            self.city.text = self.charity.city
            
            
        }
    }
    
    
    
    
    func startLoding(){
        self.view.addSubview(view1)
    }
    
    func stopLoding(){
        let subViews = self.view.subviews
        for subview in subViews{
            if subview.tag == 1000{
                subview.removeFromSuperview()
            }
        }
    }
    
    func InitializeSpinner(){
        
        view1 = UIView(frame: CGRect(x: 0 , y: 0 , width: 250 , height: 50))
        
        view1.backgroundColor = UIColor.init(red: 119/255, green: 154/255, blue: 218/255, alpha: 1)
        view1.layer.cornerRadius = 10
        let wait = UIActivityIndicatorView(frame: CGRect(x: 10, y: 0, width: 50, height: 50))
        wait.color = UIColor.black
        wait.hidesWhenStopped = false
        wait.startAnimating()
        let text = UILabel(frame: CGRect(x: 60, y: 0, width: 200, height: 50))
        text.text = "يرجى الإنتظار ... "
        view1.addSubview(wait)
        view1.addSubview(text)
        view1.center = self.view.center
        view1.tag = 1000
    }
    
    
    func base64Convert(base64String: String?) -> UIImage{
        //        print("base64String : \(base64String)")
        if (base64String?.isEmpty)! {
            return UIImage(named: "brwsar_iconin.png")!
        }else {
            // !!! Separation part is optional, depends on your Base64String !!!
            let temp = base64String?.components(separatedBy: ",")
            let dataDecoded : Data = Data(base64Encoded: temp![0], options: .ignoreUnknownCharacters)!
            let decodedimage = UIImage(data: dataDecoded)
            return decodedimage!
        }
    }
    
    
}

