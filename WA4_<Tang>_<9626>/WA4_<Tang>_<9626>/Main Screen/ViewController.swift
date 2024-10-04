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

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contacts", for: indexPath) as! TableViewContactsCell
        cell.labelName.text = contacts[indexPath.row].name
        if let email = contacts[indexPath.row].email{
            cell.labelEmail.text = "\(email)"
        }
        if let phone = contacts[indexPath.row].phoneNumber, let phoneType = contacts[indexPath.row].phoneType {
            cell.labelPhone.text = "\(phone) (\(phoneType))"
        }
        return cell
    }
    
    //MARK: deal with user interaction with a cell...
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(self.contacts[indexPath.row])
    }
    
}

