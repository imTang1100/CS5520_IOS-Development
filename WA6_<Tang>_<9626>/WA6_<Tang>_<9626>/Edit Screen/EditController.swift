//
//  EditControllerViewController.swift
//  WA5_<Tang>_<9626>
//
//  Created by evan tang on 10/12/24.
//

import UIKit
import PhotosUI

class EditController: UIViewController {
    
    var contact: Contact!
    let notificationCenter = NotificationCenter.default
    let addContactScreen = EditView()
    
    override func loadView() {
        view = addContactScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Edit"
        
        addContactScreen.textFieldName.text = contact.name
        addContactScreen.textFieldEmail.text = contact.email
        addContactScreen.phoneNumber.text = String(contact.phone)

        addContactScreen.buttonSave.addTarget(self, action: #selector(saveButton), for: .touchUpInside)
            
    }
    
    // Check if any info changed?
    @objc func saveButton() {
        if addContactScreen.textFieldName.text != contact.name || addContactScreen.textFieldEmail.text != contact.email ||
            addContactScreen.phoneNumber.text != String(contact.phone) {
                updateContact()
        } else {
            return
        }
    }
    
    func updateContact() {
        var name:String?
        if let nameText = addContactScreen.textFieldName.text{
            if !nameText.isEmpty {
                name = nameText
            }else{
                showErrorAlert(message: "You need a name")
                return
            }
        }
        
        var email:String?
        if let emailText = addContactScreen.textFieldEmail.text{
            if !emailText.isEmpty{
                email = emailText
            }else{
                showErrorAlert(message: "email is important!")
                return
            }
        }
        
        var phoneNumber:Int?
        if let phoneNumberText = addContactScreen.phoneNumber.text{
            if !phoneNumberText.isEmpty && (Int(phoneNumberText) != nil) {
                phoneNumber = Int(phoneNumberText)
            }else{
                showErrorAlert(message: "No phone number no call")
                return
            }
        }
        
        let newContact = Contact(name: name ?? "", email: email ?? "", phone: phoneNumber ?? 0)
        notificationInfo(yes: newContact)
        navigationController?.popViewController(animated: true)
    }
    
    func notificationInfo(yes: Contact) {
        notificationCenter.post(
            name: .textFromThirdScreen,
            object: yes)
    }
    
    func validateZipCode(zip: String) -> Bool {
        let zipString = zip
        return zipString.count == 5
    }
    
    func showErrorAlert(message: String) {
        let alert = UIAlertController(title: "Error!", message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alert, animated: true)
    }
}
