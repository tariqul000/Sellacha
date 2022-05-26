//
//  CustomersViewController.swift
//  SellAcha
//
//  Created by VinodKatta on 04/05/22.
//

import UIKit

class CustomersViewController: UIViewController {
    @IBOutlet weak var custmBackView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        
        custmBackView.clipsToBounds = true
        custmBackView.layer.cornerRadius = 20
        custmBackView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backbtn(_ sender: Any) {
        self.homescreen()
    }
    
    @objc func homescreen(){
        let vc = self.storyboard?.instantiateViewController(identifier: "SWRevealViewController") as! SWRevealViewController
        self.present(vc, animated: true, completion: nil)
    }

}
