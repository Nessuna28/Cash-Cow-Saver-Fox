//
//  ChildrenListViewModel.swift
//  CashCow
//
//  Created by Angelique Freier on 23.11.23.
//

import Foundation
import FirebaseFirestore

class ChildrenListViewModel: ObservableObject {
    
    // MARK: - Variables
    
    @Published var children = [FireChild]()
    
    @Published var profileImages: [String: UIImage?]?
    
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
                
                self.downloadPictures()
                print(self.profileImages?.keys)
            }
    }
    
    
    private func downloadPictures() {
        
        for child in children {
            FirebaseRepository.downloadPhoto(collection: "children", id: child.id ?? "") { image in
                
                self.profileImages?[child.id ?? ""] = image
            }
        }
    }
    
    
    func removeListener() {
        
        children.removeAll()
        listener?.remove()
    }
}
