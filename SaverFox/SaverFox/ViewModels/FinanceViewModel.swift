//
//  FinanceViewModel.swift
//  SaverFox
//
//  Created by Angelique Freier on 15.12.23.
//

import Foundation

class FinanceViewModel: ObservableObject {
    
    init() {
        finance = [
//            Finance(childId: "1", date: Date(), category: "Einnahmen", icon: "", fromOrFor: "Mutti", title: "Taschengeld", sumOfMoney: 15.00),
//            Finance(childId: "2", date: Date(), category: "Einnahmen", icon: "", fromOrFor: "Mutti", title: "für Zeugnis", sumOfMoney: 5.00),
//            Finance(childId: "3", date: Date(), category: "Ausgaben", icon: "", fromOrFor: "Tedi", title: "für Kuscheltier", sumOfMoney: 6.50)
        ]
        
        filterIncomeAndExpenses()
        calculateActualTotal()
    }
    
    // MARK: - Variables
    
    @Published var initialAmountAsString: String?
    @Published var initialAmount: Double?
    
    @Published var showAlert = false
    @Published var errorDescription = ""
    
    @Published var finance: [Finance]
    
    @Published var revenue = [Finance]()
    @Published var expenditure = [Finance]()
    @Published var sumRevenue = 0.00
    @Published var sumExpenditure = 0.00
    @Published var currentSum = 0.0
    
    @Published var showRevenueSheet = false
    @Published var showExpenditureSheet = false

    
    
    // MARK: - Functions
    
    func setInitialAmount(amount: String) {
        
        if amount.contains(".") {
            if let value = Double(amount), !value.isNaN {
                initialAmount = value
                calculateActualTotal()
            } else {
                errorDescription = "Gib bitte eine Zahl ein! \n Beispiel: 10.00"
                showAlert.toggle()
            }
        } else {
            errorDescription = "Gib bitte eine Kommazahl mit einem Punkt anstatt ein Komma ein! \n Beispiel: 10.00"
            showAlert.toggle()
        }
    }
    
    
    private func filterIncomeAndExpenses() {
        
        for finance in finance {
            if finance.category == "Einnahmen" {
                revenue.append(finance)
                sumRevenue += finance.sumOfMoney
            } else if finance.category == "Ausgaben" {
                expenditure.append(finance)
                sumExpenditure += finance.sumOfMoney
            }
        }
    }
    
    
    private func calculateActualTotal() {
        
        currentSum += (initialAmount ?? 0.0) + sumRevenue - sumExpenditure
    }
    
    
    func openRevenueSheet() {
        
        showRevenueSheet.toggle()
    }
    
    
    func closeRevenueSheet() {
        
        showRevenueSheet = false
    }
    
    
    func openExpenditureSheet() {
        
        showExpenditureSheet.toggle()
    }
    
    
    func closeExpenditureSheet() {
        
        showExpenditureSheet = false
    }
}
