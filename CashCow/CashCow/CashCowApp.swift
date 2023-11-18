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
    
    @StateObject private var userViewModel = UserViewModel(repository: FirebaseRepository())
    
    
    var body: some Scene {
        WindowGroup {
            if userViewModel.userIsLoggedIn {
                OverviewView()
            } else {
                OnboardingView1()
                    .environmentObject(userViewModel)
            }
        }
    }
}
