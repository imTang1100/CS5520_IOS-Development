//
//  User.swift
//  WA7_<Tang>_<9626>
//
//  Created by evan tang on 10/29/24.
//

import Foundation

struct User: Codable{
    var id: String
    var name: String
    var email: String
    
    init(id: String, name: String, email: String) {
        self.id = id
        self.name = name
        self.email = email
    }
}
