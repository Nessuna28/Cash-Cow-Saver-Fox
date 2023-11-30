//
//  AuthManager.swift
//  CashCow
//
//  Created by Angelique Freier on 16.11.23.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore
import FirebaseFirestoreSwift

class AuthManager {
    
    static let shared = AuthManager()
    
    let auth = Auth.auth()
    let database = Firestore.firestore()
    
    
    
    // MARK: - Functions
    
    func registerUser(email: String, password: String, repeatedPassword: String, completion: @escaping (User?) -> Void) {
        print("manager: register")
        guard password == repeatedPassword else { return }
        
        auth.createUser(withEmail: email, password: password) { _, error in
            if let error {
                print("Registration failed:", error)
                return
            }
            
            self.loginUser(email: email, password: password, completion: completion)
        }
        
    }
    
    func loginUser(email: String, password: String, completion: @escaping (User?) -> Void) {
        print("manager: login")
        auth.signIn(withEmail: email, password: password) { authResult, error in
            if let error {
                print("Login failed:", error)
                completion(nil)
                return
            }
            
            guard let authResult else {
                print("User not found")
                completion(nil)
                
                return
            }
            
            completion(authResult.user)
        }
    }
    
    
    func logoutUser() {
        print("manager: logout")
        do {
            try auth.signOut()
        } catch {
            print("Error signing out: ", error)
        }
    }
    
}
