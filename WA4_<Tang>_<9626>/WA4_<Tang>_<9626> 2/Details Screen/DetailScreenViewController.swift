//
//  DetailScreenViewController.swift
//  WA4_<Tang>_<9626>
//
//  Created by evan tang on 10/5/24.
//

import UIKit

class DetailScreenViewController: UIViewController {
    
    var delegate: ViewController!

    var contact: Contact!
    let addDetailScreen = DetailScreenView()
    
    override func loadView() {
        view = addDetailScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addDetailScreen.name.text = contact.name ?? "No Name"
        addDetailScreen.email.text = contact.email ?? "No Email"
        
        // Handle phoneNumber and phoneType with default values if they are nil
        addDetailScreen.phone.text = "\(contact.phoneNumber ?? "Unknown") (\(contact.phoneType ?? "Unknown"))"
        
        addDetailScreen.address.text = contact.address ?? "No Address"
        addDetailScreen.cityState.text = contact.cityState ?? "No City/State"
        addDetailScreen.zip.text = contact.zipCode != nil ? "\(contact.zipCode!)" : "No Zip Code"
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
