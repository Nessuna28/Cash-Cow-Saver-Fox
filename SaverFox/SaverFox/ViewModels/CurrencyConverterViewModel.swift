//
//  CurrencyConverterViewModel.swift
//  SaverFox
//
//  Created by Angelique Freier on 15.12.23.
//

import Foundation

class CurrencyConverterViewModel: ObservableObject {
    
    // MARK: - Variables
    
    @Published var showSheet = false
    
    @Published var value = 0.0
    @Published var from = "EUR"
    @Published var to = "PLN"
    
    @Published var data = [CurrencyConverter]()
    
    
    
    // MARK: - Functions
    
    func openSheet() {
        
        showSheet = true
    }
    
    
    func closeSheet() {
        
        showSheet = false
    }
    
    
    func fetchData() {
        
        Task {
            do {
                self.data = try await CurrencyConverterRepository.fetchData()
            } catch {
                print("Error loading data from API", error.localizedDescription)
            }
        }
    }
}
