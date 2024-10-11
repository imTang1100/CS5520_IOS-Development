//
//  AddContactViewController.swift
//  WA4_<Tang>_<9626>
//
//  Created by evan tang on 10/2/24.
//

import UIKit
import PhotosUI

class AddContactViewController: UIViewController {
    
    var delegate: ViewController!
    var selectedType = "Cell"
    
    //MARK: variable to store the picked Image...
    var pickedImage:UIImage?
    
    //MARK: initializing the ADDExpenseView...
    let addContactScreen = AddContactView()
    
    //MARK: set the current view to addExpenseScreen...
    override func loadView() {
        view = addContactScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Add Contact"
        
        //MARK: setting the add button to the navigation controller...
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Save", style: .plain, target: self, action: #selector(onRightButtonTapped)
        )
        
        addContactScreen.buttonTakePhoto.menu = getMenuImagePicker()
        addContactScreen.buttonSelectType.menu = getMenuTypes()

        // Do any additional setup after loading the view.
    }
    
    func getMenuImagePicker() -> UIMenu{
        var menuItems = [
            UIAction(title: "Camera",handler: {(_) in
                self.pickUsingCamera()
            }),
            UIAction(title: "Gallery",handler: {(_) in
                self.pickPhotoFromGallery()
            })
        ]
        
        return UIMenu(title: "Select source", children: menuItems)
    }
    
    //MARK: take Photo using Camera...
    func pickUsingCamera(){
        let cameraController = UIImagePickerController()
        cameraController.sourceType = .camera
        cameraController.allowsEditing = true
        cameraController.delegate = self
        present(cameraController, animated: true)
    }
    
    //MARK: pick Photo using Gallery...
    func pickPhotoFromGallery(){
        var configuration = PHPickerConfiguration()
        configuration.filter = PHPickerFilter.any(of: [.images])
        configuration.selectionLimit = 1
        
        let photoPicker = PHPickerViewController(configuration: configuration)
        
        photoPicker.delegate = self
        present(photoPicker, animated: true, completion: nil)
    }
    
    //MARK: menu for buttonSelectType setup...
    func getMenuTypes() -> UIMenu{
        var menuItems = [UIAction]()
        
        for type in Utilities.types{
            let menuItem = UIAction(title: type,handler: {(_) in
                                self.selectedType = type
                                self.addContactScreen.buttonSelectType.setTitle(self.selectedType, for: .normal)
                            })
            menuItems.append(menuItem)
        }
        
        return UIMenu(title: "Select type", children: menuItems)
    }
    
    @objc func onRightButtonTapped(){
        var name:String?
        if let nameText = addContactScreen.textFieldName.text{
            if !nameText.isEmpty{
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
        
        var phoneNumber:String?
        if let phoneNumberText = addContactScreen.phoneNumber.text{
            if !phoneNumberText.isEmpty && (Int(phoneNumberText) != nil) {
                phoneNumber = phoneNumberText
            }else{
                showErrorAlert(message: "No phone number no call")
                return
            }
        }
        
        var address: String?
        if let addressText = addContactScreen.address.text{
            if !addressText.isEmpty{
                address = addressText
            }else{
                showErrorAlert(message: "You need an address")
                return
            }
        }

        var city: String?
        if let cityText = addContactScreen.cityAndState.text{
            if !cityText.isEmpty{
                city = cityText
            }else{
                showErrorAlert(message: "Ask where they are based!")
                return
            }
        }
        
        var zip: String?
        if let zipCode = addContactScreen.zipCode.text{
            if validateZipCode(zip: zipCode){
                zip = zipCode
            }else{
                showErrorAlert(message: "zip Code, an valid zip code!")
                return
            }
        }
        
        
        let newContact = Contact(name: name, email: email, phoneNumber: phoneNumber, phoneType: selectedType, address: address, cityState: city, zipCode: zip)
    
        delegate.delegateOnAddContact(contact: newContact)
        navigationController?.popViewController(animated: true)
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//MARK: adopting the required protocols...
extension AddContactViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        //MARK: we are using only one section...
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //MARK: we are displaying the options from Utilities.types...
        return Utilities.types.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        //MARK: updating the selected type when the user picks this row...
        selectedType = Utilities.types[row]
        return Utilities.types[row]
    }
}

extension AddContactViewController:PHPickerViewControllerDelegate{
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        dismiss(animated: true)
        
        print(results)
        
        let itemprovider = results.map(\.itemProvider)
        
        for item in itemprovider{
            if item.canLoadObject(ofClass: UIImage.self){
                item.loadObject(ofClass: UIImage.self, completionHandler: { (image, error) in
                    DispatchQueue.main.async{
                        if let uwImage = image as? UIImage{
                            self.addContactScreen.buttonTakePhoto.setImage(
                                uwImage.withRenderingMode(.alwaysOriginal),
                                for: .normal
                            )
                            self.pickedImage = uwImage
                        }
                    }
                })
            }
        }
    }
}

extension AddContactViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        
        if let image = info[.editedImage] as? UIImage{
            self.addContactScreen.buttonTakePhoto.setImage(
                image.withRenderingMode(.alwaysOriginal),
                for: .normal
            )
            self.pickedImage = image
        }else{
            // Do your thing for No image loaded...
        }
    }
}
