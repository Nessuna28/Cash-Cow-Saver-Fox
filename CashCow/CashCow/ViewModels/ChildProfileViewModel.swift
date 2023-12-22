//
//  ChildProfileViewModel.swift
//  CashCow
//
//  Created by Angelique Freier on 22.11.23.
//

import Foundation
import UIKit

class ChildProfileViewModel: ObservableObject {
    
    // MARK: - Variables
    
    private let authManager = AuthManager.shared
    
    @Published var currentChildId = ""
    @Published var fireChild: FireChild?
    
    @Published var familyMember: String = ""
    @Published var lastName: String = ""
    @Published var firstName: String = ""
    @Published var birthday = Date()
    
    @Published var loginName: String = ""
    @Published var loginImage: String = ""
    
    
    @Published var loginNameExists = false
    
    @Published var showSheetChildAccount = false
    @Published var showSheetNewChild = false
    
    @Published var selectedImage: UIImage?
    @Published var profileImage: UIImage?
    
    
    // MARK: - Functions
    
    func closeChildAccountSheet() {
        
        showSheetChildAccount = false
    }
    
    
    func closeNewChildSheet() {
        
        showSheetNewChild = false
    }
    
    
    func getTitle(forLoginImage title: String) -> String? {
        
        guard let loginImage = LoginImages.allCases.first(where: { $0.rawValue == title }) else {
            return nil
        }
        return loginImage.title
    }
    
    
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
        
        if let parentId = self.authManager.auth.currentUser?.uid {
            FirebaseRepository.createChild(with: parentId, familyMember: self.familyMember, lastName: self.lastName, firstName: self.firstName, birthday: self.birthday, loginName: self.loginName, loginImage: self.loginImage) { childId in
                guard let childId else { return }
                
                self.uploadPhoto(id: childId)
            }
        }
    }
    
    
    func fetchChild() {
        
        if !currentChildId.isEmpty {
            FirebaseRepository.fetchChild(with: currentChildId) { fireChild in
                self.fireChild = fireChild
                self.familyMember = fireChild?.familyMember ?? ""
                self.lastName = fireChild?.lastName ?? ""
                self.firstName = fireChild?.firstName ?? ""
                self.birthday = fireChild?.birthday ?? Date()
                self.loginName = fireChild?.loginName ?? ""
                self.loginImage = fireChild?.loginImage ?? ""
                
                self.downloadPhoto(id: self.currentChildId)
            }
        }
    }
    
    
    func updateChild(id: String) {
        
        uploadPhoto(id: id)
        
        FirebaseRepository.updateChild(with: id, familyMember: self.familyMember, lastName: self.lastName, firstName: self.firstName, birthday: self.birthday, loginName: self.loginName, loginImage: self.loginImage)
    }
    
    
    func deleteChild(id: String) {
        
        FirebaseRepository.deleteChild(with: id)
    }
    
    
    private func uploadPhoto(id: String) {
        
        FirebaseRepository.uploadPhoto(with: id, collection: "children", image: selectedImage)
    }
    
    
    private func downloadPhoto(id: String) {
        
        FirebaseRepository.downloadPhoto(collection: "children", id: id) { image in
            
            self.profileImage = image
        }
    }
}
