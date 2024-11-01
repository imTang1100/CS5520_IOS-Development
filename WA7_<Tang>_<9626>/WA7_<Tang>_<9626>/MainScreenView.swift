//
//  MainScreenView.swift
//  WA7_<Tang>_<9626>
//
//  Created by evan tang on 10/29/24.
//

import UIKit

class MainScreenView: UIView {
    
    var loginEmail: UITextField!
    var loginPass: UITextField!
    var confrimButton: UIButton!
    var signUpButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white

        setupUI()
         
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
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
        confrimButton.setTitle("confirm", for: .normal)
        confrimButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(confrimButton)
        
        signUpButton = UIButton(type: .system)
        signUpButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
        signUpButton.setTitle("sign up", for: .normal)
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(signUpButton)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            loginEmail.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            loginEmail.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: 8),
            loginEmail.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 60),
            loginEmail.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            loginPass.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            loginPass.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: 8),
            loginPass.topAnchor.constraint(equalTo: loginEmail.safeAreaLayoutGuide.bottomAnchor, constant: 12),
            loginPass.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),

            confrimButton.topAnchor.constraint(equalTo: loginPass.safeAreaLayoutGuide.bottomAnchor, constant: 12),
            confrimButton.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            signUpButton.topAnchor.constraint(equalTo: confrimButton.safeAreaLayoutGuide.bottomAnchor, constant: 12),
            signUpButton.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
        ])
    }
    /*
    // Only override draw() if you perform custom drawing.
     
     
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
