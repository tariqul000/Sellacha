//
//  ShippingViewController.swift
//  SellAcha
//
//  Created by VinodKatta on 29/04/22.
//

import UIKit

class ShippingViewController: UIViewController {
    
    @IBOutlet weak var shippingTB: UITableView!
    @IBOutlet weak var shippingViewBack: UIView!
    @IBOutlet weak var createLoactionimage: UIImageView!
    let locationheader = ["Free","FreeShiping","Free","Speed Post","Speed"]
    let price = ["0","10","20","10","10"]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        
        createLoactionimage.makeRounded()
        
        shippingViewBack.clipsToBounds = true
        shippingViewBack.layer.cornerRadius = 40
        shippingViewBack.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]

        
    }
    
    @IBAction func backbtn(_ sender: Any) {
        self.homescreen()
    }
    
    @objc func homescreen(){
        let vc = self.storyboard?.instantiateViewController(identifier: "SWRevealViewController") as! SWRevealViewController
        self.present(vc, animated: true, completion: nil)
    }


    

}


extension ShippingViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locationheader.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! shippingcell
        
        cell.shippingLbl.text = locationheader[indexPath.row]
        cell.ShippingPriceLbl.text = price[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
                headerView.backgroundColor = .lightGray
                let label = UILabel()
                label.frame = CGRect.init(x: 10, y: 5, width: headerView.frame.width-10, height: headerView.frame.height-10)
                label.text = "NAME"
                label.font = .systemFont(ofSize: 16)
                label.textColor = .black
        
                let label2 = UILabel()
                label2.frame = CGRect.init(x: 310, y: 5, width: headerView.frame.width-10, height: headerView.frame.height-10)
                label2.text = "PRICE"
                label2.font = .systemFont(ofSize: 16)
                label2.textColor = .black
        
        
        
        

                headerView.addSubview(label)
                headerView.addSubview(label2)
                
                return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 50
        }
    
   
    
    
}

class shippingcell:UITableViewCell{
    
    @IBOutlet weak var ShippingPriceLbl: UILabel!
    
    @IBOutlet weak var shippingLbl: UILabel!
    
    
}
