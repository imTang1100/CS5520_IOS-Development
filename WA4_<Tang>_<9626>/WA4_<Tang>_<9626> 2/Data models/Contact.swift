//
//  Contact.swift
//  WA4_<Tang>_<9626>
//
//  Created by evan tang on 10/2/24.
//

import Foundation

struct Contact{
    var name: String?
    var email: String?
    var phoneNumber: String?
    var phoneType: String?
    var address: String?
    var cityState: String?
    var zipCode: String?
    
    
    
    init(name: String? = nil, email: String? = nil, phoneNumber: String? = nil, phoneType: String? = nil, address: String? = nil, cityState: String? = nil, zipCode: String? = nil) {
        self.name = name
        self.email = email
        self.phoneNumber = phoneNumber
        self.phoneType = phoneType
        self.address = address
        self.cityState = cityState
        self.zipCode = zipCode
    }
    
}
