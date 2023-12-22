//
//  ProfileViewModel.swift
//  SaverFox
//
//  Created by Angelique Freier on 15.12.23.
//

import Foundation
import SwiftUI
import UIKit


class ProfileViewModel: ObservableObject {
    
    init() {
        fetchChild(selectedLoginName: currentLoginName)
        currentLoginImage = getLoginImage()
    }
    
    // MARK: - Variables
    
    @AppStorage("loginName") var currentLoginName = ""
    
    @Published var child: Child?
    @Published var profilePicture: UIImage?
    
    @Published var selectedImage: UIImage?
    
    @Published var lastName = ""
    @Published var firstName = ""
    @Published var familyMember = ""
    @Published var birthday = Date()
    @Published var loginName = ""
    @Published var loginImage = ""
    
    @Published var loginNameExists = false
    
    @Published var selectedLoginImage = ""
    @Published var currentLoginImage: Image?
    
    @Published var updateLoginName = false
    @Published var updateLoginImage = false
    
    
    // MARK: - Functions
    
    func getTitle(forLoginImage title: String) {
        
        guard let image = LoginImage.allCases.first(where: { $0.rawValue == selectedLoginImage }) else { return }
        
        loginImage = image.title
    }
    
    
    func getLoginImage() -> Image {
        
        guard let image = LoginImage.allCases.first(where: { $0.title == child?.loginImage }) else { return Image("") }
        
        return image.image
    }
    
    
    func fetchChild(selectedLoginName: String) {
        
        FirestoreRepository.fetchChild(with: selectedLoginName) { child in
            self.child = child
            
            self.downloadPhoto()
        }
    }
    
    
    func checkLoginName(name: String) {
        
        DatabaseManager.shared.database.collection("children").whereField("loginName", isEqualTo: name).getDocuments { querySnapshot, error in
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
    
    
    func updateChild() {
        
        guard let id = child?.id else { return }
        
        FirestoreRepository.updateChild(with: id, familyMember: child?.familyMember ?? "", lastName: child?.lastName ?? "", firstName: child?.firstName ?? "", birthday: child?.birthday ?? Date(), loginName: child?.loginName ?? "", loginImage: child?.loginImage ?? "")
        
        downloadPhoto()
    }
    
    
    
    func uploadPhoto() {
        
        guard let id = child?.id else { return }
        
        FirestoreRepository.uploadPhoto(with: id, collection: "children", image: selectedImage)
    }
    
    
    private func downloadPhoto() {
        
        guard let child = child else { return }
        
        FirestoreRepository.downloadPhoto(profilePicture: child.profilePicture) { image in
            self.profilePicture = image
        }
    }
    
    
    func toggleUpdateLoginImage() {
        
        updateLoginImage.toggle()
    }
    
    
    func toggleUpdateLoginName() {
        
        updateLoginName.toggle()
    }
    
}
