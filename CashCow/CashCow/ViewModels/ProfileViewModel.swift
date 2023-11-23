//
//  ProfileViewModel.swift
//  CashCow
//
//  Created by Angelique Freier on 20.11.23.
//

import Foundation

class ProfileViewModel: ObservableObject {
    
    init() {
        if let uid = AuthManager.shared.auth.currentUser?.uid {
            
            ProfileRepository.fetchUser(with: uid) { fireUser in
                guard let fireUser else { return }
                
                self.fireUser = fireUser
            }
        }
    }
    
    // MARK: - Variables
    
    @Published var fireUser: FireUser?
    
    
    // MARK: - Functions
    
    func updateUser() {
        
        if let uid = AuthManager.shared.auth.currentUser?.uid {
            ProfileRepository.updateUser(with: uid)
            print("update: \()")
            
            ProfileRepository.fetchUser(with: uid) { fireUser in
                guard let fireUser else { return }
                print("fetch: \(fireUser.id)")
                
                self.fireUser = fireUser
            }
        }
    }
    
    
    func deleteUser() {
        
        if let uid = AuthManager.shared.auth.currentUser?.uid {
            ProfileRepository.deleteUser(with: uid)
        }
    }
}
