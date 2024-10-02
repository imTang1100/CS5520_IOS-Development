//
//  FirstScreenView.swift
//  WA3_<Tang>_<9626>
//
//  Created by evan tang on 9/24/24.
//

import UIKit

class CreateProfileView: UIView {
    
    var textFieldName: UITextField!
    var textFieldEmail: UITextField!
    var addPhone: UILabel!
    var selectType: UILabel!
    var numberTypePicker: UIPickerView!
    
    var phoneNumber: UITextField!
    var address: UITextField!
    var cityAndState: UITextField!
    var zipCode: UITextField!
    
    var showProfile: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        //MARK: set the background color...
        self.backgroundColor = .white
        
        setUpTextFieldName()
        setUpTextFieldEmail()
        setUpAddPhone()
        setUpSelectType()
        setUpPicker()
        
        setUpPhoneNum()
        setUpAddress()
        setUpCityState()
        setUpZip()
        
        setUpShow()
        
        initConstraints()
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            // Leading and trailing anchors for textFieldName with 16 points margin
            textFieldName.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 32),
            textFieldName.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textFieldName.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            // Repeat for textFieldEmail
            textFieldEmail.topAnchor.constraint(equalTo: textFieldName.bottomAnchor, constant: 16),
            textFieldEmail.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textFieldEmail.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            // Constraints for addPhone
            addPhone.topAnchor.constraint(equalTo: textFieldEmail.bottomAnchor, constant: 16),
            addPhone.centerXAnchor.constraint(equalTo: self.centerXAnchor),

            // Constraints for selectType
            selectType.topAnchor.constraint(equalTo: addPhone.bottomAnchor, constant: 16),
            selectType.centerXAnchor.constraint(equalTo: self.centerXAnchor),

            numberTypePicker.topAnchor.constraint(equalTo: selectType.bottomAnchor, constant: -30),
            numberTypePicker.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            numberTypePicker.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),

            phoneNumber.topAnchor.constraint(equalTo: numberTypePicker.bottomAnchor, constant: 16),
            phoneNumber.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            phoneNumber.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),

            address.topAnchor.constraint(equalTo: phoneNumber.bottomAnchor, constant: 16),
            address.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            address.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),

            cityAndState.topAnchor.constraint(equalTo: address.bottomAnchor, constant: 16),
            cityAndState.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            cityAndState.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),

            zipCode.topAnchor.constraint(equalTo: cityAndState.bottomAnchor, constant: 16),
            zipCode.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            zipCode.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),

            showProfile.topAnchor.constraint(equalTo: zipCode.bottomAnchor, constant: 16),
            showProfile.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            showProfile.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
        ])
    }

    func setUpTextFieldName() {
        textFieldName = UITextField()
        textFieldName.placeholder = "Name"
        textFieldName.borderStyle = .roundedRect
        textFieldName.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldName)
    }
    
    func setUpTextFieldEmail() {
        textFieldEmail = UITextField()
        textFieldEmail.placeholder = "Email"
        textFieldEmail.borderStyle = .roundedRect
        textFieldEmail.translatesAutoresizingMaskIntoConstraints = false
        textFieldEmail.keyboardType = .emailAddress
        textFieldEmail.autocapitalizationType = .none  // Disable auto-capitalization
        textFieldEmail.autocorrectionType = .no  // Disable auto-correction
        self.addSubview(textFieldEmail)
    }
    
    func setUpAddPhone() {
        addPhone = UILabel()
        addPhone.text = "Add Phone"
        addPhone.translatesAutoresizingMaskIntoConstraints = false
        addPhone.font = UIFont.systemFont(ofSize: 20)
        self.addSubview(addPhone)
    }
    
    func setUpSelectType() {
        selectType = UILabel()
        selectType.text = "Select Type:"
        selectType.translatesAutoresizingMaskIntoConstraints = false
        selectType.font = UIFont.systemFont(ofSize: 14)
        self.addSubview(selectType)
    }
    
    func setUpPicker() {
        numberTypePicker = UIPickerView()
        numberTypePicker.isUserInteractionEnabled = true
        numberTypePicker.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(numberTypePicker)
    }
    
    func setUpPhoneNum() {
        phoneNumber = UITextField()
        phoneNumber.placeholder = "Phone Number"
        phoneNumber.borderStyle = .roundedRect
        phoneNumber.translatesAutoresizingMaskIntoConstraints = false
        phoneNumber.keyboardType = .phonePad
        self.addSubview(phoneNumber)
    }
    
    func setUpAddress() {
        address = UITextField()
        address.placeholder = "Address"
        address.borderStyle = .roundedRect
        address.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(address)
    }
    
    func setUpCityState() {
        cityAndState = UITextField()
        cityAndState.placeholder = "City, State"
        cityAndState.borderStyle = .roundedRect
        cityAndState.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(cityAndState)
    }
    
    func setUpZip() {
        zipCode = UITextField()
        zipCode.placeholder = "ZIP"
        zipCode.keyboardType = .numberPad
        zipCode.borderStyle = .roundedRect 
        zipCode.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(zipCode)
    }
    
    func setUpShow() {
        showProfile = UIButton(type: .system)
        showProfile.setTitle("Show Profile", for: .normal)
        showProfile.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(showProfile)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
