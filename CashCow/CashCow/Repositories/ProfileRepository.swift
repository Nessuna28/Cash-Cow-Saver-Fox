//
//  ProfileRepository.swift
//  CashCow
//
//  Created by Angelique Freier on 20.11.23.
//

import Foundation
import FirebaseAuth

class ProfileRepository {
    
    static func createUser(with id: String, email: String, firstName: String) {
        
        let user = FireUser(id: id, email: email, firstName: firstName, registeredAt: Date())
        
        do {
            try AuthManager.shared.database.collection("users").document(id).setData(from: user)
        } catch {
            print("Saving user failed:", error)
        }
    }
    
    
    static func updateUser(with id: String, lastName: String, firstName: String, birthday: Date, domicile: String, children: Int) {
        
        let data = ["lastName": lastName, "firstName": firstName, "birthday": birthday, "domicile": domicile, "children": children] as [String: Any]
        
        AuthManager.shared.database.collection("users").document(id).setData(data, merge: true) { error in
            if let error {
                print("Update user failed:", error)
                return
            }
        }
    }
    
    
    static func fetchUser(with id: String, completion: @escaping (FireUser?) -> Void) {
        
        AuthManager.shared.database.collection("users").document(id).getDocument { document, error in
            if let error {
                print("Fetching user failed:", error)
                completion(nil)
                return
            }
            
            guard let document else {
                print("No document!")
                completion(nil)
                return
            }
            
            do {
                let user = try document.data(as: FireUser.self)
                completion(user)
            } catch {
                print("Document is not a user", error)
            }
        }
    }
    
    
    static func deleteUser(with id: String) {
        
        AuthManager.shared.database.collection("users").document(id).delete { error in
            if let error {
                print("Delete user failed:", error)
                return
            }
        }
    }
}
