//
//  ChildAuthViewModel.swift
//  CashCow
//
//  Created by Angelique Freier on 22.11.23.
//

import Foundation
import FirebaseAuth

class ChildAuthViewModel: ObservableObject {
    
    // MARK: - Variables
    
    private let authManager = AuthManager.shared
    
    @Published var familyMember: String = ""
    @Published var lastName: String?
    @Published var firstName: String = ""
    @Published var birthday: Date?
    
    
    
    // MARK: - Functions
    
    func registerChild(loginName: String, loginImage: String) {
        
        authManager.registerChild(loginName: loginName, loginImage: loginImage) { child in
            guard let child else { return }
            
            if let uid = AuthManager.shared.auth.currentUser?.uid {
                ChildProfileRepository.createChild(with: uid, familyMember: self.familyMember, lastName: self.lastName ?? "", firstName: self.firstName, birthday: self.birthday ?? Date(), loginName: loginName, loginImage: loginImage)
            }
        }
    }
}
