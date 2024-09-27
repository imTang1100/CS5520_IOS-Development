//
//  DisplayViewController.swift
//  WA3_<Tang>_<9626>
//
//  Created by evan tang on 9/24/24.
//

import UIKit

class ShowProfileController: UIViewController {
    
    //MARK: creating instance
    let showProfile = ShowProfileView()
    
    
    //MARK: patch the view of the controller
    override func loadView(){
        view = showProfile
    }
    
    //MARK: message and mood from the first screen...
    var receivedPackage: ViewController.Package = ViewController.Package() // The first screen can set this variable...

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setting the Label's texts
        if let unwrapperMessage = receivedPackage.name{
            if !unwrapperMessage.isEmpty{
                showProfile.userName.text = "Name: \(unwrapperMessage)"
            }
        }
        
        if let unwrapperEmail = receivedPackage.email{
            if !unwrapperEmail.isEmpty{
                showProfile.userEmail.text = "Email: \(unwrapperEmail)"
            }
        }
        
        if let unwrapperPhone = receivedPackage.phone, let unwrappeType = receivedPackage.type{
            if unwrapperPhone != 0 && !unwrappeType.isEmpty{
                showProfile.userPhone.text = "Phone: \(unwrapperPhone) + (\(unwrappeType))"
            }
        }
        
        if let unwrapperAddress = receivedPackage.address{
            if !unwrapperAddress.isEmpty{
                showProfile.userAddress.text = "Address: \(unwrapperAddress)"
            }
        }
        
        if let unwrapperCity = receivedPackage.city{
            if !unwrapperCity.isEmpty{
                showProfile.userCity.text = "\(unwrapperCity)"
            }
        }
        
        if let unwrapperZIP = receivedPackage.zip{
            if unwrapperZIP != 0 {
                showProfile.userZIP.text = "\(unwrapperZIP)"
            }
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
