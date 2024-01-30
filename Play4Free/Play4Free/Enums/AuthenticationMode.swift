//
//  AuthenticationMode.swift
//  Play4Free
//
//  Created by Selcuk Özkara on 30.01.24.
//

import Foundation

enum AuthenticationMode {
    case login, register
    
    
    var title: String {
        switch self {
        case .login: return "Anmelden"
        case .register: return "Registrieren"
        }
    }
    
    var alternativeTitle: String {
        switch self {
        case .login: return "Noch kein Konto? \nRegistrieren"
        case .register: return "Schon registriert? \nAnmelden"
        }
    }
}
