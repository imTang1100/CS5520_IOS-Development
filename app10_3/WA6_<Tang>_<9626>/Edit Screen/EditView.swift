//
//  EditView.swift
//  WA5_<Tang>_<9626>
//
//  Created by evan tang on 10/12/24.
//


import UIKit

class EditView: UIView {
    
    var textFieldName: UITextField!
    var textFieldEmail: UITextField!
    var phoneNumber: UITextField!

    var buttonSave: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
    
        setupTextName()
        
        setupTextEmail()
        
        setupPhoneNum()
        
        setupSave()
        
        initConstraints()
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
    
    func setupPhoneNum() {
        phoneNumber = UITextField()
        phoneNumber.placeholder = "Phone Number"
        phoneNumber.borderStyle = .roundedRect
        phoneNumber.translatesAutoresizingMaskIntoConstraints = false
        phoneNumber.keyboardType = .phonePad
        self.addSubview(phoneNumber)
    }
    
    func setupSave() {
        buttonSave = UIButton(type: .system)
        buttonSave.setTitle("Save", for: .normal)
        buttonSave.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        buttonSave.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonSave)
    } 
    
    //MARK: initialize the constraints...
    func initConstraints(){
        NSLayoutConstraint.activate([
            textFieldName.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 32),
            textFieldName.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textFieldName.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            textFieldName.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
             
            textFieldEmail.topAnchor.constraint(equalTo: textFieldName.bottomAnchor, constant: 120),
            textFieldEmail.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textFieldEmail.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            textFieldEmail.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            phoneNumber.topAnchor.constraint(equalTo: textFieldEmail.bottomAnchor, constant: 16),
            phoneNumber.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            phoneNumber.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -140),
            phoneNumber.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            buttonSave.topAnchor.constraint(equalTo: phoneNumber.bottomAnchor, constant: 60),
            buttonSave.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
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
