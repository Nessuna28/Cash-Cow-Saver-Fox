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
                
                self.downloadPhoto()
            }
        }
        
        self.profileImage = UIImage(named: Strings.defaultProfilePicture)
    }
    
    // MARK: - Variables
    
    @Published var fireUser: FireUser?
    
    @Published var selectedImage: UIImage?
    @Published var profileImage: UIImage?
    
    
    
    // MARK: - Functions
    
    private func uploadPhoto() {
        
        if let uid = fireUser?.id {
            FirebaseRepository.uploadPhoto(with: uid, collection: "users", image: selectedImage)
        }
    }
    
    
    private func downloadPhoto() {
        
        FirebaseRepository.downloadPhoto(collection: "users") { image in
            
            self.profileImage = image
        }
    }
    
    
    func updateUser() {
        
        if let uid = fireUser?.id {
            uploadPhoto()
            
            FirebaseRepository.updateUser(with: uid, lastName: fireUser?.lastName ?? "", firstName: fireUser?.firstName ?? "", birthday: fireUser?.birthday ?? Date(), domicile: fireUser?.domicile ?? "", children: fireUser?.children ?? 0)
            
            FirebaseRepository.fetchUser(with: uid) { fireUser in
                guard let fireUser else { return }
                
                self.fireUser = fireUser
                self.downloadPhoto()
            }
        }
    }
    
    
    func deleteUser() {
        
        if let uid = fireUser?.id {
            FirebaseRepository.deleteUser(with: uid)
        }
    }
}
