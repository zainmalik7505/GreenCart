//
//  HomeViewModel.swift
//  GreenCart
//
//  Created by Zain Malik on 23/10/2024.
//

import Foundation
import SwiftUI

class HomeViewModel: ObservableObject{
    
    static var shared: HomeViewModel = HomeViewModel()
    
    @Published var seletTab: Int = 0
}
