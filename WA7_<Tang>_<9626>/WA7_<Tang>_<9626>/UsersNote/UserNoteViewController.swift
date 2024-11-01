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
    var notes = [String]()
    
    override func loadView() {
        view = addUserNoteScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        getAllNotes()
        addUserNoteScreen.addButton.addTarget(self, action: #selector(addNoteOnTapped), for: .touchUpInside)
        addUserNoteScreen.tableViewNotes.dataSource = self
        addUserNoteScreen.tableViewNotes.delegate = self
        
    }
    
    func getAllNotes() {
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
                            let decoder = JSONDecoder()
                            do {
                                let receiveData = try decoder.decode(Notes.self, from: data)
                                self.notes = receiveData.notes.map { $0.text } // only use text
                                self.addUserNoteScreen.tableViewNotes.reloadData()
                                
                            }catch{
                                print("Error")
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
        if let url = URL(string: APIConfigs.baseURL+"post"){
            
            AF.request(url, method:.post,parameters:
                        [
                            "text": addUserNoteScreen.textAddNote.text,
                        ], headers: [
                            "x-access-token": loginResponse.token
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
                                self.getAllNotes()
                                //self.clearAddViewFields()
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

}

extension UserNoteViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "text", for: indexPath) as! NotesTableViewCell
        cell.labelName.text = notes[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //getContactDetails(name: self.contactNames[indexPath.row])
    }
}
