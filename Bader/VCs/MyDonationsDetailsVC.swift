//
//  MyDonationsDetailsVC.swift
//  Bader
//
//  Created by AMJAD - on 29 جما١، 1440 هـ.
//  Copyright © 1440 هـ aa. All rights reserved.
//


import UIKit

class MyDonationsDetailsVC: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    @IBOutlet weak var donationName: UILabel!
    @IBOutlet weak var donationImage: UIImageView!
    @IBOutlet weak var donationDatetime: UILabel!
    @IBOutlet weak var TableViewNeedyOrder: UITableView!
    
    
    
    var donation = Donations()
    var user = Users()
    var needyOrder = NeedyOrders()
    var view1 = UIView()
    var donationId = 0
    var needyList = [NeedyOrders()]
    var UserList = [Users()]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy'-'MM'-'dd'/'HH':'mm"
        
        donationName.text = donation.name
        donationImage.image = self.base64Convert(base64String: self.donation.image)
        donationDatetime.text = (dateFormatter.date(from: donation.DateOfUpload.description ))?.description
        getJsonFromUrl()
        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        print("count return : \(needyList.count)")
        stopLoding()
        if UserList.count == 0 {
            self.user = Users()
            user.Fname = "لا يوجد متقدمين حاليا"
            UserList.append(user)
        }
        return self.UserList.count
        //                return 10
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = self.TableViewNeedyOrder.dequeueReusableCell(withIdentifier: "CellMyDonData", for: indexPath) as! ListNeedyCell
        
        var userCell : Users = self.UserList[indexPath.row]
        var needyCell : NeedyOrders = self.needyList[indexPath.row]
        
        var acceptStets : Bool = false
        
        if needyCell.OrderUser_status == 1
        {
            acceptStets = true
        }else{acceptStets = false}
        
        cell.NeedyNames.text = userCell.Fname + " " + userCell.Lname
        cell.NeedyEmail.text = userCell.email
        cell.NeedyAcceptButton.isHidden = !acceptStets
        cell.NeedyStets.isHidden = acceptStets
        cell.NeedyStets.text = (needyCell.OrderUser_status == 2) ? "تم القبول" : "تم الرفض"
        
        cell.NeedyAcceptButton.tag = indexPath.row
        cell.NeedyAcceptButton.addTarget(self, action: #selector(AcceptNeedy) , for: .touchUpInside)

        let separatorLine = UIImageView.init(frame: CGRect(x: 4, y: 0, width: cell.frame.width - 8, height: 2))
        separatorLine.backgroundColor = UIColor.init(red: 255/255, green: 255/255, blue: 250/255, alpha: 100)
        cell.addSubview(separatorLine)
        
        return cell
        
    }
    
    @IBAction func AcceptNeedy(_ sender: UIButton) {
        print("##AcceptNeedy start")
        needyOrder = NeedyOrders()
        let text : Int = Int((sender ).tag)
        needyOrder = needyList[text]
        print("##AcceptNeedy Button :\(needyOrder.id)")
        UpdateUserStatus()
    }
    
    func UpdateUserStatus () {
        print("##getJsonFromUrl open")
        print("##performPostRequest open")

        let url = URL(string: "http://amjadsufyani-001-site1.itempurl.com/api/values/updateWhenAccepteOne?User_Id=" + needyOrder.id.description + "Donation_id=" + donationId.description)! // Enter URL Here
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            print("##URLSession open")
        do {
            if let data = data,
                let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
                let blogs = json["result"] as? [String: Any] {
                print("##blog = \(blogs.count)")
                var check = blogs ;
            }
        } catch {
            print("##Error deserializing JSON: \(error)")
        }
        self.showNames()
        
    }
    task.resume()
}

    
    func getJsonFromUrl(){
        print("##getJsonFromUrl open")
        print("##performPostRequest open")
        
        let url = URL(string: "http://amjadsufyani-001-site1.itempurl.com/api/values/getNeedyNames?Donation_id=13")! // Enter URL Here
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            print("##URLSession open")
            do {
                if let data = data,
                    let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
                    let blogs = json["result"] as? [[String: Any]] {
                    //                    print("##URLSession blogs ")
                    self.needyList.removeAll()
                    self.UserList.removeAll()
                    
                    for blog in blogs {
                        self.donation=Donations()
                        self.donation = self.donation.getDonationsData(dataJson: blog)
                        
                        if let userList = blog["user"] as? [String: Any] {
                            self.user = Users()
                            print("##blogsUser = \(userList)")
                            self.user = self.user.getUsersData(dataJson: userList)
                            self.UserList.append(self.user)
                        }
                            
                            
                            if let needyList = blog["needy"] as? [String: Any] {
                                self.needyOrder = NeedyOrders()
                                print("##blogsUser = \(needyList)")
                                self.needyOrder = self.needyOrder.getOrdersData(dataJson: needyList)
                            
                                self.needyList.append(self.needyOrder)
                        }
                            
                        print("##donationId = \(self.donation.DonationId)")
                        print("##name = \(self.donation.name)")
                        print("##OrderStatus = \(self.donation.OrderStatus)")
                        print("##description = \(self.donation.description)")
                            print("##OrderUser_status = \(self.needyOrder.OrderUser_status)")

                        print("##OrderUser_userId = \(self.needyOrder.User_id)")

                        
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
            
            self.TableViewNeedyOrder.dataSource=self
            self.TableViewNeedyOrder.reloadData()
 
            
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

