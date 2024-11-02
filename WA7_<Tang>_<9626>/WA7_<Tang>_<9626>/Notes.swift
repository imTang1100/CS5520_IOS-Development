//
//  Notes.swift
//  WA7_<Tang>_<9626>
//
//  Created by evan tang on 10/29/24.
//

import Foundation

struct Note: Codable {
    let _id: String
    let userId: String
    var text: String
    let __v: Int
    
    // Custom initializer to strip "Optional(...)"
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self._id = try container.decode(String.self, forKey: ._id)
        self.userId = try container.decode(String.self, forKey: .userId)
        let rawText = try container.decode(String.self, forKey: .text)
        self.text = rawText.replacingOccurrences(of: "Optional(\"", with: "").replacingOccurrences(of: "\")", with: "")
        self.__v = try container.decode(Int.self, forKey: .__v)
    }
    
    enum CodingKeys: String, CodingKey {
        case _id, userId, text, __v
    }
}

struct Notes: Codable {
    let notes: [Note]
}
