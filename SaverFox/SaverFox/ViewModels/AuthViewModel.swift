//
//  ChildProfileViewModel.swift
//  SaverFox
//
//  Created by Angelique Freier on 07.12.23.
//

import Foundation
import SwiftUI

class AuthViewModel: ObservableObject {
    
    init() {
        self.selectedLoginName = ""
        self.selectedLoginImage = ""
    }
    
    
    // MARK: - Variables
    
    @AppStorage("childIsLoggedIn") var childIsLoggedIn = false
    
    @Published var selectedLoginName: String
    @Published var selectedLoginImage: String
    
    @Published var currentChild: Child?
    
    @Published var incorrectData = ""
    
    
    
    // MARK: - Functions
    
    func fetchChild() {
        
        FirestoreRepository.fetchChild(with: selectedLoginName) { child in
            self.currentChild = child
            
            self.checkLoginData()
        }
    }
    
    
    private func checkLoginData() {
        
        if currentChild == nil {
            incorrectData = "Diesen Loginnamen gibt es nicht."
        } else {
            if selectedLoginImage == currentChild?.loginImage {
                childIsLoggedIn = true
            } else {
                incorrectData = "Dein Loginbild ist leider falsch."
            }
        }
    }
    
    
    func logoutChild() {
        
        currentChild = nil
        childIsLoggedIn = false
    }
}
