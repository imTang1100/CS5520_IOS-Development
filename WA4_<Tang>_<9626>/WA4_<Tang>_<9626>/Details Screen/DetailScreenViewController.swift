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
        addDetailScreen.name.text = contact.name
        addDetailScreen.email.text = contact.email
        addDetailScreen.phone.text = "\(String(describing: contact.phoneNumber)) + (\(String(describing: contact.phoneType)))"
        
        addDetailScreen.address.text = contact.address
        addDetailScreen.cityState.text = contact.cityState
        addDetailScreen.zip.text = contact.zipCode
    
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
