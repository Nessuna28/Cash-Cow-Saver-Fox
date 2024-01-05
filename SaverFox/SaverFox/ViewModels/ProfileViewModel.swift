//
//  ProfileViewModel.swift
//  SaverFox
//
//  Created by Angelique Freier on 15.12.23.
//

import Foundation
import SwiftUI
import UIKit
import Combine


class ProfileViewModel: ObservableObject {
    
    init() {
        
        FirestoreRepository.shared.fetchChild(with: currentLoginName, loginImage: currentLoginImageAsTitle)
        cancellable = FirestoreRepository.shared.child
            .sink { child in
                guard let child else { return }
                
                self.child = child
                self.loginImage = self.getImage(forLoginImage: child.loginImage)
                self.downloadPhoto(child: child)
            }
    }
    
    // MARK: - Variables
    
    private var cancellable: AnyCancellable?
    
    @AppStorage("loginName") var currentLoginName = ""
    @AppStorage("loginImage") var currentLoginImageAsTitle = ""
    
    @Published var child: Child?
    @Published var loginImage: Image?
    
    @Published var profilePicture: UIImage?
    @Published var selectedImage: UIImage?
    
    @Published var selectedLoginName = ""
    @Published var selectedLoginImageAsRawValue = ""
    @Published var selectedLoginImageAsTitle = ""
    
    @Published var loginNameExists = false
    @Published var updateLoginName = false
    @Published var updateLoginImage = false
    
    @Published var initialAmount = 0.0
    
    @Published var showAlert = false
    
    
    // MARK: - Functions
    
    func getTitle(forLoginImage title: String) {
        
        guard let image = LoginImage.allCases.first(where: { $0.rawValue == selectedLoginImageAsRawValue }) else { return }
        
        selectedLoginImageAsTitle = image.title
    }
    
    
    func getImage(forLoginImage title: String) -> Image {
        
        guard let image = LoginImage.allCases.first(where: { $0.title == title }) else { return Image("") }
        
        return image.image
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
        
        guard let id = child?.id else { return }
        
        currentLoginImageAsTitle = selectedLoginImageAsTitle
        
        FirestoreRepository.updateLoginData(with: id, loginName: currentLoginName, loginImage: currentLoginImageAsTitle)
    }
    
    
    func updateInitialAmount() {
        
        guard let id = self.child?.id else { return }
        
        FirestoreRepository.updateInitialAmount(with: id, initialAmount: initialAmount)
    }
    
    
    
    func uploadPhoto() {
        
        guard let id = self.child?.id else { return }
        
        guard let image = selectedImage else { return }
        
        FirestoreRepository.uploadPhoto(with: id, collection: "children", image: image)
    }
    
    
    private func downloadPhoto(child: Child) {
        
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
