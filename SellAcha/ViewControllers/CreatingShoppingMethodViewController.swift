//
//  CreatingShoppingMethodViewController.swift
//  SellAcha
//
//  Created by VinodKatta on 29/04/22.
//

import UIKit

class CreatingShoppingMethodViewController: UIViewController {

    @IBOutlet weak var titleTF: UITextField!
    @IBOutlet weak var priceTF: UITextField!
    @IBOutlet weak var locationTF: UITextField!
    
    @IBOutlet weak var createShoppingMethod: UIImageView!
    @IBOutlet weak var crShoppingMeView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        createShoppingMethod.makeRounded()
        
        
        titleTF.addBottomBorder()
        priceTF.addBottomBorder()
        locationTF.addBottomBorder()
        
        crShoppingMeView.clipsToBounds = true
        crShoppingMeView.layer.cornerRadius = 40
        crShoppingMeView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
    

    @IBAction func backbtn(_ sender: Any) {
        self.homescreen()
    }
    
    @objc func homescreen(){
        let vc = self.storyboard?.instantiateViewController(identifier: "SWRevealViewController") as! SWRevealViewController
        self.present(vc, animated: true, completion: nil)
    }


}
