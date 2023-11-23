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
        
        if let uid = fireUser?.id {
            ProfileRepository.updateUser(with: uid, lastName: fireUser?.lastName ?? "", firstName: fireUser?.firstName ?? "", birthday: fireUser?.birthday ?? Date(), domicile: fireUser?.domicile ?? "", children: fireUser?.children ?? 0)
            
            ProfileRepository.fetchUser(with: uid) { fireUser in
                guard let fireUser else { return }
                
                self.fireUser = fireUser
            }
        }
    }
    
    
    func deleteUser() {
        
        if let uid = fireUser?.id {
            ProfileRepository.deleteUser(with: uid)
        }
    }
}
