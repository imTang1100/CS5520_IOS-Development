//
//  DisplayView.swift
//  WA3_<Tang>_<9626>
//
//  Created by evan tang on 9/24/24.
//

import UIKit

class ShowProfileView: UIView {
    
    var userName: UILabel!
    var userEmail: UILabel!
    var userPhone: UILabel!
    var userAddress: UILabel!
    var userCity: UILabel!
    var userZIP: UILabel!
    
    var imageType: UIImageView!

    
    //MARK: View initializer...
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //setting the background color...
        self.backgroundColor = .white
        
        setupUserName()
        setupUserEmail()
        setupUserPhone()
        setupUserAddress()
        setupUserCity()
        setupUserZIP()
        
        setUpImage()
        
        initConstraints()
        
    }

    func setupUserName(){
        userName = UILabel()
        userName.textAlignment = .left
        userName.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(userName)
    }
    
    func setupUserEmail(){
        userEmail = UILabel()
        userEmail.textAlignment = .left
        userEmail.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(userEmail)
    }
    
    func setupUserPhone(){
        userPhone = UILabel()
        userPhone.textAlignment = .left
        userPhone.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(userPhone)
    }
    
    func setupUserAddress() {
        userAddress = UILabel()
        userAddress.textAlignment = .left
        userAddress.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(userAddress)
    }

    func setupUserCity() {
        userCity = UILabel()
        userCity.textAlignment = .left
        userCity.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(userCity)
    }

    func setupUserZIP() {
        userZIP = UILabel()
        userZIP.textAlignment = .left
        userZIP.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(userZIP)
    }
    
    func setUpImage() {
        imageType = UIImageView()
        imageType.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imageType)
    }
    
    //MARK: initializing the constraints...
    func initConstraints(){
        NSLayoutConstraint.activate([
            // Constraints for userName
            userName.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 32),
            userName.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            userName.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            // Constraints for userEmail
            userEmail.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 16),
            userEmail.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            userEmail.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            // Constraints for userPhone
            userPhone.topAnchor.constraint(equalTo: userEmail.bottomAnchor, constant: 16),
            userPhone.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            userPhone.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            // Constraints for userAddress
            userAddress.topAnchor.constraint(equalTo: userPhone.bottomAnchor, constant: 16),
            userAddress.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            userAddress.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            // Constraints for userCity
            userCity.topAnchor.constraint(equalTo: userAddress.bottomAnchor, constant: 16),
            userCity.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            userCity.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            // Constraints for userZIP
            userZIP.topAnchor.constraint(equalTo: userCity.bottomAnchor, constant: 16),
            userZIP.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            userZIP.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            // Constraints for imageType, center-aligned horizontally
            imageType.topAnchor.constraint(equalTo: userZIP.bottomAnchor, constant: 32),
            imageType.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ])
    }

    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
