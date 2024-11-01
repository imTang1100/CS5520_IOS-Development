//
//  Notes.swift
//  WA7_<Tang>_<9626>
//
//  Created by evan tang on 10/29/24.
//

import Foundation

struct Note: Codable {
    let id: String
    let userId: String
    let text: String
}

struct Notes: Codable {
    let notes: [Note]
}
