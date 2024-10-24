//
//  GreenCartApp.swift
//  GreenCart
//
//  Created by Zain Malik on 15/10/2024.
//

import SwiftUI
import Firebase

@main
struct GreenCartApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            NavigationView {
                WelcomeView()
            }
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
      print("Configured")


    return true
  }
}
