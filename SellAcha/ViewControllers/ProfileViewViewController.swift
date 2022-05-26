//
//  ProfileViewViewController.swift
//  SellAcha
//
//  Created by VinodKatta on 29/04/22.
//

import UIKit

class ProfileViewViewController: UIViewController {
    
    
    @IBOutlet weak var barBTN: UIBarButtonItem!{
        didSet{
            barBTN.target = self.revealViewController()
            barBTN.action = #selector(SWRevealViewController.revealToggle(_:))
        }
    }
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var profileBackView: UIView!
  
    
    
    @IBOutlet weak var profileTB: UITableView!
    
    
    let profileArray = ["User Details","Profile Setting","Change Password","Logout"]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        
        profileImageView.makeRounded()
       
        
        
        profileBackView.clipsToBounds = true
        profileBackView.layer.cornerRadius = 50
        profileBackView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]

        
    }
    
    @IBAction func backbtn(_ sender: Any) {
        self.homescreen()
    }
    
    @objc func homescreen(){
        let vc = self.storyboard?.instantiateViewController(identifier: "SWRevealViewController") as! SWRevealViewController
        self.present(vc, animated: true, completion: nil)
    }
    
    
    
    

    

}


extension ProfileViewViewController: UITableViewDelegate,UITableViewDataSource
{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? ProfileTableCell
        cell?.ProfileMenuLbl.text = profileArray[indexPath.row]
       // cell?.ProfileImgView.image = []
        return cell!
    }
    
    
    
}
class ProfileTableCell : UITableViewCell
{
    
    @IBOutlet weak var ProfileImgView: UIImageView!
    @IBOutlet weak var ProfileMenuLbl: UILabel!
    
}
