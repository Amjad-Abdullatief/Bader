//
//  AddDonationVC.swift
//  Bader
//
//  Created by Itc on 05/02/2019.
//  Copyright © 2019 aa. All rights reserved.
//

import UIKit

class AddDonationVC: UIViewController , UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var myImageView: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func importImage(_ sender: AnyObject)
    {
        let image = UIImagePickerController()
        image.delegate = self
        
        image.sourceType = UIImagePickerController.SourceType.photoLibrary
        
        image.allowsEditing = false
        
        self.present(image, animated: true)
        {
            //After it is complete
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
        if let image = info[.originalImage] as? UIImage
        {
            myImageView.isHidden = false
            myImageView.image = image
        }
        else
        {
            //Error message
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
//    func convertImageToBase64(image: UIImage) -> String {
//        let imageData = UIImagePNGRepresentation(image)!
//        return imageData.base64EncodedString(options: Data.Base64EncodingOptions.lineLength64Characters)
//    }
    
    
}
