//
//  ProfileViewModel.swift
//  CashCow
//
//  Created by Angelique Freier on 20.11.23.
//

import Foundation

class ProfileViewModel: ObservableObject {
    
    // MARK: - Variables
    
    @Published var fireUser: FireUser?
    
    
    // MARK: - Functions
    
    func updateUser() {
        
        if let uid = AuthManager.shared.auth.currentUser?.uid {
            ProfileRepository.updateUser(with: uid)
            
            ProfileRepository.fetchUser(with: uid) { fireUser in
                guard let fireUser else { return }
                
                self.fireUser = fireUser
            }
        }
    }
    
    
    func deleteUser() {
        
        ProfileRepository.deleteUser(with: AuthManager.shared.auth.currentUser?.uid ?? "")
    }
}
