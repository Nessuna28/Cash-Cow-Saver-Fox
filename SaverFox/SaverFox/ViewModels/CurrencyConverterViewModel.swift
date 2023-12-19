//
//  CurrencyConverterViewModel.swift
//  SaverFox
//
//  Created by Angelique Freier on 15.12.23.
//

import Foundation

@MainActor
class CurrencyConverterViewModel: ObservableObject {
    
    
    // MARK: - Variables
    
    @Published var showSheet = false
    
    @Published var amount = 0
    @Published var fromCurrency = ""
    @Published var toCurrency = ""
    
    @Published var data = ApiResponse(success: true, query: CurrencyConverter(from: "", to: "", amount: 0), result: 0.0)
    
    
    
    // MARK: - Functions
    
    func openSheet() {
        
        showSheet = true
    }
    
    
    func closeSheet() {
        
        showSheet = false
    }
    
    
    func setAmount(amount: String) {
        
        if let value = Int(amount) {
            self.amount = value
        }
    }
    
    
    func getCode(forCurrency title: String) -> String? {
        
        guard let currency = Currency.allCases.first(where: { $0.rawValue == title }) else {
            return nil
        }
        return currency.code
    }
    
    
    func fetchData() {
        
        Task {
            do {
                self.data = try await CurrencyConverterRepository.fetchData(fromCurrency: fromCurrency, toCurrency: toCurrency, amount: amount)
            } catch {
                print("Error loading data from API", error.localizedDescription)
            }
        }
    }
}
