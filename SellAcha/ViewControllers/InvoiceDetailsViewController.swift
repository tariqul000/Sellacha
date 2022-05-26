//
//  InvoiceDetailsViewController.swift
//  SellAcha
//
//  Created by VinodKatta on 30/04/22.
//

import UIKit

class InvoiceDetailsViewController: UIViewController {

    @IBOutlet weak var invoiceTB: UITableView!
    
    @IBOutlet weak var invoiceView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        
        invoiceView.clipsToBounds = true
        invoiceView.layer.cornerRadius = 20
        invoiceView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
    }
    
    @IBAction func backbtn(_ sender: Any) {
        self.homescreen()
    }
    
    @objc func homescreen(){
        let vc = self.storyboard?.instantiateViewController(identifier: "SWRevealViewController") as! SWRevealViewController
        self.present(vc, animated: true, completion: nil)
    }

    

    

}
extension InvoiceDetailsViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: "cell") as! invoiceCell)
        return cell
    }
    
    
    
    
}

class invoiceCell:UITableViewCell{
    
}


