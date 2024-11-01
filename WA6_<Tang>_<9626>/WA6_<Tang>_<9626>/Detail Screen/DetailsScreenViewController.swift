//
//  DetailsScreenViewController.swift
//  app10_3
//
//  Created by evan tang on 10/20/24.
//

import UIKit

class DetailsScreenViewController: UIViewController {
    var contact: Contact!
    var editScreen: EditController!
    let addDetailScreen = DetailsScreenView()
    
    let notificationCenter = NotificationCenter.default
    
    override func loadView() {
        view = addDetailScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideKeyboardOnTapOutside()
        addDetailScreen.name.text = contact.name
        addDetailScreen.email.text = contact.email
        
        // Handle phoneNumber and phoneType with default values if they are nil
        addDetailScreen.phone.text = "\(contact.phone)"
        
        addDetailScreen.delete.addTarget(self, action: #selector(onButtonFetchTapped), for: .touchUpInside)
        addDetailScreen.edit.addTarget(self, action: #selector(onButtonEdit), for: .touchUpInside)
        // Do any additional setup after loading the view.
        
        notificationCenter.addObserver(self, selector: #selector(notificationReceivedForEdit(notification:)), name:  .textFromThirdScreen, object: nil)
        
    }
    
    //MARK: hide keyboard logic...
    func hideKeyboardOnTapOutside(){
        //MARK: recognizing the taps on the app screen, not the keyboard...
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardOnTap))
        view.addGestureRecognizer(tapRecognizer)
    }
    
    @objc func hideKeyboardOnTap(){
        //MARK: removing the keyboard from screen...
        view.endEditing(true)
    }
     
    @objc func notificationReceivedForEdit(notification: Notification) {
        guard let newContact = notification.object as? Contact else {return}
        if contact != newContact {
            addDetailScreen.name.text = newContact.name
            addDetailScreen.email.text = newContact.email
            addDetailScreen.phone.text = String(newContact.phone)
            
            // delete original contact
            self.notificationEdit(newContact: (self.contact.name, newContact))
            
        } else {return}

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
    
    @objc func onButtonEdit() {
        let editScreen = EditController()
        editScreen.contact = contact
        
        navigationController?.pushViewController(editScreen, animated: true)
    }
    
    func notificationInfo(yes: [String]) {
        notificationCenter.post(
            name: .textFromScondScreen,
            object: yes)
        navigationController?.popViewController(animated: true)
    }
    
    func notificationEdit(newContact: (String, Contact)) {
        notificationCenter.post(
            name: .editFromSecond,
            object: newContact)
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
