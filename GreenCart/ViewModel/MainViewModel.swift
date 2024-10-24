//
//  MainViewModel.swift
//  GreenCart
//
//  Created by Zain Malik on 17/10/2024.
//

import Foundation

//Not Used Yet

class MainViewModel: ObservableObject {
    
    static let shared: MainViewModel = MainViewModel()
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isShowPassword: Bool = false
    @Published var userName: String = "" 
}
