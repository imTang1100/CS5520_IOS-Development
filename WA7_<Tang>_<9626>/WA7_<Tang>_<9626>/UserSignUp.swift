//
//  UserSignUp.swift
//  WA7_<Tang>_<9626>
//
//  Created by evan tang on 10/30/24.
//

import Foundation

struct UserSignUp: Codable{
    var name: String
    var email: String
    var password: String
    
    init(name: String, email: String, password: String) {
        self.name = name
        self.email = email
        self.password = password
    }
}
