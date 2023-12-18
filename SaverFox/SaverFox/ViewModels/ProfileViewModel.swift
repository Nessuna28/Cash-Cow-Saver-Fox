//
//  ProfileViewModel.swift
//  SaverFox
//
//  Created by Angelique Freier on 15.12.23.
//

import Foundation
import UIKit


class ProfileViewModel: ObservableObject {
    
    // MARK: - Variables
    
    @Published var child: Child?
    @Published var profilePicture: UIImage?
    
    @Published var selectedImage: UIImage?
    
    
    // MARK: - Functions
    
    func updateChild() {
        
        guard let id = child?.id else { return }
        
        FirestoreRepository.updateChild(with: id, familyMember: child?.familyMember ?? "", lastName: child?.lastName ?? "", firstName: child?.firstName ?? "", birthday: child?.birthday ?? Date(), loginName: child?.loginName ?? "", loginImage: child?.loginImage ?? "")
        
        downloadPhoto()
    }
    
    
    
    func uploadPhoto() {
        
        guard let id = child?.id else { return }
        
        FirestoreRepository.uploadPhoto(with: id, collection: "children", image: selectedImage)
    }
    
    
    func downloadPhoto() {
        
        guard let child = child else { return }
        
        FirestoreRepository.downloadPhoto(profilePicture: child.profilePicture) { image in
            self.profilePicture = image
        }
    }
}
