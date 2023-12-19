//
//  ChildProfileViewModel.swift
//  SaverFox
//
//  Created by Angelique Freier on 07.12.23.
//

import Foundation

class AuthViewModel: ObservableObject {
    
    init() {
        self.selectedtLoginName = ""
        self.selectedtLoginImage = ""
    }
    
    
    // MARK: - Variables
    
    @Published var selectedtLoginName: String
    @Published var selectedtLoginImage: String
    
    @Published var currentChild: Child?
    @Published var childIsLoggedIn = false
    
    @Published var incorrectData = ""
    
    
    
    // MARK: - Functions
    
    func fetchChild() {
        
        FirestoreRepository.fetchChild(with: selectedtLoginName) { child in
            self.currentChild = child
            
            self.checkLoginData()
        }
    }
    
    
    private func checkLoginData() {
        
        if currentChild == nil {
            incorrectData = "Diesen Loginnamen gibt es nicht."
        } else {
            if selectedtLoginImage == currentChild?.loginImage {
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
