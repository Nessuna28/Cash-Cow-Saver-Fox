//
//  ChildProfileViewModel.swift
//  CashCow
//
//  Created by Angelique Freier on 22.11.23.
//

import Foundation
import UIKit

class ChildProfileViewModel: ObservableObject {
    
    init() {
        self.profileImage = UIImage(named: Strings.defaultProfilePicture)
    }
    
    
    // MARK: - Variables
    
    private let authManager = AuthManager.shared
    
    @Published var currentChildId: String?
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
    
    @Published var selectedImage: UIImage?
    @Published var profileImage: UIImage?
    
    
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
    
    
    func fetchChild() {
        
        if let id = currentChildId {
            print("ChildViewModel: \(id)")
            FirebaseRepository.fetchChild(with: id) { fireChild in
                self.fireChild = fireChild
                print("ChildViewModel: \(self.fireChild?.firstName ?? "kein Kind")")
                self.downloadPhoto()
            }
        }
    }
    
    
    func updateChild(id: String) {
        
        uploadPhoto()
        
        FirebaseRepository.updateChild(with: id, familyMember: fireChild?.familyMember ?? "", lastName: fireChild?.lastName ?? "", firstName: fireChild?.firstName ?? "", birthday: fireChild?.birthday ?? Date(), loginName: "", loginImage: fireChild?.loginImage ?? "")
    }
    
    
    func deleteChild(id: String) {
        
        FirebaseRepository.deleteChild(with: id)
    }
    
    
    private func uploadPhoto() {
        
        if let id = fireChild?.id {
            FirebaseRepository.uploadPhoto(with: id, collection: "children", image: selectedImage)
        }
    }
    
    
    private func downloadPhoto() {
        
        FirebaseRepository.downloadPhoto(collection: "children") { image in
            
            self.profileImage = image
        }
    }
}
