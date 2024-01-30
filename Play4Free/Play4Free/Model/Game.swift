//
//  Game.swift
//  Play4Free
//
//  Created by Selcuk Özkara on 29.01.24.
//

import Foundation

struct Game : Codable{
    var id : Int
    var title: String
    var thumbnail: URL
    var platform : String
    var genre : String
}
