//
//  SavingViewModel.swift
//  SaverFox
//
//  Created by Angelique Freier on 21.12.23.
//

import Foundation

class SavingViewModel: ObservableObject {
    
    init() {
            self.savingsGoalList = [
                SavingsGoal(childId: "1", date: calendar.date(from: dateComponents1) ?? Date(), icon: "", title: "Weihnachten", sumOfMoney: 40.00),
//                SavingsGoal(childId: "1", date: calendar.date(from: dateComponents2) ?? Date(), icon: "", title: "Mutti Geburtstag", sumOfMoney: 20.00),
//                SavingsGoal(childId: "1", date: calendar.date(from: dateComponents3) ?? Date(), icon: "", title: "Jill Geburtstag", sumOfMoney: 10.00)
            ]
        }
    
    
    // MARK: - Variables
    
    let calendar = Calendar.current
    let dateComponents1 = DateComponents(year: 2023, month: 12, day: 24)
    let dateComponents2 = DateComponents(year: 2024, month: 2, day: 13)
    let dateComponents3 = DateComponents(year: 2024, month: 3, day: 25)
    
    @Published var savingsGoalList: [SavingsGoal]
    
    @Published var savingsGoal: SavingsGoal?
    
    @Published var date = Date()
    @Published var icon = ""
    @Published var title = ""
    @Published var sumOfMoney = 0.0
    
    @Published var showAlert = false
    @Published var errorDescription = ""
    
    
    
    // MARK: - Functions
    
    func calculateDifference(availableAmount: Double, amount: Double) -> Double {
        
        let differenceAmount = availableAmount - amount
        
        return differenceAmount
    }
    
    
    func setSumOfMoney(amount: String) {
        
        if amount.contains(".") {
            if let value = Double(amount), !value.isNaN {
                sumOfMoney = value
            } else {
                errorDescription = "Gib bitte eine Zahl ein! \n Beispiel: 10.00"
                showAlert.toggle()
            }
        } else {
            errorDescription = "Gib bitte eine Kommazahl mit einem Punkt anstatt ein Komma ein! \n Beispiel: 10.00"
            showAlert.toggle()
        }
    }
    
}
