//
//  DeliveryPageVC.swift
//  Bader
//
//  Created by AMJAD - on 4 جما٢، 1440 هـ.
//  Copyright © 1440 هـ aa. All rights reserved.
//

import UIKit

class DeliveryPageVC : UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    @IBOutlet weak var DeliveryTableView: UITableView!
    
    var donation = Donations()
    var user = Users()
    var view1 = UIView()
    //var needyList = [NeedyOrders()]
    var UserList = [Users()]
    var donationList = [Donations()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        InitializeSpinner()
        startLoding()
        getJsonFromUrl()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        print("count return : \(donationList.count)")
        stopLoding()
        
        return self.donationList.count
        
    
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = self.DeliveryTableView.dequeueReusableCell(withIdentifier: "DeliveryCell", for: indexPath) as! DeliveryTableViewCell
        
        
        var donation : Donations = self.donationList[indexPath.row]
         var user : Users = self.UserList[indexPath.row]
        
        
        print("donation.name : \(donation.name)")
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy'-'MM'-'dd'/'HH':'mm"

//        cell.UploadDate.text = (dateFormatter.date(from: "donation.DateOfUpload" ))?.description
        
                cell.DonationName.text = self.donation.name
                cell.NeedyName.text = self.user.Fname + " " + self.user.Lname
                cell.Email.text = self.user.email
                cell.City.text = self.user.city
                cell.DonationImage.image = base64Convert(base64String: donation.image)

        
        let separatorLine = UIImageView.init(frame: CGRect(x: 4, y: 0, width: cell.frame.width - 8, height: 2))
        separatorLine.backgroundColor = UIColor.init(red: 255/255, green: 255/255, blue: 250/255, alpha: 100)
        cell.addSubview(separatorLine)
        
        return cell
        
    }
 
    
    func getJsonFromUrl(){
        print("##getJsonFromUrl open")
        print("##performPostRequest open")
        
        let url = URL(string: "http://amjadsufyani-001-site1.itempurl.com/api/values/DeliverPage" )!
        
        //+UserInfo.userId.description)! // Enter URL Here
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            print("##URLSession open")
            do {
                if let data = data,
                    let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
                    let blogs = json["result"] as? [[String: Any]] {
                    //                    print("##URLSession blogs ")
                    self.donationList.removeAll()
                    for blog in blogs {
                        self.donation=Donations()
                        self.donation = self.donation.getDonationsData(dataJson: blog)
                        
                        if let userList = blog["user"] as? [String: Any] {
//                            print("##blogsUser = \(userList)")
//                            print("##blogsUser = \(userList)")
                            self.user = self.user.getUsersData(dataJson: userList)
                            
                        }
                        print("##donationId = \(self.donation.DonationId)")
                        print("##name = \(self.donation.name)")
                        print("##OrderStatus = \(self.donation.OrderStatus)")
                        print("##user Fname = \(self.user.Fname)")
                        print("##user mail = \(self.user.email)")
                        print("##user city = \(self.user.city)")
                        
                        self.UserList.append(self.user)
                        self.donationList.append(self.donation)
                        
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
           
            self.DeliveryTableView.dataSource=self
            self.DeliveryTableView.reloadData()
            
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
