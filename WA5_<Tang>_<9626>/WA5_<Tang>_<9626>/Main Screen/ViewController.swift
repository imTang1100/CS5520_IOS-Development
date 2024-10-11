//
//  ViewController.swift
//  WA5_<Tang>_<9626>
//
//
//  Created by evan tang on 10/10/24.
//

import UIKit

class ViewController: UIViewController {
    
    let firstScrren = FirstScreenView()
    
    var contacts = [Contact]()

    //MARK: predefined types of expenses...
    let types = ["Cell", "Work", "Home"]
    
    override func loadView() {
        view = firstScrren
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "My Contacts"
        
        firstScrren.tableViewContact.delegate = self
        firstScrren.tableViewContact.dataSource = self
        
        //MARK: setting the add button to the navigation controller...
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add, target: self, action: #selector(onAddBarButtonTapped)
        )
        
        //MARK: recognizing the taps on the app screen, not the keyboard...
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardOnTap))
        tapRecognizer.cancelsTouchesInView = false
        view.addGestureRecognizer(tapRecognizer)
    }
    
    //MARK: Hide Keyboard...
    @objc func hideKeyboardOnTap(){
        //MARK: removing the keyboard from screen...
        view.endEditing(true)
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
        let addDetailController = DetailScreenViewController()
        addDetailController.delegate = self
        addDetailController.contact = self.contacts[indexPath.row]
        navigationController?.pushViewController(addDetailController, animated: true)
    }
    
    
}

