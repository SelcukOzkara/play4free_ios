//
//  Play4FreeApp.swift
//  Play4Free
//
//  Created by Selcuk Özkara on 26.01.24.
//

import SwiftUI
import Firebase

@main
struct Play4FreeApp: App {
    
    init(){
        FirebaseConfiguration.shared.setLoggerLevel(.min)
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
