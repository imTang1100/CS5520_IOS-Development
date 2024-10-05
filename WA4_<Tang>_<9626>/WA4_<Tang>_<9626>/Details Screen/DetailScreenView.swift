//
//  DetailScreenView.swift
//  WA4_<Tang>_<9626>
//
//  Created by evan tang on 10/5/24.
//

import UIKit

class DetailScreenView: UIView {
    
    var name: UILabel!
    var email: UILabel!
    var phone: UILabel!
    
    var addressTitle: UILabel!
    var address: UILabel!
    var cityState: UILabel!
    var zip: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //MARK: set the background color...
        self.backgroundColor = .white
        setupUI()
        initConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        // Name
        name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.font = UIFont.boldSystemFont(ofSize: 24)
        self.addSubview(name)
        
        // Email
        email = UILabel()
        email.translatesAutoresizingMaskIntoConstraints = false
        email.font = UIFont.systemFont(ofSize: 16)
        self.addSubview(email)
        
        // Phone
        phone = UILabel()
        phone.translatesAutoresizingMaskIntoConstraints = false
        phone.font = UIFont.systemFont(ofSize: 16)
        self.addSubview(phone)
        
        // Address Title
        addressTitle = UILabel()
        addressTitle.translatesAutoresizingMaskIntoConstraints = false
        addressTitle.font = UIFont.boldSystemFont(ofSize: 18)
        addressTitle.text = "Address:"
        self.addSubview(addressTitle)
        
        // Address
        address = UILabel()
        address.translatesAutoresizingMaskIntoConstraints = false
        address.font = UIFont.systemFont(ofSize: 16)
        self.addSubview(address)
        
        // City and State
        cityState = UILabel()
        cityState.translatesAutoresizingMaskIntoConstraints = false
        cityState.font = UIFont.systemFont(ofSize: 16)
        self.addSubview(cityState)
        
        // Zip Code
        zip = UILabel()
        zip.translatesAutoresizingMaskIntoConstraints = false
        zip.font = UIFont.systemFont(ofSize: 16)
        self.addSubview(zip)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            // Name
            name.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 32),
            name.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            // Email
            email.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 16),
            email.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            // Phone
            phone.topAnchor.constraint(equalTo: email.bottomAnchor, constant: 8),
            phone.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            // Address Title
            addressTitle.topAnchor.constraint(equalTo: phone.bottomAnchor, constant: 24),
            addressTitle.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            // Address
            address.topAnchor.constraint(equalTo: addressTitle.bottomAnchor, constant: 8),
            address.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            // City and State
            cityState.topAnchor.constraint(equalTo: address.bottomAnchor, constant: 8),
            cityState.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            // Zip Code
            zip.topAnchor.constraint(equalTo: cityState.bottomAnchor, constant: 8),
            zip.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
}
