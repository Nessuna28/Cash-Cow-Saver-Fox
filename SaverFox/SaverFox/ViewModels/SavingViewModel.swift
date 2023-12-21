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
    
    
    
    // MARK: - Functions
    
    func calculateDifference(availableAmount: Double, amount: Double) -> Double {
        
        let differenceAmount = availableAmount - amount
        
        return differenceAmount
    }
}
