//
//  UserViewModel.swift
//  Play4Free
//
//  Created by Selcuk Özkara on 30.01.24.
//

import Foundation
import FirebaseAuth

class UserViewModel :  ObservableObject {
    
    init(){
        
    }
    
    private let firebaseManager = FirebaseMananger.shared
    @Published var user: User?
    
    var userIsLoggedIn: Bool {
        user != nil
    }
    
    var email: String {
        user?.email ?? ""
    }
    
    private func createUser(id: String, username: String, email: String){
        let user = User(id: id, username: username, email: email, registeredAt: Date())
        
        do {
            try firebaseManager.db.collection("users").document(id).setData(from: user)
        } catch {
            print("Fehler beim Speichern des Users: \(error.localizedDescription)")
        }
    }
    
    private func fetchUser(id: String){
        firebaseManager.db.collection("users").document(id).getDocument{ doc, error in
            if let error {
                print("Fehler beim fetchen des Users:", error.localizedDescription)
                return
            }
            
            guard let doc else {
                print("Dokument existiert nicht!")
                return
            }
            
            do {
                let user = try doc.data(as: User.self)
                self.user = user
            } catch {
                print("Im Dokument ist kein User", error.localizedDescription)
            }
        }
    }
    
    private func checkAuth(){
        guard let currentUser = firebaseManager.auth.currentUser else{
            print("Nicht eingeloggt")
            return
        }
        
        self.fetchUser(id: currentUser.uid)
    }
    
    func login(email: String, password: String){
        firebaseManager.auth.signIn(withEmail: email, password: password) { authResult, error in
            if let error {
                print("Login fehlgeschlagen:", error.localizedDescription)
                return
            }
            
            guard let authResult, let email = authResult.user.email else {return}
            print("User mit der Email '\(email)' ist eingeloggt mit der id '\(authResult.user.uid)'")
            
            self.fetchUser(id: authResult.user.uid)
        }
    }
    
    func register(email: String, username: String, password: String){
        firebaseManager.auth.createUser(withEmail: email, password: password){ authResult, error in
            
            if let error {
                print("Registrierung fehlgeschlagen:", error.localizedDescription)
                return
            }
            
            guard let authResult, let email = authResult.user.email else {return}
            
            print("User mit email '\(email)' ist regestriert mit der id '\(authResult.user.uid)'")
            
            self.createUser(id: authResult.user.uid , username: username, email: email)
            
            self.login(email: email, password: password)
        }
    }
    
    func logout(){
        do{
            try firebaseManager.auth.signOut()
            self.user = nil
            
            print("User wurde abgemeldet!")
        } catch {
            print("Error signing out: ", error.localizedDescription)
        }
    }
}
