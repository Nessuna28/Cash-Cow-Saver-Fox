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
    
    @StateObject private var authViewModel = AuthViewModel()
    
    
    var body: some Scene {
        WindowGroup {
            if authViewModel.userIsLoggedIn {
                OverviewView()
            } else {
                OnboardingView1()
                    .environmentObject(authViewModel)
            }
        }
    }
}
