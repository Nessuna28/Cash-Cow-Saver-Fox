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
    
    
    func removeListener() {
        
        children.removeAll()
        listener?.remove()
    }
}
