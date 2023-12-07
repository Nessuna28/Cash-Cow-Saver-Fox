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
    
    @Published var loginNameExists = false
    
    @Published var showSheetChildAccount = false
    @Published var showSheetNewChild = false
    
    
    // MARK: - Functions
    
    func checkLoginName(name: String) {
        
        AuthManager.shared.database.collection("children").whereField("loginName", isEqualTo: name).getDocuments { querySnapshot, error in
            guard let querySnapshot = querySnapshot, error == nil else {
                print("Error checking for existing child:", error ?? "Unknown error")
                return
            }
            
            if !querySnapshot.isEmpty {
                self.loginNameExists = true
                
                print("A child with the same login name already exists.")
            } else {
                self.loginNameExists = false
            }
        }
    }
    
    
    func createChild() {
        
        if let uid = self.authManager.auth.currentUser?.uid {
            FirebaseRepository.createChild(with: uid, familyMember: self.familyMember, lastName: self.lastName ?? "", firstName: self.firstName, birthday: self.birthday ?? Date(), loginName: self.loginName, loginImage: self.loginImage)
        }
    }
    
    
    
    func updateChild(id: String) {
        
        FirebaseRepository.updateChild(with: id, familyMember: fireChild?.familyMember ?? "", lastName: fireChild?.lastName ?? "", firstName: fireChild?.firstName ?? "", birthday: fireChild?.birthday ?? Date(), loginName: "", loginImage: fireChild?.loginImage ?? "")
    }
    
    
    func deleteChild(id: String) {
        
        FirebaseRepository.deleteChild(with: id)
    }
}
