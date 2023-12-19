//
//  FinanceViewModel.swift
//  SaverFox
//
//  Created by Angelique Freier on 15.12.23.
//

import Foundation

class FinanceViewModel: ObservableObject {
    
    init() {
        filterIncomeAndExpenses()
        calculateActualTotal()
    }
    
    // MARK: - Variables
    
    @Published var showRevenueSheet = false
    @Published var showExpenditureSheet = false
    
    @Published var finance = [Finance(childId: "1", date: Date(), category: "Einnahmen", icon: "", fromOrFor: "Mutti", title: "Taschengeld", sumOfMoney: 15.00),
                              Finance(childId: "2", date: Date(), category: "Einnahmen", icon: "", fromOrFor: "Mutti", title: "für Zeugnis", sumOfMoney: 5.00),
                              Finance(childId: "3", date: Date(), category: "Ausgaben", icon: "", fromOrFor: "Tedi", title: "für Kuscheltier", sumOfMoney: 6.50)]
    
    @Published var revenue = [Finance]()
    @Published var expenditure = [Finance]()
    @Published var sumRevenue = 0.00
    @Published var sumExpenditure = 0.00
    @Published var currentSum = 0.00
    
    
    // MARK: - Functions
    
    func openRevenueSheet() {
        
        showRevenueSheet = true
    }
    
    
    func openExpenditureSheet() {
        
        showExpenditureSheet = true
    }
    
    
    func closeRevenueSheet() {
        
        showRevenueSheet = false
    }
    
    
    func closeExpenditureSheet() {
        
        showExpenditureSheet = false
    }
    
    
    private func filterIncomeAndExpenses() {
        
        for finance in finance {
            if finance.category == "Einnahmen" {
                self.revenue.append(finance)
                self.sumRevenue += finance.sumOfMoney
            } else if finance.category == "Ausgaben" {
                self.expenditure.append(finance)
                self.sumExpenditure += finance.sumOfMoney
            }
        }
    }
    
    
    private func calculateActualTotal() {
        
        self.currentSum = self.sumRevenue - self.sumExpenditure
    }
}
