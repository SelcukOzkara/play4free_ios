//
//  SystemReq.swift
//  Play4Free
//
//  Created by Selcuk Özkara on 29.01.24.
//

import Foundation

struct SystemReq : Codable {
    var os: String
    var processor: String
    var memory: String
    var graphics: String
    var storage: String
}
