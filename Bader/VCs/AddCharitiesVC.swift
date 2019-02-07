//
//  AddCharitiesVC.swift
//  Bader
//
//  Created by AMJAD - on 2 جما٢، 1440 هـ.
//  Copyright © 1440 هـ aa. All rights reserved.
//


import UIKit


class AddCharitiesVC : UIViewController
{
    @IBOutlet weak var Name: UITextField!
    @IBOutlet weak var Address: UITextField!
    @IBOutlet weak var City: UITextField!
    @IBOutlet weak var Phone: UITextField!
    @IBOutlet weak var HouresAM: UITextField!
    @IBOutlet weak var HoyrsPM: UITextField!
    @IBOutlet weak var Friday: UITextField!
    @IBOutlet weak var Saturday: UITextField!
    @IBOutlet weak var CoordinateX: UITextField!
    @IBOutlet weak var CoordinateY: UITextField!
    
    @IBAction func Add(_ sender: Any) {
        getJsonFromUrl()
        
        //        labelMassage.isHidden=false
        //
        //        if ( NeedyName.text == "" || Orders.text == "" || Address.text == "" || ContactWay.text == ""  ) {
        //
        //            labelMassage.text="يرجى تعبئة الحقول المطلوبة"
        //            labelMassage.isHidden=true
        //       } else {
        //             getJsonFromUrl()
        //        }
        //
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
//    @IBOutlet weak var ButtonLayoutS: NSLayoutConstraint!
//    override func viewDidLoad() {
//        SettingUpKeyboardNotification()
//    }
//
//}
//
//extension AddNeedyVC {
//
//    func SettingUpKeyboardNotification(){
//
//        NotificationCenter.default.addObserver(self, selector: #selector(KeyboardDidShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
//
//        NotificationCenter.default.addObserver(self, selector: #selector(KeyboardDidHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
//
//    }
//    @objc func KeyboardDidShow (notification : NSNotification) {
//        // ارتفاع الكيبورد، نجلب الحجم للحصول ع الارتفاع
//        if let KeyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
//            UIView.animate(withDuration: 0.3) {
//                self.ButtonLayoutS.constant = KeyboardSize.height + 30
//                self.view.layoutIfNeeded()
//            }
//        }
//    }
//
//    @objc func KeyboardDidHide(notification : NSNotification) {
//        UIView.animate(withDuration: 0.3) {
//            self.ButtonLayoutS.constant = 311
//            self.view.layoutIfNeeded() //يعني قم باعادة عملية ال لاي اوت في داخل الفيو
//        }
//
//    }
    
    
    
    
    func getJsonFromUrl(){
        print("##getJsonFromUrl open")
        print("##performPostRequest open")
        
        var name = (Name.text)! as String
        var address = (Address.text)! as String
        var city = (City.text)! as String
        var phone = (Phone.text)! as String
        var AM = (HouresAM.text)! as String
        var PM = (HoyrsPM.text)! as String
        var friday = (Friday.text)! as String
        var saturday = (Saturday.text)! as String
        var Coordinate_X = (CoordinateX.text)! as String
        var Coordinate_Y = (CoordinateY.text)! as String
        
        
        let linkString = "http://amjadsufyani-001-site1.itempurl.com/api/values/AddCharities?"
        var linkParameter = "Name=\(name)&Address=\(address)&Phone=\(phone)&City=\(city)&Type=\(Name)&Coordinate_X=\(Coordinate_X)&Coordinate_Y=\(Coordinate_Y)&hours_AM=\(AM)&hours_PM=\(PM)&hours_Saturday=\(saturday)&hours_Friday=\(friday)".addingPercentEncoding(withAllowedCharacters:CharacterSet.urlQueryAllowed)!
        let url = URL(string: (linkString+linkParameter) )! // Enter URL Here
        
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            print("##URLSession open")
            do {
                //                if let data = data,
                //                    let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
                //                    let blogs = json["result"] as? [[String: Any]] {
                //                    //                    print("##URLSession blogs ")
                //
                //                    for blog in blogs {
                //
                //
                //                    }
                //                }
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
            
            //            self.donationName.text = self.donation.name
            //            self.donationUserName.text = self.user.Fname + self.user.Lname
            //            self.donationUserEmail.text = self.user.email
            //            self.donationImage.image = self.base64Convert(base64String: self.donation.image)
            //            self.donationDesc.text = self.donation.description
            
        }
    }
}



