//
//  UserNoteViewController.swift
//  WA7_<Tang>_<9626>
//
//  Created by evan tang on 10/31/24.
//

import UIKit
import Alamofire

class UserNoteViewController: UIViewController {
    
    var loginResponse: LoginResponse!
    let addUserNoteScreen = UserNoteView()
    var userNotes = [Note]()
    
    override func loadView() {
        view = addUserNoteScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //addUserNoteScreen.addButton.addTarget(self, action: #selector(addNoteOnTapped), for: .touchUpInside)

        addUserNoteScreen.tableViewNotes.dataSource = self
        addUserNoteScreen.tableViewNotes.delegate = self
        
        addUserNoteScreen.tableViewNotes.reloadData()

        getAllNotes()
    }

    
    func getAllNotes() {
        if let url = URL(string: APIConfigs.noteURL + "getall"){
            AF.request(url, method: .get, headers: ["x-access-token": self.loginResponse.token]).responseData(completionHandler: { response in
                let status = response.response?.statusCode
                 
                switch response.result{
                case .success(let data):
                    //MARK: there was no network error...
                     
                    //status code is Optional, so unwrapping it...
                    if let uwStatusCode = status{
                        switch uwStatusCode{
                            case 200...299:
                            //MARK: the request was valid 200-level...
                            self.userNotes.removeAll()
                            let decoder = JSONDecoder()
                            do {
                                let receiveData = try decoder.decode(Notes.self, from: data)
                                 
                                self.userNotes = receiveData.notes
                                DispatchQueue.main.async {
                                    print("Reloading table with \(self.userNotes.count) notes")
                                    self.addUserNoteScreen.tableViewNotes.reloadData()
                                }
                                self.addUserNoteScreen.tableViewNotes.setNeedsLayout()
                                self.addUserNoteScreen.tableViewNotes.layoutIfNeeded()
                            }catch let decodingError {
                                print("Decoding error: \(decodingError)")
                            }

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
    
    
    @objc func addNoteOnTapped() {
        if let url = URL(string: APIConfigs.noteURL+"post"){
            
            let parameters = ["text": addUserNoteScreen.textAddNote.text]
            let headers: HTTPHeaders = [
                "x-access-token": loginResponse.token
            ]
            AF.request(url, method: .post, parameters: parameters, encoding: URLEncoding.httpBody, headers: headers)
                .responseString { response in
                    //print("Server Response: \(response)")
                    switch response.result {
                    case .success(let responseString):
                    self.getAllNotes()
                    case .failure(let error):
                        print("Request failed with error: \(error)")
                    }
                }
        }
    }
}

extension UserNoteViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Number of rows: \(userNotes.count)")
        return userNotes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "text", for: indexPath) as? NotesTableViewCell else{ fatalError("Failed to dequeue NotesTableViewCell") }
        cell.labelName.text = userNotes[indexPath.row].text
          return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //getContactDetails(name: self.contactNames[indexPath.row])
    }
}
