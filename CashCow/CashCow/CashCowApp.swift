//
//  CashCowApp.swift
//  CashCow
//
//  Created by Angelique Freier on 16.11.23.
//

import SwiftUI
import Firebase

@main
struct CashCowApp: App {
    
    init() {
        FirebaseConfiguration.shared.setLoggerLevel(.min)
        FirebaseApp.configure()
    }
    
    
    var body: some Scene {
        WindowGroup {
            if authViewModel.userIsLoggedIn {
                HomeView()
            } else {
                OnboardingView1()
            }
        }
        .environmentObject(authViewModel)
        .environmentObject(profileViewModel)
        .environmentObject(choiceOptionViewModel)
    }
    
    
    // MARK: - Variables
    
    @StateObject private var authViewModel = AuthViewModel()
    @StateObject private var profileViewModel = ProfileViewModel()
    @StateObject private var choiceOptionViewModel = ChoiceOptionViewModel()
}
