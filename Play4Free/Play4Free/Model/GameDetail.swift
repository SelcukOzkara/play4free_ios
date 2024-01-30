//
//  GameDetail.swift
//  Play4Free
//
//  Created by Selcuk Özkara on 29.01.24.
//

import Foundation

struct GameDetail : Codable{
    var title : String
    var description: String
    var game_url : String
    var platform: String
    var minimum_system_requirements : [SystemReq]
    var screenshots : [GameScreenshots]
}
