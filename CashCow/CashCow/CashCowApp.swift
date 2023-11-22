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
    
    // MARK: - Variables
    
    @AppStorage("onboarding") private var onboarding = false
    
    @StateObject private var authViewModel = AuthViewModel()
    @StateObject private var profileViewModel = ProfileViewModel()
    @StateObject private var selectedTab = TabViewModel()
    
    
    var body: some Scene {
        WindowGroup {
            if authViewModel.userIsLoggedIn {
                OverviewView()
                    .environmentObject(selectedTab)
                    .environmentObject(authViewModel)
                    .environmentObject(profileViewModel)
            } else {
                OnboardingView1()
                    .environmentObject(authViewModel)
            }
        }
    }
}

