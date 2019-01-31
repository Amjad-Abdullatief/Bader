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

    @IBAction func SignUp(_ sender: Any) {
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
    

        
    
}

