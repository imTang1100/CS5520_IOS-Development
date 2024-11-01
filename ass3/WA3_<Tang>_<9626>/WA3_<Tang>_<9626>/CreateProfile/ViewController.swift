//
//  ViewController.swift
//  WA3_<Tang>_<9626>
//
//  Created by evan tang on 9/24/24.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    let types: [String] = ["Cell", "Work", "Home"]
    
    var selectedType = "Cell"
    
    public struct Package {
        var name: String?
        var email: String?
        var phone: Int?
        var type: String?
        var address: String?
        var city: String?
        var zip: Int?
        
        init(name: String? = nil, email: String? = nil, phone: Int? = nil, type: String? = nil, address: String? = nil, city: String? = nil, zip: Int? = nil) {
            self.name = name
            self.email = email
            self.phone = phone
            self.type = type
            self.address = address
            self.city = city
            self.zip = zip
        }
    }
    
    let createProfile = CreateProfileView()
    
    override func loadView() {
        view = createProfile
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        createProfile.numberTypePicker.delegate = self
        createProfile.numberTypePicker.dataSource = self
        
        createProfile.showProfile.addTarget(self, action: #selector(onShowTapped), for: .touchUpInside)
        
        title = "Create Profile"
    }
    
    func validateZipCode(zip: String) -> Bool {
        let zipString = zip
        return zipString.count == 5
    }
    
    @objc func onShowTapped() {
        let name = createProfile.textFieldName.text
        let email = createProfile.textFieldEmail.text
        let phone = createProfile.phoneNumber.text
        let address = createProfile.address.text
        let city = createProfile.cityAndState.text
        let zip = createProfile.zipCode.text
        
        if let unwrapperName = name, let unwrapperEmail = email, let unwrapperPhone = phone, let unwrapperAddress = address, let unwrapperCity = city,let unwrapperZip = zip{
            // if the ZIP code is valid
            if !unwrapperName .isEmpty && !unwrapperEmail.isEmpty && !unwrapperPhone.isEmpty && !unwrapperAddress.isEmpty && !unwrapperCity.isEmpty && validateZipCode(zip: unwrapperZip) {
                let package = Package(name: unwrapperName, email: unwrapperEmail, phone: Int(unwrapperPhone), type: selectedType, address: unwrapperAddress, city: unwrapperCity, zip: Int(unwrapperZip))
                
                let showProfileController = ShowProfileController()
                
                showProfileController.receivedPackage = package
                
                navigationController?.pushViewController(showProfileController, animated: true)
            } else {
                showErrorAlert(message: "Please type in the valid format!")
            }
        }
    }
    
    func showErrorAlert(message: String) {
        let alert = UIAlertController(title: "Error!", message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alert, animated: true)
    }
}



extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    //returns the number of columns/components in the Picker View...
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //returns the number of rows in the current component...
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return types.count
    }
    
    //set the title of currently picked row...
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        // on change selection, update selectedMood...
        selectedType = types[row]
        return types[row]
    }
}
