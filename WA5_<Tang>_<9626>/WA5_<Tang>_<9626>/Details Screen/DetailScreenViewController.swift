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
    var conIndex: Int!
    let addDetailScreen = DetailScreenView()
    
    var contactNew: Contact!
    
    override func loadView() {
        view = addDetailScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Edit", style: .plain, target: self, action: #selector(onEditButtonTapped)
        )

        
        addDetailScreen.photo.image = contact.image
        addDetailScreen.name.text = contact.name ?? "No Name"
        addDetailScreen.email.text = contact.email ?? "No Email"
        
        // Handle phoneNumber and phoneType with default values if they are nil
        addDetailScreen.phone.text = "\(contact.phoneNumber ?? "Unknown") (\(contact.phoneType ?? "Unknown"))"
        
        addDetailScreen.address.text = contact.address ?? "No Address"
        addDetailScreen.cityState.text = contact.cityState ?? "No City/State"
        addDetailScreen.zip.text = contact.zipCode != nil ? "\(contact.zipCode!)" : "No Zip Code"
    }

    @objc func onEditButtonTapped(){
        let addEditController = EditController()
        var contactEdit = self.contact
        
        // set delegate and variables
        // important! not just to change takePhoto.setImage()
        addEditController.addContactScreen.buttonTakePhoto.setImage(delegate.contacts[conIndex].image?.withRenderingMode(.alwaysOriginal), for: .normal)
        addEditController.pickedImage = delegate.contacts[conIndex].image
        
        
        addEditController.addContactScreen.textFieldName.text = contactEdit?.name
        
        addEditController.addContactScreen.buttonSelectType.setTitle(self.delegate.contacts[conIndex].phoneType ?? "Type:", for: .normal)
        
        addEditController.addContactScreen.textFieldEmail.text = contactEdit?.email
        addEditController.addContactScreen.phoneNumber.text = contactEdit?.phoneNumber
    
        addEditController.addContactScreen.address.text = contactEdit?.address
        addEditController.addContactScreen.cityAndState.text = contactEdit?.cityState
        addEditController.addContactScreen.zipCode.text = contactEdit?.zipCode
        
        addEditController.addContactScreen.buttonTakePhoto.menu = addEditController.getMenuImagePicker()
        addEditController.addContactScreen.buttonTakePhoto.showsMenuAsPrimaryAction = true
        
        addEditController.addContactScreen.buttonSelectType.menu = addEditController.getMenuTypes()
        
        addEditController.delegate = delegate
        addEditController.delegae2 = self
        addEditController.conIndex = self.conIndex

        navigationController?.pushViewController(addEditController, animated: true)
    }
    
    func upDate() {
        
        contactNew = delegate.contacts[conIndex]
        addDetailScreen.photo.image = contactNew.image
        addDetailScreen.name.text = contactNew.name ?? "No Name"
        addDetailScreen.email.text = contactNew.email ?? "No Email"
        
        // Handle phoneNumber and phoneType with default values if they are nil
        addDetailScreen.phone.text = "\(contactNew.phoneNumber ?? "Unknown") (\(contactNew.phoneType ?? "Unknown"))"
        
        addDetailScreen.address.text = contactNew.address ?? "No Address"
        addDetailScreen.cityState.text = contactNew.cityState ?? "No City/State"
        addDetailScreen.zip.text = contactNew.zipCode != nil ? "\(contactNew.zipCode!)" : "No Zip Code"
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
