//
//  UserViewModel.swift
//  CashCow
//
//  Created by Angelique Freier on 18.11.23.
//

import Foundation
import Combine

class UserViewModel: ObservableObject {
    
    init(repository: FirebaseRepository) {
        self.repository = repository
        
        self.userIsLoggedIn = repository.userIsLoggedIn
    }
    
    // MARK: - Variables
    
    private let repository: FirebaseRepository
    
    @Published var userIsLoggedIn: Bool
    @Published var email: String = ""
    @Published var firstName: String = ""
    
    @Published var password: String = ""
    @Published var repeatedPassword: String = ""
    
    // MARK: - Functions
    
    func loginUser(email: String, password: String) {
        
        repository.loginUser(email: email, password: password)
    }
    
    func registerUser(email: String, password: String, repeatedPassword: String, firstName: String) {
            repository.registerUser(email: email, password: password, repeatedPassword: repeatedPassword, firstName: firstName)
        }
        
        func logoutUser() {
            repository.logoutUser()
        }
    
}
