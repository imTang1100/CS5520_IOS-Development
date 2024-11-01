//
//  SignUpView.swift
//  WA7_<Tang>_<9626>
//
//  Created by evan tang on 10/29/24.
//

import UIKit

class SignUpView: UIView {
    
    var userName: UITextField!
    var loginEmail: UITextField!
    var loginPass: UITextField!
    var confrimButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white

        setupUI()
         
        initConstraints()
    }
    
    func setupUI() {
        userName = UITextField()
        userName.backgroundColor = .white
        userName.placeholder = "Name"
        userName.borderStyle = .roundedRect
        userName.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(userName)
        
        loginEmail = UITextField()
        loginEmail.backgroundColor = .white
        loginEmail.placeholder = "Email"
        loginEmail.borderStyle = .roundedRect
        loginEmail.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(loginEmail)
        
        loginPass = UITextField()
        loginPass.backgroundColor = .white
        loginPass.placeholder = "Password"
        loginPass.borderStyle = .roundedRect
        loginPass.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(loginPass)
        
        confrimButton = UIButton(type: .system)
        confrimButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
        confrimButton.setTitle("Confirm", for: .normal)
        confrimButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(confrimButton)
        
    }
       
    func initConstraints() {
        NSLayoutConstraint.activate([
            userName.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            userName.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: 20),
            userName.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 60),
            userName.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            loginEmail.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            loginEmail.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: 20),
            loginEmail.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 12),
            loginEmail.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            loginPass.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            loginPass.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: 20),
            loginPass.topAnchor.constraint(equalTo: loginEmail.bottomAnchor, constant: 12),
            loginPass.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
 
            confrimButton.topAnchor.constraint(equalTo: loginPass.safeAreaLayoutGuide.bottomAnchor, constant: 12),
            confrimButton.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
        ])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
