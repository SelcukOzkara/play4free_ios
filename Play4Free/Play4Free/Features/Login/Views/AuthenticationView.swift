//
//  AuthenticationView.swift
//  Play4Free
//
//  Created by Selcuk Özkara on 30.01.24.

import SwiftUI

struct AuthenticationView: View {
    
    @EnvironmentObject private var userViewModel: UserViewModel
    
    @State private var mode: AuthenticationMode = .login
    @State private var email = ""
    @State private var password = ""
    @State private var name = ""
    
    private var disableAuthentication: Bool {
        email.isEmpty || password.isEmpty
    }
    
    
    var body: some View {
        ZStack{
            PlayerView()
                .ignoresSafeArea(.all)
            
            VStack{
                Image("logo")
                    .resizable()
                    .frame(width: 110, height: 150)
                    .scaledToFit()
                    
                VStack(spacing: 14){
                    
                    
                    if mode == .register{
                        TextField("Name", text: $name)
                            .textFieldStyle(.roundedBorder)
                            .font(.headline)
                            .frame(width: 250)
                    }
                    
                    TextField("E-Mail", text: $email)
                        .textFieldStyle(.roundedBorder)
                        .font(.headline)
                        .frame(width: 250)
                    
                    SecureField("Password", text: $password)
                        .textFieldStyle(.roundedBorder)
                        .font(.headline)
                        .frame(width: 250)
                    
                    PrimaryButton(title: mode.title, action: authenticate)
                        .disabled(disableAuthentication)
                    
                    TextButton(title: mode.alternativeTitle, action: switchAuthenticationMode)
                    
                }
                .textInputAutocapitalization(.never)
                .frame(width: 300, height: 300, alignment: .center)
                .background(Color.black.opacity(0.8)
                    .blur(radius: 5))
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 10)))
            }
            
        }
        
        
        
    }
    
    private func switchAuthenticationMode() {
        mode = mode == .login ? .register : .login
    }
    
    private func authenticate() {
        switch mode {
        case .login:
            userViewModel.login(email: email, password: password)
        case .register:
            userViewModel.register(email: email,username: name,  password: password)
        }
    }
}

#Preview {
    AuthenticationView()
}
