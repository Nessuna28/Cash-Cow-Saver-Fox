//
//  ChildProfileViewModel.swift
//  CashCow
//
//  Created by Angelique Freier on 22.11.23.
//

import Foundation

class ChildProfileViewModel: ObservableObject {
    
    
    // MARK: - Variables
    
    private let authManager = AuthManager.shared
    
    @Published var fireChild: FireChild?
    
    @Published var familyMember: String = ""
    @Published var lastName: String?
    @Published var firstName: String = ""
    @Published var birthday: Date?
    
    @Published var loginName: String = ""
    @Published var loginImage: String = ""
    
    
    // MARK: - Functions
    
    func createChild() {
        
        if let uid = authManager.auth.currentUser?.uid {
            ChildProfileRepository.createChild(with: uid, familyMember: self.familyMember, lastName: self.lastName ?? "", firstName: self.firstName, birthday: self.birthday ?? Date(), loginName: loginName, loginImage: loginImage)
        }
    }
    
    
    func updateChild(id: String) {
        
        ChildProfileRepository.updateChild(with: id, familyMember: fireChild?.familyMember ?? "", lastName: fireChild?.lastName ?? "", firstName: fireChild?.firstName ?? "", birthday: fireChild?.birthday ?? Date(), loginName: "", loginImage: fireChild?.loginImage ?? "")
    }
    
    
    func deleteChild(id: String) {
        
        ChildProfileRepository.deleteChild(with: id)
    }
}
