//
//  ViewController.swift
//  WA7_<Tang>_<9626>
//
//  Created by evan tang on 10/29/24.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    let mainScreen = MainScreenView()
    
    override func loadView() {
        view = mainScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainScreen.confrimButton.addTarget(self, action: #selector(onButtonLogInTapped), for: .touchUpInside)
        mainScreen.signUpButton.addTarget(self, action: #selector(onButtonSignUpTapped), for: .touchUpInside)
    }
    
    @objc func onButtonLogInTapped(){
        if !isValidEmail(mainScreen.loginEmail.text!) {
            showErrorAlert(message: "please input valid email!")
            return
        }

        let email = mainScreen.loginEmail.text
        let password = mainScreen.loginPass.text

        logIn(email: email ?? "", password: password ?? "")
    }
    
    @objc func onButtonSignUpTapped() {
        let signupScreen = SignUpViewController()
        navigationController?.pushViewController(signupScreen, animated: true)
    }
    
    func logIn(email: String, password: String) {
        if let url = URL(string: APIConfigs.baseURL + "login"){
            
            AF.request(url, method: .post, parameters: ["email": email,
                                                        "password": password]).responseData(completionHandler: { response in
                let status = response.response? .statusCode
                
                switch response.result{
                case .success(let data):
                     
                    if let uwStatusCode = status{
                        switch uwStatusCode{
                            case 200...299:
                            //MARK: the request was valid 200-level...
                            let decoder = JSONDecoder()
                            do{
                                let receiveData = try decoder.decode(LoginResponse.self, from: data)
                                print(receiveData.auth)
                                print(receiveData.token)
                                self.getTheUserNotes(response: receiveData)
                            }catch{
                                
                            }
                                break
                    
                            case 400...499:
                            //MARK: the request was not valid 400-level...
                                print("please sign up first")
                                break
                    
                            default:
                            //MARK: probably a 500-level error...
                                print("server is out of service")
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
    
    func getTheUserNotes(response: LoginResponse) {
        let addNewScreen = UserNoteViewController()
        addNewScreen.loginResponse = response
        navigationController?.pushViewController(addNewScreen, animated: true)
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
}

