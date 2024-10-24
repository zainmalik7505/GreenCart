//
//  UserModel.swift
//  GreenCart
//
//  Created by Zain Malik on 22/10/2024.
//

import Foundation

struct UserModel: Codable {
    let uid: String
    let username: String  
    let email: String
    
    func toDictionary() -> [String: Any] {
        return [
            "uid": uid,
            "username": username,
            "email": email
        ]
    }
}
