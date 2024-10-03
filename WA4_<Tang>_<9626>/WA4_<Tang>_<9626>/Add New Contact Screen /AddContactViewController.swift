//
//  AddContactViewController.swift
//  WA4_<Tang>_<9626>
//
//  Created by evan tang on 10/2/24.
//

import UIKit

class AddContactViewController: UIViewController {
    
    var delegate: ViewController!
    var selectedType = "Cell"
    
    //MARK: initializing the ADDExpenseView...
    let addContactScreen = AddContactView()
    
    //MARK: set the current view to addExpenseScreen...
    override func loadView() {
        view = addContactScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: setting the add button to the navigation controller...
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add, target: self, action: #selector(onRightButtonTapped)
        )
        
        addContactScreen.pickerType.dataSource = self
        addContactScreen.pickerType.delegate = self
         

        // Do any additional setup after loading the view.
    }
    
    @objc func onRightButtonTapped(){
        var name:String?
        if let nameText = addContactScreen.textFieldName.text{
            if !nameText.isEmpty{
                name = nameText
            }else{
                //do your thing to alert user...
                return
            }
        }
        
        var email:String?
        if let emailText = addContactScreen.textFieldEmail.text{
            if !emailText.isEmpty{
                email = emailText
            }else{
                //alert the user that it's not a valid input...
                return
            }
        }

        
        let newContact = Contact(name: name, email: email, phoneNumber: Int, phoneType: String, address: String, cityState: String, zipCode: Int)
    
        delegate.delegateOnAddContact(contact: newContact)
        navigationController?.popViewController(animated: true)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//MARK: adopting the required protocols...
extension AddContactViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        //MARK: we are using only one section...
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //MARK: we are displaying the options from Utilities.types...
        return Utilities.types.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        //MARK: updating the selected type when the user picks this row...
        selectedType = Utilities.types[row]
        return Utilities.types[row]
    }
}
