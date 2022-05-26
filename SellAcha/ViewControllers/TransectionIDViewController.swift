//
//  TransectionIDViewController.swift
//  SellAcha
//
//  Created by VinodKatta on 05/05/22.
//

import UIKit

class TransectionIDViewController: UIViewController {

    @IBOutlet weak var tranimageview: UIImageView!
    
    @IBOutlet weak var transactionBackView: UIView!
    
   
    
   

//    @IBOutlet weak var TransactionsView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tranimageview.makeRounded()
        transactionBackView.clipsToBounds = true
        transactionBackView.layer.cornerRadius = 20
        transactionBackView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
    }
    
    

    
    @IBAction func backbtn(_ sender: Any) {
        self.homescreen()
    }
    
    @objc func homescreen(){
        let vc = self.storyboard?.instantiateViewController(identifier: "SWRevealViewController") as! SWRevealViewController
        self.present(vc, animated: true, completion: nil)
    }
    

   

}
