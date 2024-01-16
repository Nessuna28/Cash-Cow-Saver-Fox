//
//  ChildrenListViewModel.swift
//  CashCow
//
//  Created by Angelique Freier on 23.11.23.
//

import Foundation
import FirebaseFirestore
import SwiftUI

class ChildrenListViewModel: ObservableObject {
    
    // MARK: - Variables
    
    @Published var children = [FireChild]()
    
    @Published var profileImages = [String: UIImage?]()
    
    private var listener: ListenerRegistration?
    
    
    // MARK: - Functions
    
    func fetchChildren() {
        
        guard let userId = AuthManager.shared.auth.currentUser?.uid else { return }
        
        listener = AuthManager.shared.database.collection("children").whereField("parentId", isEqualTo: userId)
            .addSnapshotListener { querySnapshot, error in
                if let error {
                    print("Fetching children failed:", error)
                    return
                }
                
                guard let documents = querySnapshot?.documents else {
                    print("No document!")
                    return
                }
                
                self.children = documents.compactMap { queryDocumentSnapshot -> FireChild? in
                    try? queryDocumentSnapshot.data(as: FireChild.self)
                }
            }
    }
    
    
    func downloadPictures() {
       
        for child in self.children {
            FirebaseRepository.downloadChildProfilePhoto(profilePicture: child.profilePicture) { image in
                self.profileImages[child.id ?? ""] = image
            }
        }
    }
    
    
    func getImage(forLoginImage title: String) -> Image {
        
        guard let image = LoginImages.allCases.first(where: { $0.title == title }) else { return Image("") }
        
        return image.image
    }
    
    
    func removeListener() {
        
        children.removeAll()
        listener?.remove()
    }
}
