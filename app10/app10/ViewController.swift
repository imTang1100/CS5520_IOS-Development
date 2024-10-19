//
//  ViewController.swift
//  app10
//
//  Created by evan tang on 10/17/24.
//

import UIKit


class ViewController: UIViewController {


    let mainScreen = MainScreenView()
    //MARK: list to display the contact names in the TableView...
    var contactNames = [String]()
    
    override func loadView() {
        view = mainScreen
    }
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //get all contact names when the main screen loads...
        getAllContacts()
        title = "Contacts API Testing"
    }

    
    func getAllContacts(){
        if let url = URL(string: APIConfigs.baseURL + "getall"){
            AF.request(url, method: .get)
                .responseString(completionHandler: { response in
                        print(response.result)
                    }
                )
        }
    }
}

