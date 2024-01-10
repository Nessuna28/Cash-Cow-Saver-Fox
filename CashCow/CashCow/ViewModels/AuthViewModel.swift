//
//  AuthViewModel.swift
//  CashCow
//
//  Created by Angelique Freier on 18.11.23.
//

import Foundation
import Firebase
import FirebaseAuth
import SwiftUI

class AuthViewModel: ObservableObject {
    
    init() {
        checkAuth()
    }
    
    // MARK: - Variables
    
    private let authManager = AuthManager.shared
    
    @Published var email: String = ""
    @Published var firstName: String = ""
    
    @Published var password: String = ""
    @Published var repeatedPassword: String = ""
    
    @Published var authenticationMode: AuthenticationMode = .register
    
    @Published var user: User?
    
    
    // MARK: - Computed Property
    
    var userIsLoggedIn: Bool {
        user != nil
    }
    
    
    
    // MARK: - Functions
    
    private func checkAuth() {
        
        guard let currentUser = authManager.auth.currentUser else {
            print("Not logged in")
            return
        }
        
        self.user = currentUser
    }
    
    
    func loginUser(email: String, password: String) {
        
        authManager.loginUser(email: email, password: password) { user in
            guard let user else { return }
            
            self.user = user
        }
    }
    
    
    func registerUser(email: String, password: String, repeatedPassword: String) {
        
        authManager.registerUser(email: email, password: password, repeatedPassword: repeatedPassword) { user in
            guard let user else { return }
            
            FirebaseRepository.createUser(with: user.uid, email: email, firstName: Strings.guest)
            FirebaseRepository.createSettings(with: user.uid, settings: FireSettings(userId: AuthManager.shared.auth.currentUser?.uid ?? "", backgroundColor: UIColor(.white).colorToString(), textColor: UIColor(.black).colorToString(), userFontSize: Strings.medium, isDarkModeEnabled: false))
            
            self.loginUser(email: email, password: password)
            self.createChoiceOptions(id: user.uid)
        }
    }
    
    
    func logoutUser() {
        
        authManager.logoutUser()
        self.user = nil
    }
    
    
    private func createChoiceOptions(id: String) {
        
        ChoiceOptionViewModel.shared.createChoiceOption(id: id)
    }
    
}
