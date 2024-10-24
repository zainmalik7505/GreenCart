//
//  ForgetPasswordModel.swift
//  GreenCart
//
//  Created by Zain Malik on 21/10/2024.
//

import Foundation

final class ForgetPasswordModel:ObservableObject {
    
    @Published var email:String = ""
    
    
    func resetPasswordWithEmail() async throws{
        
        guard !email.isEmpty else {
            print("Please Enter Email")
            return
        }
        
        let _ = try await AuthenticationManager.shared.resetPassword(email: email)
    }
}
