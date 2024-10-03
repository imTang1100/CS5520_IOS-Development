//
//  ViewController.swift
//  WA4_<Tang>_<9626>
//
//  Created by evan tang on 10/2/24.
//

import UIKit

class ViewController: UIViewController {
    
    let firstScrren = FirstScreenView()
    
    var contacts = [Contact]()

    //MARK: predefined types of expenses...
    let types = ["Cell", "Work", "Home"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "My Contacts"
        
        firstScrren.tableViewContact.delegate = self
        firstScrren.tableViewContact.dataSource = self
        
        //MARK: setting the add button to the navigation controller...
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add, target: self, action: #selector(onAddBarButtonTapped)
        )
    }
        
    @objc func onAddBarButtonTapped(){
        let addContactController = AddContactViewController()
        addContactController.delegate = self
        navigationController?.pushViewController(addContactController, animated: true)
    }
        
    func delegateOnAddContact(contact: Contact){
        contacts.append(contact)
        firstScrren.tableViewContact.reloadData()
    }
        // Do any additional setup after loading the view.

}

