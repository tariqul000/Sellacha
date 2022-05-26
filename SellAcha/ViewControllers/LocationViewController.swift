//
//  LocationViewController.swift
//  SellAcha
//
//  Created by VinodKatta on 28/04/22.
//

import UIKit

class LocationViewController: UIViewController {
    var selectedRows = [IndexPath]()
    
    let array = ["Name","Sontosh Nagar","Abids","Hyderabad","Koti","Malakpet"]

    @IBOutlet weak var locationTB: UITableView!
    
    @IBOutlet weak var locationProfileImage: UIImageView!
    @IBOutlet weak var locationView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        
        locationProfileImage.makeRounded()
        
//        locationProfileImage?.contentMode = UIView.ContentMode.scaleAspectFit
//        locationProfileImage.frame.size.width = 50
//        locationProfileImage.frame.size.height = 50
//       // locationProfileImage.center = self.view.center
//        locationProfileImage.layer.cornerRadius = 10
//        locationProfileImage.clipsToBounds = true
        //locationProfileImage.layer.borderWidth = 5
        //locationProfileImage.layer.borderColor = UIColor.systemBlue.cgColor
        //ProfileimageView.image = catImage
        
    
        locationView.clipsToBounds = true
        locationView.layer.cornerRadius = 40
        locationView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
    
    @IBAction func backbtn(_ sender: Any) {
        self.homescreen()
    }
    
    @objc func homescreen(){
        let vc = self.storyboard?.instantiateViewController(identifier: "SWRevealViewController") as! SWRevealViewController
        self.present(vc, animated: true, completion: nil)
    }

    

    

}


extension LocationViewController: UITableViewDelegate,UITableViewDataSource {
    
    
       func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return array.count
       }
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           
           let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! LocationTableViewcell
           
           cell.locatonLBL.text = array[indexPath.row]
           
           return cell
       }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if locationTB.cellForRow(at: indexPath)?.accessoryType == .checkmark{
            locationTB.cellForRow(at: indexPath)?.accessoryType = .none
        }
        else{
            locationTB.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
    }
    
}

extension LocationViewController: UITextFieldDelegate{
    
    
}


