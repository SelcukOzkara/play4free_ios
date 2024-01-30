//
//  User.swift
//  Play4Free
//
//  Created by Selcuk Özkara on 29.01.24.
//

import Foundation

struct User : Codable {
    var id: String
    var username: String
    var email: String
    var registeredAt: Date 
}
