//
//  LoginVC.swift
//  Bader
//
//  Created by AMJAD - on 18 جما١، 1440 هـ.
//  Copyright © 1440 هـ aa. All rights reserved.
//

import UIKit
import Foundation

class LoginVC : UIViewController
{
    @IBOutlet weak var email: XTextField!
    @IBOutlet weak var password: XTextField!
    
    @IBAction func Login(_ sender: Any) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    @IBOutlet weak var ButtonLayout: NSLayoutConstraint!
    override func viewDidLoad() {
        SettingUpKeyboardNotification()
        
        
    }
    
}

extension LoginVC {
    
    func SettingUpKeyboardNotification(){
        
        NotificationCenter.default.addObserver(self, selector: #selector(KeyboardDidShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(KeyboardDidHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        
    }
    
    
    @objc func KeyboardDidShow (notification : NSNotification) {
        // ارتفاع الكيبورد، نجلب الحجم للحصول ع الارتفاع
        if let KeyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            UIView.animate(withDuration: 0.3) {
                self.ButtonLayout.constant = KeyboardSize.height + 30
                self.view.layoutIfNeeded()
            }
        }
    }
    
    @objc func KeyboardDidHide(notification : NSNotification) {
        UIView.animate(withDuration: 0.3) {
            self.ButtonLayout.constant = 210
            self.view.layoutIfNeeded() //يعني قم باعادة عملية ال لاي اوت في داخل الفيو
        }
    
}
}
