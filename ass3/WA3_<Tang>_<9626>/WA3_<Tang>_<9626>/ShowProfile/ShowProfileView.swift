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
    
    //MARK: initializing the constraints...
    func initConstraints(){
        NSLayoutConstraint.activate([
            userName.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 32),
            userName.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            
            userEmail.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 16),
            userEmail.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            
            userPhone.topAnchor.constraint(equalTo: userEmail.bottomAnchor, constant: 16),
            userPhone.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            
            userAddress.topAnchor.constraint(equalTo: userPhone.bottomAnchor, constant: 16),
            userAddress.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            
            userCity.topAnchor.constraint(equalTo: userAddress.bottomAnchor, constant: 16),
            userCity.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            
            userZIP.topAnchor.constraint(equalTo: userCity.bottomAnchor, constant: 16),
            userZIP.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
        ])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
