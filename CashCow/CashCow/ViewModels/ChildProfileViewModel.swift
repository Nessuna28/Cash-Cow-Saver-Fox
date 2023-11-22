//
//  ChildProfileViewModel.swift
//  CashCow
//
//  Created by Angelique Freier on 22.11.23.
//

import Foundation

class ChildProfileViewModel: ObservableObject {

    
    // MARK: - Variables
    
    @Published var fireChild: FireChild?
    
    
    // MARK: - Functions
    
    func updateChild(loginName: String) {
        
        ChildProfileRepository.updateChild(with: loginName)
        
        ChildProfileRepository.fetchChild(with: loginName) { fireChild in
            guard let fireChild else { return }
            
            self.fireChild = fireChild
        }
    }
    
    
    func deleteChild(loginName: String) {
        
        ChildProfileRepository.deleteChild(with: loginName)
    }
}
