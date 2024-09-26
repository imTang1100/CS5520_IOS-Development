//
//  ViewController.swift
//  WA3_<Tang>_<9626>
//
//  Created by evan tang on 9/24/24.
//

import UIKit

class ViewController: UIViewController {
    
    let types: [String] = ["Cell", "Work", "Home"]
    
    var selectedType = "Cell"
    
    public struct Package {
        var phone: Int?
        var address: String?
        var city: String?
        var zip: Int?
        
        init(phone: Int? = nil, address: String? = nil, city: String? = nil, zip: Int? = nil) {
            self.phone = phone
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
        
        
        
        
        title = "Create Profile"
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
