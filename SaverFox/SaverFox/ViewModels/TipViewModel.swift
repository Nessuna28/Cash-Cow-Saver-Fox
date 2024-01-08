//
//  TipViewModel.swift
//  SaverFox
//
//  Created by Angelique Freier on 05.01.24.
//

import Foundation

class TipViewModel: ObservableObject {
    
    // MARK: - Variables
    
    @Published var currentTip = ""
    
    let tips = [Strings.tip1, Strings.tip2, Strings.tip3, Strings.tip4, Strings.tip5]
    
    
    // MARK: - Functions
    
    func setCurrentTip() {
        
        currentTip = tips.randomElement() ?? Strings.noTip
    }
}
