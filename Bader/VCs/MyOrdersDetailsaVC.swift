//
//  MyOrdersDetailsa.swift
//  Bader
//
//  Created by AMJAD - on 30 جما١، 1440 هـ.
//  Copyright © 1440 هـ aa. All rights reserved.
//


import UIKit

class MyOrdersDetailsaVC: UIViewController {
    
    @IBOutlet weak var donationName: UILabel!
    @IBOutlet weak var donationImage: UIImageView!
    @IBOutlet weak var donationUserName: UILabel!
    @IBOutlet weak var donationDesc: UILabel!
    @IBOutlet weak var donationUserEmail: UILabel!
    @IBOutlet weak var donationUserCity: UILabel!
    
    @IBOutlet weak var ButtonDelivary: UIButton!
    
    var donation = Donations()
    var user = Users()
    var view1 = UIView()
    var donationId = 0;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getJsonFromUrl()
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func DeliveryButton(_ sender: UIButton) {
        UpdateToDelivery()
    }
    
 
    func showNames(){
        //looing through all the elements of the array
        DispatchQueue.main.async {
            
            self.donationName.text = self.donation.name
            self.donationUserName.text = self.user.Fname + " " + self.user.Lname
            self.donationUserEmail.text = self.user.email
            self.donationImage.image = self.base64Convert(base64String: self.donation.image)
            self.donationDesc.text = self.donation.description
            self.donationUserCity.text = self.user.city
            
            self.ButtonDelivary.isHidden = ( UserInfo.userId == self.donation.Id_of_Needy ) ? false : true;
            
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
    
    
    func getJsonFromUrl(){
        print("##getJsonFromUrl open")
        print("##performPostRequest open")
        
        let url = URL(string: "http://amjadsufyani-001-site1.itempurl.com/api/values/DonationDetails?Donation_id="+donationId.description)! // Enter URL Here
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            print("##URLSession open")
            do {
                if let data = data,
                    let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
                    let blogs = json["result"] as? [[String: Any]] {
                    //                    print("##URLSession blogs ")
                    
                    for blog in blogs {
                        self.donation=Donations()
                        self.donation = self.donation.getDonationsData(dataJson: blog)
                        
                        if let userList = blog["user"] as? [String: Any] {
                            print("##blogsUser = \(userList)")
                            print("##blogsUser = \(userList)")
                            self.user = self.user.getUsersData(dataJson: userList)
                            
                        }
                        print("##donationId = \(self.donation.DonationId)")
                        print("##name = \(self.donation.name)")
                        print("##OrderStatus = \(self.donation.OrderStatus)")
                        print("##description = \(self.donation.description)")
                        print("##user Fname = \(self.user.Fname)")
                        print("##user mail = \(self.user.email)")
                        print("##user city = \(self.user.city)")
                        
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
    
    
    func UpdateToDelivery(){
        print("##getJsonFromUrl open")
        print("##performPostRequest open")
        
        let url = URL(string: "http://amjadsufyani-001-site1.itempurl.com/api/values/updateWhenOrderDeliver?Donation_id=" + donationId.description)! // Enter URL Here
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            print("##URLSession open")
            do {
                if let data = data,
                    let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
                    let blogs = json["result"] as? [[String: Any]] {
                    //                    print("##URLSession blogs ")
                    
                    for blog in blogs {
                        self.donation=Donations()
                        self.donation = self.donation.getDonationsData(dataJson: blog)
                        
                        if let userList = blog["user"] as? [String: Any] {
                            print("##blogsUser = \(userList)")
                            print("##blogsUser = \(userList)")
                            self.user = self.user.getUsersData(dataJson: userList)
                            
                        }
//                        print("##donationId = \(self.donation.DonationId)")
//                        print("##name = \(self.donation.name)")
//                        print("##OrderStatus = \(self.donation.OrderStatus)")
//                        print("##description = \(self.donation.description)")
//                        print("##user Fname = \(self.user.Fname)")
//                        print("##user mail = \(self.user.email)")
//                        print("##user city = \(self.user.city)")
                        
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
    
    
}

