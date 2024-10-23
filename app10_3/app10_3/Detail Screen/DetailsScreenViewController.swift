//
//  DetailsScreenViewController.swift
//  app10_3
//
//  Created by evan tang on 10/20/24.
//

import UIKit

class DetailsScreenViewController: UIViewController {
    var contact: Contact!
    let addDetailScreen = DetailsScreenView()
    
    let notificationCenter = NotificationCenter.default
    
    override func loadView() {
        view = addDetailScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addDetailScreen.name.text = contact.name
        addDetailScreen.email.text = contact.email
        
        // Handle phoneNumber and phoneType with default values if they are nil
        addDetailScreen.phone.text = "\(contact.phone)"
        
        addDetailScreen.delete.addTarget(self, action: #selector(onButtonFetchTapped), for: .touchUpInside)
        
        // Do any additional setup after loading the view.
    }
     
    @objc func onButtonFetchTapped(){
        let alert = UIAlertController(title: "Are you Sure?", message: "Once you confirm delete your contactor will never be back!", preferredStyle: .alert)
        guard let name = addDetailScreen.name.text else {
            return
        }
        
        // Confirm
        alert.addAction(UIAlertAction(title: "Confirm", style: .default) { _ in
            self.notificationInfo(yes: ["true", name])})
        
        // Cancel
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel) { _ in
            self.notificationInfo(yes: ["false", name])})
        self.present(alert, animated: true)
    }
    
    func notificationInfo(yes: [String]) {
        notificationCenter.post(
            name: .textFromScondScreen,
            object: yes)
        navigationController?.popViewController(animated: true)
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
