//
//  FirebaseMananger.swift
//  Play4Free
//
//  Created by Selcuk Özkara on 30.01.24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

class FirebaseMananger {
    static let shared = FirebaseMananger()
    
    let auth = Auth.auth()
    let db = Firestore.firestore()
    
    var userId: String? {
            auth.currentUser?.uid
        }
}

