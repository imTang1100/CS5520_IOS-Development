//
//  ContactsTableView.swift
//  app10_3
//
//  Created by evan tang on 10/20/24.
//

import UIKit

class DetailsScreenView: UIView {
    var name: UILabel!
    var email: UILabel!
    var phone: UILabel!
    var delete: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //MARK: set the background color...
        self.backgroundColor = .white
        setupUI()
        initConstraints()
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
        
        // Delete
        delete = UIButton(type: .system)
        delete.setTitle("Delete", for: .normal)
        delete.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(delete)
        
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
            
            // Delete
            delete.topAnchor.constraint(equalTo: phone.bottomAnchor, constant: 16),
            delete.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
        
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
