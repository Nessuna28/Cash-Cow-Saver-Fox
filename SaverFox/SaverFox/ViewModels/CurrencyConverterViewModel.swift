//
//  CurrencyConverterViewModel.swift
//  SaverFox
//
//  Created by Angelique Freier on 15.12.23.
//

import Foundation

class CurrencyConverterViewModel: ObservableObject {
    
    // MARK: - Variables
    
    @ Published var showSheet = false
    
    
    // MARK: - Functions
    
    func openSheet() {
        
        showSheet = true
    }
    
    
    func closeSheet() {
        
        showSheet = false
    }
}
