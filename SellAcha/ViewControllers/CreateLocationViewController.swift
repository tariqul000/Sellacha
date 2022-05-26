//
//  CreateLocationViewController.swift
//  SellAcha
//
//  Created by VinodKatta on 28/04/22.
//

import UIKit

class CreateLocationViewController: UIViewController {
    @IBOutlet weak var crateLoactionImage: UIImageView!
    @IBOutlet weak var CreationLlView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)

        
        crateLoactionImage.makeRounded()
        CreationLlView.clipsToBounds = true
        CreationLlView.layer.cornerRadius = 30
        CreationLlView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
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
