//
//  ChildProfileViewModel.swift
//  SaverFox
//
//  Created by Angelique Freier on 07.12.23.
//

import Foundation
import SwiftUI
import Combine

class AuthViewModel: ObservableObject {
    
    init() {
        self.selectedLoginName = ""
        self.selectedLoginImage = ""
    }
    
    
    // MARK: - Variables
    
    private var cancellable: AnyCancellable?
    
    @AppStorage("childIsLoggedIn") var childIsLoggedIn = false
    
    @Published var selectedLoginName: String
    @Published var selectedLoginImage: String
    
    @Published var errorMessage = ""
    
    
    
    // MARK: - Functions
    
    func fetchChild() {
        
        FirestoreRepository.shared.fetchChild(with: selectedLoginName, loginImage: selectedLoginImage)
        cancellable = FirestoreRepository.shared.child
            .sink { child in
                guard let child = child else {
                    self.errorMessage = Strings.loginFailed
                    return
                }
                
                self.childIsLoggedIn = true
            }
    }
    
    
    func logoutChild() {
        
        childIsLoggedIn = false
    }
}
