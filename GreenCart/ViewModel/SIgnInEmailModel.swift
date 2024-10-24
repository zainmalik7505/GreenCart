//
//  SIgnInEmailModel.swift
//  GreenCart
//
//  Created by Zain Malik on 18/10/2024.
//

import Foundation

@MainActor
final class SignInEmailModel : ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var username = ""
    
    func signUp() async throws {
        guard  !email.isEmpty && !password.isEmpty else{
            print("Enter Valid Email Password")
            return
        }
        
        let _ = try await AuthenticationManager.shared.createUser(email: email, username: username, password: password)
        
    }
    
    func signIn() async throws {
        guard  !email.isEmpty && !password.isEmpty else{
            print("Enter Valid Email Password")
            return
        }
        
            let _ = try await AuthenticationManager.shared.signInUser(email: email, password: password)
        
    }
}
