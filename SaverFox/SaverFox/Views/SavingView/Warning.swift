//
//  Warning.swift
//  SaverFox
//
//  Created by Angelique Freier on 21.12.23.
//

import SwiftUI

struct Warning: View {
    
    var body: some View {
        ForEach(savingViewModel.savingsGoalList) { savingsGoal in
            if let remainingDays = Calendar.current.dateComponents([.day], from: Date(), to: savingsGoal.date).day, remainingDays <= 5 {
                if remainingDays < 2 {
                    Text("In \(remainingDays) Tag ist \(savingsGoal.title)")
                } else {
                    Text("In \(remainingDays) Tagen ist \(savingsGoal.title)")
                }
                
                let differenceAmount = savingViewModel.calculateDifference(availableAmount: financeViewModel.currentSum, amount: savingsGoal.sumOfMoney)
                
                if differenceAmount < 0 {
                    Text(String(format: "Dir fehlen noch %.2f €", abs(differenceAmount)))
                        .foregroundStyle(.red)
                } else if differenceAmount > 10 {
                    Text("Du hast gut gespart.")
                        .foregroundStyle(.green)
                } else {
                    Text("Dein Geld reicht für dieses Sparziel, aber nur wenn du bis dahin kein Geld mehr ausgibst.")
                        .foregroundStyle(.blue)
                }
            }
        }
        .foregroundStyle(Colors.primaryOrange)
    }
    
    
    // MARK: - Variables
    
    @EnvironmentObject private var savingViewModel: SavingViewModel
    @EnvironmentObject private var financeViewModel: FinanceViewModel
    
}

#Preview {
    Warning()
        .environmentObject(SavingViewModel())
        .environmentObject(FinanceViewModel())
}
