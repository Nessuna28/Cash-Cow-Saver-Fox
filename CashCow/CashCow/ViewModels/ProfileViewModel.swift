//
//  ProfileViewModel.swift
//  CashCow
//
//  Created by Angelique Freier on 20.11.23.
//

import Foundation
import UIKit


class ProfileViewModel: ObservableObject {
    
    init() {
        if let uid = AuthManager.shared.auth.currentUser?.uid {
            FirebaseRepository.fetchUser(with: uid) { fireUser in
                guard let fireUser else { return }
                
                self.fireUser = fireUser
            }
        }
    }
    
    // MARK: - Variables
    
    @Published var fireUser: FireUser?
    
    @Published var selectedImage: UIImage?
    
    
    // MARK: - Functions
    
    
    
    
    func updateUser() {
        
        if let uid = fireUser?.id {
            FirebaseRepository.updateUser(with: uid, lastName: fireUser?.lastName ?? "", firstName: fireUser?.firstName ?? "", birthday: fireUser?.birthday ?? Date(), domicile: fireUser?.domicile ?? "", children: fireUser?.children ?? 0)
            
            FirebaseRepository.fetchUser(with: uid) { fireUser in
                guard let fireUser else { return }
                
                self.fireUser = fireUser
            }
        }
    }
    
    
    func deleteUser() {
        
        if let uid = fireUser?.id {
            FirebaseRepository.deleteUser(with: uid)
        }
    }
}
