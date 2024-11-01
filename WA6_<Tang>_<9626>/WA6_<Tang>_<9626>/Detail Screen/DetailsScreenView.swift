//
//  ContactsTableView.swift
//  app10_3
//
//  Created by evan tang on 10/20/24.
//

import UIKit

class DetailsScreenView: UIView {
    var contentWrapper:UIScrollView!
    var name: UILabel!
    var email: UILabel!
    var phone: UILabel!
    var delete: UIButton!
    var edit: UIButton!
 
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //MARK: set the background color...
        self.backgroundColor = .white
        setupContentWrapper()
        setupUI()
        initConstraints()
    }
    
    func setupContentWrapper(){
        contentWrapper = UIScrollView()
        contentWrapper.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(contentWrapper)
    }
    
    func setupUI() {
        // Name
        name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.font = UIFont.boldSystemFont(ofSize: 24)
        contentWrapper.addSubview(name)
        
        // Email
        email = UILabel()
        email.translatesAutoresizingMaskIntoConstraints = false
        email.font = UIFont.systemFont(ofSize: 16)
        contentWrapper.addSubview(email)
        
        // Phone
        phone = UILabel()
        phone.translatesAutoresizingMaskIntoConstraints = false
        phone.font = UIFont.systemFont(ofSize: 16)
        contentWrapper.addSubview(phone)
        
        // Delete
        delete = UIButton(type: .system)
        delete.setTitle("Delete", for: .normal)
        delete.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(delete)
        
        // Edit
        edit = UIButton(type: .system)
        edit.setTitle("Edit", for: .normal)
        edit.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(edit)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            
            //MARK: contentWrapper constraints...
            contentWrapper.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            contentWrapper.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            contentWrapper.widthAnchor.constraint(equalTo:self.safeAreaLayoutGuide.widthAnchor),
            contentWrapper.bottomAnchor.constraint(equalTo: delete.topAnchor), // Adjust as needed
            
            // Name
            name.topAnchor.constraint(equalTo: contentWrapper.safeAreaLayoutGuide.topAnchor, constant: 32),
            name.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            
            // Email
            email.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 16),
            email.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            
            // Phone
            phone.topAnchor.constraint(equalTo: email.bottomAnchor, constant: 8),
            phone.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            
            // Delete
            delete.topAnchor.constraint(equalTo: phone.bottomAnchor, constant: 16),
            delete.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            // Edit
            edit.topAnchor.constraint(equalTo: delete.bottomAnchor, constant: 16),
            edit.centerXAnchor.constraint(equalTo: self.centerXAnchor)
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
