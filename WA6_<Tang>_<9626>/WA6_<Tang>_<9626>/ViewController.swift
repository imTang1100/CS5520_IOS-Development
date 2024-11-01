//
//  ViewController.swift
//  app10
//
//  Created by evan tang on 10/17/24.
//

import UIKit
import Alamofire
import Foundation
 

class ViewController: UIViewController {

    
    let mainScreen = MainScreenView()
    //MARK: list to display the contact names in the TableView...
    var contactNames = [String]()
    let notificationCenter = NotificationCenter.default
    
    override func loadView() {
        view = mainScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //get all contact names when the main screen loads...
        
        //MARK: setting the delegate and data source...
        mainScreen.tableViewContacts.dataSource = self
        mainScreen.tableViewContacts.delegate = self
        
        //MARK: removing the separator line...
        
        notificationCenter.addObserver(self, selector: #selector(notificationReceivedForDelete(notification:)), name:  .textFromScondScreen, object: nil)
        
        notificationCenter.addObserver(self, selector: #selector(notificationReceivedForEdit(notification:)), name:  .editFromSecond, object: nil)
        
        getAllContacts()
        title = "Contacts API Testing"
        
        mainScreen.buttonAdd.addTarget(self, action: #selector(onButtonAddTapped), for: .touchUpInside)
    }
    
    @objc func notificationReceivedForDelete(notification: Notification) {
        guard let data = notification.object as? [String], data.count == 2 else {return}
        
        let yes = data[0]
        let name = data[1]
        if yes == "true" {
            self.deleteContact(name: name)
        }
    }
    
    @objc func notificationReceivedForEdit(notification: Notification) {
        guard let data = notification.object as? (String, Contact) else {return}
        print("about to Edit")
        editContact(name: data)
    }
    
    func deleteContact(name: String){
        let parameters = ["name":name]
        if let url = URL(string: APIConfigs.baseURL+"delete"){
            AF.request(url, method:.get,
                       parameters: ["name":name],
                       encoding: URLEncoding.queryString)
                .responseString(completionHandler: { response in
                
                //MARK: retrieving the status code...
                let status = response.response?.statusCode
                 
                switch response.result{
                case .success(let data):
                    //MARK: there was no network error...
                    
                    //MARK: status code is Optional, so unwrapping it...
                    if let uwStatusCode = status{
                        switch uwStatusCode{
                            case 200...299:
                            //MARK: the request was valid 200-level...
                                //MARK: show alert with details...
                                self.getAllContacts()
                                print("successful delete and say bye to your contact")
                                break
                    
                            case 400...499:
                            //MARK: the request was not valid 400-level...
                                print(data)
                                break
                    
                            default:
                            //MARK: probably a 500-level error...
                                print(data)
                                break
                    
                        }
                    }
                    break
                    
                case .failure(let error):
                    //MARK: there was a network error...
                    print(error)
                    break
                }
            })
        }
    }
    //MARK: on Add Contact button tapped...

    func editContact(name: (String, Contact)){
        
        let parameters = ["name":name.0]
        let newContact = name.1
        if let url = URL(string: APIConfigs.baseURL+"delete"){
            AF.request(url, method:.get,
                       parameters: ["name":name.0],
                       encoding: URLEncoding.queryString)
                .responseString(completionHandler: { response in
                
                //MARK: retrieving the status code...
                let status = response.response?.statusCode
                 
                switch response.result{
                case .success(let data):
                    //MARK: there was no network error...
                    
                    //MARK: status code is Optional, so unwrapping it...
                    if let uwStatusCode = status{
                        switch uwStatusCode{
                            case 200...299:
                            //MARK: the request was valid 200-level...
                                //MARK: show alert with details...
                                self.addANewContact(contact: newContact)
                                self.getAllContacts()
                                print("successfully edited")
                                break
                    
                            case 400...499:
                            //MARK: the request was not valid 400-level...
                                print(data)
                                break
                    
                            default:
                            //MARK: probably a 500-level error...
                                print(data)
                                break
                    
                        }
                    }
                    break
                    
                case .failure(let error):
                    //MARK: there was a network error...
                    print(error)
                    break
                }
            })
        }
    }
    //MARK: on Add Contact button tapped...
    
    @objc func onButtonAddTapped(){
        if !isValidEmail(mainScreen.textFieldAddEmail.text!) {
            showErrorAlert(message: "please input valid email!")
            return
        }
        if let name = mainScreen.textFieldAddName.text,
           let email = mainScreen.textFieldAddEmail.text,
           let phoneText = mainScreen.textFieldAddPhone.text{
            
            if let phone = Int(phoneText) {
                if !String(phone).isEmpty {
                    let contact = Contact(name: name, email: email, phone: phone)
                    addANewContact(contact: contact)
                }
            } else {
                showErrorAlert(message: "phone couldn't be empty!")
            }
        }
        else{
            showErrorAlert(message: "please input valid info!")
        }
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: email)
    }
    
    func showErrorAlert(message: String) {
        let alert = UIAlertController(title: "Error!", message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alert, animated: true)
    }
    
    //MARK: add a new contact call: add endpoint...
    func addANewContact(contact: Contact){
        if let url = URL(string: APIConfigs.baseURL+"add"){
            
            AF.request(url, method:.post, parameters:
                        [
                            "name": contact.name,
                            "email": contact.email,
                            "phone": contact.phone
                        ])
                .responseString(completionHandler: { response in
                    //MARK: retrieving the status code...
                    let status = response.response?.statusCode
                    
                    switch response.result{
                    case .success(let data):
                        //MARK: there was no network error...
                         
                        //MARK: status code is Optional, so unwrapping it...
                        if let uwStatusCode = status{
                            switch uwStatusCode{
                                case 200...299:
                                //MARK: the request was valid 200-level...
                                self.getAllContacts()
                                self.clearAddViewFields()
                                    break
                        
                                case 400...499:
                                //MARK: the request was not valid 400-level...
                                    print(data)
                                    break
                        
                                default:
                                //MARK: probably a 500-level error...
                                    print(data)
                                    break
                        
                            }
                        }
                        break
                        
                    case .failure(let error):
                        //MARK: there was a network error...
                        print(error)
                        break
                    }
                })
        }else{
            //alert that the URL is invalid...
        }
    }
    
    func clearAddViewFields(){
        mainScreen.textFieldAddName.text = ""
        mainScreen.textFieldAddEmail.text = ""
        mainScreen.textFieldAddPhone.text = ""
    }
    
    //MARK: get all contacts...
    func getAllContacts(){
        if let url = URL(string: APIConfigs.baseURL + "getall"){
            AF.request(url, method: .get).responseString(completionHandler: { response in
                //MARK: retrieving the status code...
                let status = response.response?.statusCode
                
                switch response.result{
                case .success(let data):
                    //MARK: there was no network error...
                    
                    //status code is Optional, so unwrapping it...
                    if let uwStatusCode = status{
                        switch uwStatusCode{
                            case 200...299:
                            //MARK: the request was valid 200-level...
                                var names = data.components(separatedBy: "\n")
                                self.contactNames = names
                                self.contactNames.removeLast()
                                self.mainScreen.tableViewContacts.reloadData()
                                print(self.contactNames)
                                break
                    
                            case 400...499:
                            //MARK: the request was not valid 400-level...
                                print(data)
                                break
                    
                            default:
                            //MARK: probably a 500-level error...
                                print(data)
                                break
                    
                        }
                    }
                    break
                    
                case .failure(let error):
                    //MARK: there was a network error...
                    print(error)
                    break
                }
            })
        }
    }
    
    //MARK: get details of a contact...
        func getContactDetails(name: String){
            let parameters = ["name":name]
            if let url = URL(string: APIConfigs.baseURL+"details"){
                AF.request(url, method:.get,
                           parameters: ["name":name],
                           encoding: URLEncoding.queryString)
                    .responseString(completionHandler: { response in
                    
                    //MARK: retrieving the status code...
                    let status = response.response?.statusCode
                    
                    switch response.result{
                    case .success(let data):
                        //MARK: there was no network error...
                        
                        //MARK: status code is Optional, so unwrapping it...
                        if let uwStatusCode = status{
                            switch uwStatusCode{
                                case 200...299:
                                //MARK: the request was valid 200-level...
                                    //MARK: show alert with details...
                                    self.showDetailsInAlert(data: data)
                                    break
                        
                                case 400...499:
                                //MARK: the request was not valid 400-level...
                                    print(data)
                                    break
                        
                                default:
                                //MARK: probably a 500-level error...
                                    print(data)
                                    break
                        
                            }
                        }
                        break
                        
                    case .failure(let error):
                        //MARK: there was a network error...
                        print(error)
                        break
                    }
                })
            }
        }
    
    
    
    func showDetailsInAlert(data: String){
    
        let parts = data.components(separatedBy: ",")
        print(parts)
        let addDetailScreenView = DetailsScreenViewController()
        
        //MARK: trim the whitespaces from the strings, and show alert...
        let name = parts[0].trimmingCharacters(in: .whitespacesAndNewlines)
        let email = parts[1].trimmingCharacters(in: .whitespacesAndNewlines)
        let phone = Int(parts[2].trimmingCharacters(in: .whitespacesAndNewlines)) ?? 000
        
        let detailContact = Contact(name: name, email: email, phone: phone)
        addDetailScreenView.contact = detailContact
        navigationController?.pushViewController(addDetailScreenView, animated: true)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "names", for: indexPath) as! ContactsTableViewCell
        cell.labelName.text = contactNames[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        getContactDetails(name: self.contactNames[indexPath.row])
    }
}

