//
//  SideViewController.swift
//  SellAcha
//
//  Created by VinodKatta on 04/05/22.
//

import UIKit

class SideViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    let sidenames = ["Home","Profile","Orders","Products","Customers","Transactions","Reports","Review & rating","Shipping","Location","Shipping Price","Offers & Ads","Settings","Marketing Tools"]

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sidenames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! sideTablcell
        cell.sideLBL.text = sidenames[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if(indexPath.row == 0){
            
            print("0")
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "SWRevealViewController") as! SWRevealViewController
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
         }
        if indexPath.row == 1{
            self.performSegue(withIdentifier: "profile", sender: self)
        }
        
        if indexPath.row == 2{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "TransactionsViewController") as! TransactionsViewController
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }
        
        if indexPath.row == 3{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ProductsViewController") as! ProductsViewController
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }
        if indexPath.row == 4{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "CustomersViewController") as! CustomersViewController
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }
        
        if indexPath.row == 5{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "TransactionsViewController") as! TransactionsViewController
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }
        
        if indexPath.row == 6{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ProfileViewViewController") as! ProfileViewViewController
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }
        
        if indexPath.row == 7{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ProfileViewViewController") as! ProfileViewViewController
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }
        
        if indexPath.row == 8{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ShippingViewController") as! ShippingViewController
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }
        
        if indexPath.row == 9{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "LocationViewController") as! LocationViewController
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }
        
        if indexPath.row == 10{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ShippingViewController") as! ShippingViewController
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }
        
        if indexPath.row == 11{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ProfileViewViewController") as! ProfileViewViewController
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }
        
        if indexPath.row == 12{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ProfileViewViewController") as! ProfileViewViewController
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }
        
        if indexPath.row == 13{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ProfileViewViewController") as! ProfileViewViewController
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }
        

  }
}

class sideTablcell : UITableViewCell{
    
    @IBOutlet weak var sideLBL: UILabel!
    
}


