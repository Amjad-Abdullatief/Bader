//
//  SignUpVC.swift
//  Bader
//
//  Created by AMJAD - on 18 جما١، 1440 هـ.
//  Copyright © 1440 هـ aa. All rights reserved.
//

import UIKit


class SignupVC : UIViewController 
{
    @IBOutlet weak var Fname: XTextField!
    @IBOutlet weak var Lname: XTextField!
    @IBOutlet weak var city: XTextField!
    @IBOutlet weak var email: XTextField!
    @IBOutlet weak var Password: XTextField!
    @IBOutlet weak var ConfirmPassword: XTextField!
    @IBOutlet weak var labelMassage: UILabel!
    
    @IBAction func SignUp(_ sender: Any) {
        
        labelMassage.isHidden=false
        
        if ( Fname.text != "" && Lname.text != "" && city.text != "" && email.text != "" && Password.text != "" && ConfirmPassword.text != "" ) {
            
            if (Password.text == ConfirmPassword.text){
                getJsonFromUrl()
                
                } else {
                labelMassage.text="كلمة السر غير مطابقة"
                labelMassage.isHidden=true
            }
            
        } else {
            labelMassage.text="يرجى تعبئة الحقول المطلوبة"
            labelMassage.isHidden=true
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
   
    
    @IBOutlet weak var ButtonLayoutS: NSLayoutConstraint!
    override func viewDidLoad() {
        SettingUpKeyboardNotification()
    }
    
}

extension SignupVC {
    
    func SettingUpKeyboardNotification(){
        
        NotificationCenter.default.addObserver(self, selector: #selector(KeyboardDidShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(KeyboardDidHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        
    }
    
    
    @objc func KeyboardDidShow (notification : NSNotification) {
        // ارتفاع الكيبورد، نجلب الحجم للحصول ع الارتفاع
        if let KeyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            UIView.animate(withDuration: 0.3) {
                self.ButtonLayoutS.constant = KeyboardSize.height + 30
                self.view.layoutIfNeeded()
            }
        }
    }
    
    @objc func KeyboardDidHide(notification : NSNotification) {
        UIView.animate(withDuration: 0.3) {
            self.ButtonLayoutS.constant = 311
            self.view.layoutIfNeeded() //يعني قم باعادة عملية ال لاي اوت في داخل الفيو
        }
        
    }
    

        
    
    func getJsonFromUrl(){
        print("##getJsonFromUrl open")
        print("##performPostRequest open")
        
        var userfname = (Fname.text)! as String
        var userLname = (Lname.text)! as String
        var useremail = (email.text)! as String
        var userPassword = (Password.text)! as String
        var usercity = (city.text)! as String
        
        let linkString = "http://amjadsufyani-001-site1.itempurl.com/api/values/getsign?"
        var linkParameter = "Fname=\(userfname)&Lname=\(userLname)&email=\(useremail)&password=\(userPassword)&type=1&city=\(usercity)".addingPercentEncoding(withAllowedCharacters:CharacterSet.urlQueryAllowed)!
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

