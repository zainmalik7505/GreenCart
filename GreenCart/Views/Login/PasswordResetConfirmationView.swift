//
//  CheckEmailView.swift
//  GreenCart
//
//  Created by Zain Malik on 21/10/2024.
//

import SwiftUI

struct PasswordResetConfirmationView: View {
    @Environment(\.presentationMode) var presentationMode // Used to dismiss the view
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()

            // Email Icon
            Image(systemName: "envelope.fill")
                .resizable()
                .frame(width: 80, height: 60)
                .foregroundColor(.blue)

            // Message Text
            Text("Check your email for a password reset link")
                .font(.title2)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
            
            Text("We’ve sent you an email with a link to reset your password. Please check your inbox and follow the instructions.")
                .font(.body)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)

            Spacer()
            
            // Back to Login Button
            
            NavigationLink(destination: LoginInView()) {
                Text("Back to Login")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.horizontal, 40)
            }
            Spacer()
        }
    }
}

#Preview {
    PasswordResetConfirmationView()
}
