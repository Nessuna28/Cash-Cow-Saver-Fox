//
//  AuthViewModel.swift
//  CashCow
//
//  Created by Angelique Freier on 18.11.23.
//

import Foundation
import FirebaseAuth

class AuthViewModel: ObservableObject {
    
    // MARK: - Variables
    
    private let authManager = AuthManager.shared
    
    @Published var email: String = ""
    @Published var firstName: String = ""
    
    @Published var password: String = ""
    @Published var repeatedPassword: String = ""
    
    @Published var authenticationMode: AuthenticationMode = .register
    
    @Published var user: User?
    @Published var userIsLoggedIn = false
    @Published var fireUser: FireUser?
    
    
    // MARK: - Functions
    
    func loginUser(email: String, password: String) {
        print("hallo ich bin im Login")
        authManager.loginUser(email: email, password: password) { user in
            guard let user else { return }
            
            self.user = user
            self.userIsLoggedIn = true
        }
    }
    
    
    func registerUser(email: String, password: String, repeatedPassword: String) {
        
        authManager.registerUser(email: email, password: password, repeatedPassword: repeatedPassword) { user in
            guard let user else { return }
            
            self.loginUser(email: email, password: password)
            
            self.user = user
            
            ProfileRepository.createUser(with: user.uid, email: email, firstName: Strings.guest)
        }
    }
    
    
    func logoutUser() {
        
        authManager.logoutUser()
        self.userIsLoggedIn = false
    }
    
}
