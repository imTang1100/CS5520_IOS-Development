//
//  AddContactView.swift
//  WA4_<Tang>_<9626>
//
//  Created by evan tang on 10/2/24.
//

import UIKit

class AddContactView: UIView {
    
    var titleAddContact: UILabel!
    
    var textFieldName: UITextField!
    var textFieldEmail: UITextField!
    
    var titleAddPhone: UILabel!
    var pickerType: UIPickerView!
    
    var phoneNumber: UITextField!
    var address: UITextField!
    var cityAndState: UITextField!
    var zipCode: UITextField!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        setupTitle()
        
        setupTextName()
        setupTextEmail()
        
        setupTitleAdd()
        setupPicker()
        
        setupPhoneNum()
        setupAddress()
        setupCityState()
        setupZip()
        
        initConstraints()
    }
    
    func setupTitle(){
        titleAddContact = UILabel()
        titleAddContact.text = "Add a New Contact"
        titleAddContact.font = UIFont.boldSystemFont(ofSize: 24)
        titleAddContact.textAlignment = .center
        titleAddContact.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(titleAddContact)
    }
    
    func setupTextName(){
        textFieldName = UITextField()
        textFieldName.placeholder = "Name"
        textFieldName.borderStyle = .roundedRect
        textFieldName.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldName)
    }
    
    func setupTextEmail() {
        textFieldEmail = UITextField()
        textFieldEmail.placeholder = "Email"
        textFieldEmail.borderStyle = .roundedRect
        textFieldEmail.translatesAutoresizingMaskIntoConstraints = false
        textFieldEmail.keyboardType = .emailAddress
        textFieldEmail.autocapitalizationType = .none  // Disable auto-capitalization
        textFieldEmail.autocorrectionType = .no  // Disable auto-correction
        self.addSubview(textFieldEmail)
    }
    
    func setupTitleAdd(){
        titleAddPhone = UILabel()
        titleAddPhone.text = "Add a New Contact"
        titleAddPhone.font = UIFont.systemFont(ofSize: 16)
        titleAddPhone.textAlignment = .center
        titleAddPhone.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(titleAddPhone)
    }
    
    func setupPicker() {
        pickerType = UIPickerView()
        pickerType.isUserInteractionEnabled = true
        pickerType.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(pickerType)
    }
    
    func setupPhoneNum() {
        phoneNumber = UITextField()
        phoneNumber.placeholder = "Phone Number"
        phoneNumber.borderStyle = .roundedRect
        phoneNumber.translatesAutoresizingMaskIntoConstraints = false
        phoneNumber.keyboardType = .phonePad
        self.addSubview(phoneNumber)
    }
    
    func setupAddress() {
        address = UITextField()
        address.placeholder = "Address"
        address.borderStyle = .roundedRect
        address.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(address)
    }
    
    func setupCityState() {
        cityAndState = UITextField()
        cityAndState.placeholder = "City, State"
        cityAndState.borderStyle = .roundedRect
        cityAndState.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(cityAndState)
    }
    
    func setupZip() {
        zipCode = UITextField()
        zipCode.placeholder = "ZIP"
        zipCode.keyboardType = .numberPad
        zipCode.borderStyle = .roundedRect
        zipCode.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(zipCode)
    }
    
    //MARK: initialize the constraints...
    func initConstraints(){
        NSLayoutConstraint.activate([
            titleAddContact.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 32),
            titleAddContact.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            textFieldName.topAnchor.constraint(equalTo: titleAddContact.bottomAnchor, constant: 16),
            textFieldName.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
             
            textFieldEmail.topAnchor.constraint(equalTo: textFieldName.bottomAnchor, constant: 16),
            textFieldEmail.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            titleAddPhone.topAnchor.constraint(equalTo: textFieldEmail.bottomAnchor, constant: 16),
            titleAddPhone.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            pickerType.topAnchor.constraint(equalTo: titleAddPhone.bottomAnchor, constant: -8),
            pickerType.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            phoneNumber.topAnchor.constraint(equalTo: pickerType.bottomAnchor, constant: 16),
            phoneNumber.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            address.topAnchor.constraint(equalTo: phoneNumber.bottomAnchor, constant: 16),
            address.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
        
            cityAndState.topAnchor.constraint(equalTo: address.bottomAnchor, constant: 16),
            cityAndState.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            zipCode.topAnchor.constraint(equalTo: cityAndState.bottomAnchor, constant: 16),
            zipCode.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
        ])
    }
    
    //MARK: unused methods...
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
