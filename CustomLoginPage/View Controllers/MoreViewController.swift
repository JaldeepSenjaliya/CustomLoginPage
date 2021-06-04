//
//  MoreViewController.swift
//  CustomLoginPage
//
//  Created by Jaldeep Patel on 2021-05-22.
//

import UIKit
import Firebase

class MoreViewController: UIViewController {

    @IBOutlet var moreOptionsTableView: UITableView!
    
    let menuOptions = ["Activity History", "How to Use App", "About Program", "Frequently Asked Questions", "Join Facebook Community", "Privacy Policy", "Order Books", "About Authors", "Connect To Us", "Log Out"]
    
    let menuImages = ["activityHistory", "howToUseApp", "aboutProgram", "FAQs", "joinFacebookCommunity", "privacyPolicy", "orderBooks", "aboutAuthors", "connectToUs", "logOut"]
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        moreOptionsTableView.dataSource = self
        moreOptionsTableView.delegate = self

    }
}

extension MoreViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuOptions.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifiers.moreOptions, for: indexPath) as! moreOptionsTableViewCell
        
        cell.optionsLabel?.text = menuOptions[indexPath.row]
        cell.moreOptionsImageView.image = UIImage(named: menuImages[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch menuImages[indexPath.row] {
        
        case "activityHistory":
            performSegue(withIdentifier: "activityHistory", sender: self)
        
        case "howToUseApp":
            performSegue(withIdentifier: "howToUseApp", sender: self)
            
        case "aboutProgram":
            performSegue(withIdentifier: "aboutProgram", sender: self)
            
        case "FAQs":
            performSegue(withIdentifier: "FAQs", sender: self)
            
        case "joinFacebookCommunity":
            UIApplication.shared.open(URL(string: "https://www.facebook.com")!, options: [:], completionHandler: nil)
            
        case "privacyPolicy":
            performSegue(withIdentifier: "privacyPolicy", sender: self)
            
        case "orderBooks":
            performSegue(withIdentifier: "orderBooks", sender: self)
            
        case "aboutAuthors":
            performSegue(withIdentifier: "aboutAuthors", sender: self)
            
        case "connectToUs":
            performSegue(withIdentifier: "connectToUs", sender: self)
            
        case "logOut":

            let auth = Auth.auth()

            do {

                //Try signingout and redirect to login screen
                try auth.signOut()
                
                let loginViewController = self.storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.loginViewController) as! LoginViewController
                
                self.view.window?.rootViewController = loginViewController
                self.view.window?.makeKeyAndVisible()

                //If there is an error, catch the error and show alert
            } catch let signOutError {

                self.present(Utilities.showAlert(title: "Error!", message: signOutError.localizedDescription), animated: true, completion: nil)
            }
       
        default:
            print("There's a problem in finding next ViewController.")
        }
    }
}
