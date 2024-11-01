//
//  SignUpViewController.swift
//  WA7_<Tang>_<9626>
//
//  Created by evan tang on 10/29/24.
//

import UIKit
import Alamofire

class SignUpViewController: UIViewController {

    let signScreen = SignUpView()
    
    override func loadView() {
        view = signScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        signScreen.confrimButton.addTarget(self, action: #selector(onButtonSignUpTapped), for: .touchUpInside)
    }
    
    @objc func onButtonSignUpTapped() {
        
        if let name = signScreen.userName.text,
            let email = signScreen.loginEmail.text,
            let password = signScreen.loginPass.text {
            
            if isValidEmail(email) {
                let user = UserSignUp(name: name, email: email, password: password)
                signUpUser(user: user)
            } else {showErrorAlert(message: "you need an valid email")}
        } else {showErrorAlert(message: "please set your name and password!")}
    }
    
    func signUpUser(user: UserSignUp) {
        if let url = URL(string: APIConfigs.baseURL + "register") {
            AF.request(url, method: .post, parameters: [
                "name": user.name,
                "email": user.email,
                "password": user.password
            ])
            .responseString(completionHandler: {response in
                let status = response.response?.statusCode
                
                switch response.result{
                    
                case.success(let data):
                    if let uwStatusCode = status{
                        switch uwStatusCode{
                        case 200...299:
                            print("Sign up successfully!")
                            break
                            
                        case 400...499:
                            print(data)
                            break
                            
                        default:
                            print(data)
                            break
                        }
                    }
                    break
                    
                case .failure(let error):
                    print(error)
                    break
                }
            })
        } else {showErrorAlert(message: "URL is invalid!")}
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
