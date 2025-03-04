//
//  AuthenticationManager.swift
//  GreenCart
//
//  Created by Zain Malik on 18/10/2024.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseStorage


enum AuthProviderOption: String{
    case email = "password"
    case google = "google.com"
}


struct AuthDataResultModel{
    let uid: String
    let email: String?
    let photoUrl: String?
    
    init(user: User) {
        self.uid = user.uid
        self.email = user.email
        self.photoUrl = user.photoURL?.absoluteString
    }
}

final class AuthenticationManager{
    
    static let shared = AuthenticationManager()
    
    let storage: Storage
    let fireStore : Firestore
    
    private init(){
        self.storage = Storage.storage()
        self.fireStore = Firestore.firestore()
    }
    

    func getRegisteredUser() throws -> AuthDataResultModel{
        guard let registeredUser = Auth.auth().currentUser else{
            throw URLError(.badServerResponse)
        }
        return AuthDataResultModel(user: registeredUser)
    }
    
    func getProviders() throws -> [AuthProviderOption] {
        guard let providerData = Auth.auth().currentUser?.providerData else {
            throw URLError(.badServerResponse)
        }
        
        var providers: [AuthProviderOption] = []
        for provider in providerData {
            if let option = AuthProviderOption(rawValue: provider.providerID) {
                providers.append(option)
            }else{
                assertionFailure("Provider Option not Find: \(provider.providerID)")
            }
        }
        
        return providers
    }
    
    
    func logOut() throws{
        try Auth.auth().signOut()
    }
    
    
}

// MARK: Sign In Email
extension AuthenticationManager{
    func createUser(email: String, username:String, password: String) async throws -> AuthDataResultModel{
        let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
        
        await storeUserInFireStore(uid: authDataResult.user.uid, email: authDataResult.user.email ?? "", username: username)
        

        return AuthDataResultModel(user: authDataResult.user)
    }
    
    
    func signInUser(email: String, password: String) async throws -> AuthDataResultModel{
        let authDataResult = try await Auth.auth().signIn(withEmail: email, password: password)
        return AuthDataResultModel(user: authDataResult.user)
    }
    
    
    func resetPassword(email: String) async throws {
        try await Auth.auth().sendPasswordReset(withEmail: email)
    }
    
    
    func updatePassword(password:String) async throws{
        guard let user = Auth.auth().currentUser else{
            throw URLError(.badServerResponse)
        }
        
        try await user.updatePassword(to: password)
    }
    
    
    func updatePassword(email:String) async throws{
        guard let user = Auth.auth().currentUser else{
            throw URLError(.badServerResponse)
        }
        
        try await user.sendEmailVerification(beforeUpdatingEmail: email)
    }
}

//MARK: FireStore
extension AuthenticationManager{
    
    func storeUserInFireStore(uid: String, email: String, username: String) async {
        let user = UserModel(uid: uid, username: username, email: email)
        
        do {
            let userData = user.toDictionary()
            try await fireStore.collection("users").document(uid).setData(userData)
        } catch {
            print("Error storing user: \(error)")
        }
    }
    
    
}
