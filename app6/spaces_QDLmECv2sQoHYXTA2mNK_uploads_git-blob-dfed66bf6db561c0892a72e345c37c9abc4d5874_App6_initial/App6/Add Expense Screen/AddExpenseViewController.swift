//
//  AddExpenseViewController.swift
//  App6
//
//  Created by Sakib Miazi on 5/18/23.
//

import UIKit

class AddExpenseViewController: UIViewController {
    
    //MARK: delegate to ViewController when getting back...
    var delegate:ViewController!
    
    //MARK: by default Groceries is selected...
    var selectedType = "Groceries"

    //MARK: initializing the ADDExpenseView...
    let addExpenseScreen = AddExpenseView()
    
    //MARK: set the current view to addExpenseScreen...
    override func loadView() {
        view = addExpenseScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //MARK: adding menu to buttonSelectType...
        addExpenseScreen.buttonSelectType.menu = getMenuTypes()
        
        //MARK: adding the action for tapping on buttonAdd...
        addExpenseScreen.buttonAdd.addTarget(self, action: #selector(onAddButtonTapped), for: .touchUpInside)

        
    }
    
    func getMenuTypes() -> UIMenu{
        var menuItems = [UIAction]()
        
        for type in Utilities.types{
            let menuItem = UIAction(title: type,handler: {(_) in
                                self.selectedType = type
                                self.addExpenseScreen.buttonSelectType.setTitle(self.selectedType, for: .normal)
                            })
            menuItems.append(menuItem)
        }
        
        return UIMenu(title: "Select type", children: menuItems)
    }
    
    //MARK: action for tapping buttonAdd..
    @objc func onAddButtonTapped(){
        var title:String?
        if let titleText = addExpenseScreen.textFieldTitle.text{
            if !titleText.isEmpty{
                title = titleText
            }else{
                //do your thing to alert user...
            }
        }
        
        var amount = 0.0
        if let amountText = addExpenseScreen.textFieldAmount.text{
            if !amountText.isEmpty{
                if let uwAmount = Double(amountText){
                    amount = uwAmount
                }else{
                    //alert the user that it's not a valid input...
                }
            
                
            }else{
                //do your thing to alert the user...
            }
            
        }
        
        let newExpense = Expense(title: title, amount: amount, type: selectedType)
        delegate.delegateOnAddExpense(expense: newExpense)
        navigationController?.popViewController(animated: true)
    }

}
