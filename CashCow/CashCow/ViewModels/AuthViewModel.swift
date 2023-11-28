//
//  AuthViewModel.swift
//  CashCow
//
//  Created by Angelique Freier on 18.11.23.
//

import Foundation
import FirebaseAuth

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
            
            ProfileRepository.createUser(with: user.uid, email: email, firstName: Strings.guest)
            
            self.loginUser(email: email, password: password)
        }
    }
    
    
    func logoutUser() {
        
        authManager.logoutUser() { user in
            self.user = user
        }
    }
    
}
