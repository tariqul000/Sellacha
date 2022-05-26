//
//  ProductsViewController.swift
//  SellAcha
//
//  Created by VinodKatta on 04/05/22.
//

import UIKit

class ProductsViewController: UIViewController {
    @IBOutlet weak var ProductViewBack: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        
        ProductViewBack.clipsToBounds = true
        ProductViewBack.layer.cornerRadius = 20
        ProductViewBack.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]

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
