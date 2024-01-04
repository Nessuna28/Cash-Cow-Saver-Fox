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
    }
    
    // MARK: - Variables
    
    @AppStorage("loginName") var currentLoginName = ""
    
    @Published var child: Child?
    
    @Published var profilePicture: UIImage?
    
    @Published var selectedImage: UIImage?
    
    
    @Published var loginName = ""
    @Published var loginImage = ""
    
    @Published var loginNameExists = false
    
    @Published var selectedLoginImage = ""
    @Published var currentLoginImage: Image?
    
    @Published var updateLoginName = false
    @Published var updateLoginImage = false
    
    @Published var initialAmount = 0.0
    
    @Published var showAlert = false
    
    
    // MARK: - Functions
    
    func getTitle(forLoginImage title: String) {
        
        guard let image = LoginImage.allCases.first(where: { $0.rawValue == selectedLoginImage }) else { return }
        
        loginImage = image.title
    }
    
    
    func getImage(forLoginImage title: String) -> Image {
        
        guard let image = LoginImage.allCases.first(where: { $0.title == title }) else { return Image("") }
        
        return image.image
    }
    
    
    func fetchChild(selectedLoginName: String) {
        
        FirestoreRepository.fetchChild(with: selectedLoginName) { child in
            self.child = child
        }
        
        self.currentLoginImage = self.getImage(forLoginImage: child?.loginImage ?? "")
        self.loginImage = child?.loginImage ?? ""
        self.downloadPhoto()
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
    
    
    func updateLoginData() {
        
        guard let id = self.child?.id else { return }
        
        if loginName.isEmpty {
            loginName = self.child?.loginName ?? ""
        }
        
        if loginImage.isEmpty {
            loginImage = self.child?.loginImage ?? ""
        }
        
        FirestoreRepository.updateLoginData(with: id, loginName: loginName, loginImage: loginImage)
        
        currentLoginName = loginName
        
        fetchChild(selectedLoginName: currentLoginName)
        
        downloadPhoto()
    }
    
    
    func updateInitialAmount() {
        
        guard let id = self.child?.id else { return }
        
        FirestoreRepository.updateInitialAmount(with: id, initialAmount: initialAmount)
        
        fetchChild(selectedLoginName: currentLoginName)
    }
    
    
    
    func uploadPhoto() {
        
        guard let id = self.child?.id else { return }
        
        FirestoreRepository.uploadPhoto(with: id, collection: "children", image: selectedImage)
    }
    
    
    private func downloadPhoto() {
        
        guard let child = self.child else { return }
        
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
    
    
    func toggleShowAlert() {
        
        showAlert.toggle()
    }
    
}
