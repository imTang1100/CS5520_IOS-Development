//
//  ViewController.swift
//  App3
//
//  Created by evan tang on 9/23/24.
//

import UIKit

class ViewController: UIViewController {
    
    var textFieldMessage: UITextField!
    var buttonSend: UIButton!
    var labelMood: UILabel!
    var imageMood: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "Learning Navigation"
        
        //MARK: initializing the UI elements...
        setupTextFieldMessage()
        setupButtonSend()
        
        setupLabelMood()
        setupImageMood()
        
        //MARK: initializing the constraints...
        initConstraints()
        
        //MARK: on buttonSend tap...
        buttonSend.addTarget(self, action: #selector(onButtonSendTapped),
                             for: .touchUpInside)
    }
    
    func setupTextFieldMessage(){
        textFieldMessage = UITextField()
        textFieldMessage.placeholder = "Put your message here"
        textFieldMessage.borderStyle = .roundedRect
        textFieldMessage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textFieldMessage)
    }
    
    func setupButtonSend(){
        buttonSend = UIButton(type: .system)
        buttonSend.setTitle("Send", for: .normal)
        buttonSend.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonSend)
    }
    
    //labelMood...
    func setupLabelMood(){
        labelMood = UILabel()
        labelMood.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(labelMood)
    }
    
    //imageMood...
    func setupImageMood(){
        imageMood = UIImageView()
        imageMood.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageMood)
    }
    
    func initConstraints(){
        
        NSLayoutConstraint.activate([
            // textFieldMessage constraints...
            textFieldMessage.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            textFieldMessage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            // buttonSend constraints...
            buttonSend.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            buttonSend.topAnchor.constraint(equalTo: textFieldMessage.bottomAnchor, constant: 16),
            
            // labelMood constraints...
            labelMood.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            labelMood.topAnchor.constraint(equalTo: buttonSend.bottomAnchor, constant: 16),// labelMood constraints...
            
            // imageMood constraints...
            imageMood.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            imageMood.topAnchor.constraint(equalTo: labelMood.bottomAnchor, constant: 16),
            
        ])
        
    }
    
    @objc func onButtonSendTapped(){
        //initializing a new screen with ShowViewController...
        var showViewController = ShowViewController()
        
        //set the message to ShowViewController's messageFromFirstScreen variable...
        if let unwrappedMessage = textFieldMessage.text{
            if !unwrappedMessage.isEmpty{ // checking if the user has put any message...
                //Sending data...
                showViewController.messageFromFirstScreen = unwrappedMessage
                
                showViewController.delegate = self
                
                //push the screen to Stack...
                navigationController?.pushViewController(showViewController, animated: true)
            }else{
                //Alert the user to put message....
            }
            
        }
    }
    
    
    //MARK: delegated method from ShowViewController...
    func delegateButtonSendMood(mood: String){
        print("The user is \(mood)")
        imageMood.image = UIImage(named: mood.lowercased())
    }
}

