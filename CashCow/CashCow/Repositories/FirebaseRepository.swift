//
//  FirebaseRepository.swift
//  CashCow
//
//  Created by Angelique Freier on 17.11.23.
//

import Foundation


class FirebaseRepository {
    
    // MARK: - Variables
    
    @Published var user: FireUser?
    @Published var children: [FireChild]?
    @Published var settingsUser: FireSettings?
    
    
    // MARK: - Computed Property
    
    var userIsLoggedIn: Bool {
        user != nil
    }
    
    var email: String {
        user?.email ?? ""
    }
    
    var firstName: String {
        user?.firstName ?? "Gast"
    }
    
    
    
    // MARK: - Functions
    
    // MARK: - User
    private func checkAuth() {
        
        guard let currentUser = FirebaseManager.shared.auth.currentUser else {
            print("Not logged in")
            return
        }
        
        self.fetchUser(with: currentUser.uid)
    }
    
    func loginUser(email: String, password: String) {
        
        FirebaseManager.shared.auth.signIn(withEmail: email, password: password) { authResult, error in
            if let error {
                print("Login failed:", error)
                return
            }
            
            guard let authResult = authResult else { return }
            
            self.fetchUser(with: authResult.user.uid)
        }
    }
    
    
    func registerUser(email: String, password: String, repeatedPassword: String, firstName: String) {
        
        if password == repeatedPassword {
            FirebaseManager.shared.auth.createUser(withEmail: email, password: password) { authResult, error in
                if let error {
                    print("Registration failed:", error)
                    return
                }
                
                guard let authResult = authResult else { return }
                
                self.createUser(with: authResult.user.uid, email: email, firstName: firstName)
                self.loginUser(email: email, password: password)
            }
        }
    }
    
    func createUser(with id: String, email: String, firstName: String) {
        
        let user = FireUser(id: id, email: email, firstName: firstName, registeredAt: Date())
        
        do {
            try FirebaseManager.shared.database.collection("users").document(id).setData(from: user)
        } catch {
            print("Saving user failed:", error)
        }
    }
    
    func fetchUser(with id: String) {
        
        FirebaseManager.shared.database.collection("users").document(id).getDocument { document, error in
            if let error {
                print("Fetching user failed:", error)
                return
            }
            
            guard let document else {
                print("No document!")
                return
            }
            
            do {
                let user = try document.data(as: FireUser.self)
                self.user = user
            } catch {
                print("Document is not a user", error)
            }
        }
    }
    
    func updateUser(with id: String) {
        
        let data = ["id": id]
        
        FirebaseManager.shared.database.collection("users").document(id).setData(data, merge: true) { error in
            if let error {
                print("Update user failed:", error)
                return
            }
        }
    }
    
    func logoutUser() {
        
        do {
            try FirebaseManager.shared.auth.signOut()
            self.user = nil
        } catch {
            print("Error signing out: ", error)
        }
    }
    
    func deleteUser(with id: String) {
        
        FirebaseManager.shared.database.collection("users").document(id).delete() { error in
            if let error {
                print("Delete user failed:", error)
                return
            }
        }
    }
    
    
    // MARK: - Child
    
}

