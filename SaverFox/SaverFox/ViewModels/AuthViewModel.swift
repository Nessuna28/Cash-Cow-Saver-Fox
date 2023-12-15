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
}
