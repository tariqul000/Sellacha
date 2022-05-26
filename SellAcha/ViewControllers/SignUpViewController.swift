//
//  SignUpViewController.swift
//  SellAcha
//
//  Created by VinodKatta on 28/04/22.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var SignupImage: UIImageView!
    @IBOutlet weak var signupView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        
        SignupImage.makeRounded()
        
//        SignupImage?.contentMode = UIView.ContentMode.scaleAspectFit
//        SignupImage.frame.size.width = 200
//        SignupImage.frame.size.height = 200
//       // SignupImage.center = self.view.center
//        SignupImage.layer.cornerRadius = 50
//        SignupImage.clipsToBounds = true
//        SignupImage.layer.borderWidth = 5
//        SignupImage.layer.borderColor = UIColor.systemBlue.cgColor
       //ProfileimageView.image = catImage
        
    
        signupView.clipsToBounds = true
        signupView.layer.cornerRadius = 50
        signupView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]

        
    }
    

    

}
