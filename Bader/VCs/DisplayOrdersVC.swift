//
//  DisplayOrdersVC.swift
//  Bader
//
//  Created by AMJAD - on 2 جما٢، 1440 هـ.
//  Copyright © 1440 هـ aa. All rights reserved.
//

import UIKit

class DisplayOrdersVC : UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    
    
    @IBOutlet weak var TableViewData: UITableView!
    
    var orderList = [Orders()]
    var view1 = UIView()
    var type=0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        InitializeSpinner()
        startLoding()
        getJsonFromUrl()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        print("count return : \(orderList.count)")
        stopLoding()
        
        return self.orderList.count
        //                return 10
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = self.TableViewData.dequeueReusableCell(withIdentifier: "cellData", for: indexPath) as! DisplayOrdersCell
        
        
        
        
        
        //        cell.backgroundColor = .clear
        
        
        
        var order : Orders = self.orderList[indexPath.row]
        
        
        print("order.name : \(order.Name_of_Needy)")
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy'-'MM'-'dd'/'HH':'mm"
        
        cell.Name.text = order.Name_of_Needy
        cell.OrderOfNeedy.text = order.Order_the_Needy
        cell.Address.text = order.Address
        cell.ContactWay.text = order.Contact_Way
        cell.DateOfUpload.text = (dateFormatter.date(from: "order.Date_of_Add" ))?.description
        
        
        let separatorLine = UIImageView.init(frame: CGRect(x: 4, y: 0, width: cell.frame.width - 8, height: 2))
        separatorLine.backgroundColor = UIColor.init(red: 255/255, green: 255/255, blue: 250/255, alpha: 100)
        cell.addSubview(separatorLine)
        
        return cell
        
    }
    
 
    
    
    func getJsonFromUrl(){
        print("##getJsonFromUrl open")
        print("##performPostRequest open")
        
        let url = URL(string: "http://amjadsufyani-001-site1.itempurl.com/api/values/getAllOrders")!
        
        //+UserInfo.userId.description)! // Enter URL Here
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            print("##URLSession open")
            do {
                if let data = data,
                    let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
                    let blogs = json["result"] as? [[String: Any]] {
                    //                    print("##URLSession blogs ")
                    self.orderList.removeAll()
                    for blog in blogs {
                        var orders=Orders()
                        orders = orders.getOrdersData(dataJson: blog)
                        //                        if let name = blog["Name"] as? String {print("##Name : \(name)")}
                        
                        print("##OrderId = \(orders.OrderId)")
                        print("##Name_of_Needy = \(orders.Name_of_Needy)")
                        print("##Order_the_Needy = \(orders.Order_the_Needy)")
                        print("##Address = \(orders.Address)")
                        print("##Date Contact_Way Upload = \(orders.Contact_Way)")
                        print("##Date_of_Add = \(orders.Date_of_Add)")
                        
                        
                        self.orderList.append(orders)
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
            
            self.TableViewData.dataSource=self
            self.TableViewData.reloadData()
            
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


