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
    
    var buttonSelectType: UIButton!
    var buttonTakePhoto: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
    
        setupTextName()
        
        setupButtonTakePhoto()
        
        setupTextEmail()
        
        setupPhoneNum()
        
        setupSelect()
        
        setupAddress()
        setupCityState()
        setupZip()
        
        initConstraints()
    }
    
    func setupTextName(){
        textFieldName = UITextField()
        textFieldName.placeholder = "Name"
        textFieldName.borderStyle = .roundedRect
        textFieldName.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textFieldName)
    }
    
    func setupButtonTakePhoto() {
        buttonTakePhoto = UIButton(type: .system)
        buttonTakePhoto.setTitle("", for: .normal)
        buttonTakePhoto.setImage(UIImage(systemName: "camera.fill"), for: .normal)
        buttonTakePhoto.contentHorizontalAlignment = .fill
        buttonTakePhoto.contentVerticalAlignment = .fill
        buttonTakePhoto.imageView?.contentMode = .scaleAspectFit
        buttonTakePhoto.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonTakePhoto)
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
    
    func setupSelect() {
        buttonSelectType = UIButton(type: .system)
        buttonSelectType.setTitle("Type:", for: .normal)
        
        //MARK: the on-tap primary action will pop up the menu...
        buttonSelectType.showsMenuAsPrimaryAction = true
        buttonSelectType.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonSelectType)
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
            textFieldName.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 32),
            textFieldName.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textFieldName.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            textFieldName.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
             
            buttonTakePhoto.topAnchor.constraint(equalTo: textFieldName.bottomAnchor, constant: 16),
            buttonTakePhoto.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            buttonTakePhoto.widthAnchor.constraint(equalToConstant: 100),
            buttonTakePhoto.heightAnchor.constraint(equalToConstant: 100),
            
            textFieldEmail.topAnchor.constraint(equalTo: textFieldName.bottomAnchor, constant: 120),
            textFieldEmail.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textFieldEmail.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            textFieldEmail.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            phoneNumber.topAnchor.constraint(equalTo: textFieldEmail.bottomAnchor, constant: 16),
            phoneNumber.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            phoneNumber.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -140),
            phoneNumber.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            buttonSelectType.topAnchor.constraint(equalTo: textFieldEmail.bottomAnchor, constant: 16),
            buttonSelectType.leadingAnchor.constraint(equalTo: phoneNumber.trailingAnchor, constant: 8),
            buttonSelectType.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
             
            address.topAnchor.constraint(equalTo: phoneNumber.bottomAnchor, constant: 16),
            address.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            address.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            address.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
        
            cityAndState.topAnchor.constraint(equalTo: address.bottomAnchor, constant: 16),
            cityAndState.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            cityAndState.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            cityAndState.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            zipCode.topAnchor.constraint(equalTo: cityAndState.bottomAnchor, constant: 16),
            zipCode.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            zipCode.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            zipCode.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
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
