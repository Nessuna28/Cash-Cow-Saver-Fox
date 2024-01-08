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
            if let remainingDays = Calendar.current.dateComponents([.day], from: Date(), to: savingsGoal.date).day, remainingDays >= 0, remainingDays <= 5 {
                if remainingDays < 2 {
                    Text("\(Strings.into) \(remainingDays) \(Strings.day) \(Strings.reachYourSavingsGoal): \(savingsGoal.title)")
                } else {
                    Text("\(Strings.into) \(remainingDays) \(Strings.days) \(Strings.reachYourSavingsGoal): \(savingsGoal.title)")
                }
                
                let differenceAmount = savingViewModel.calculateDifference(availableAmount: financeViewModel.currentSum, amount: savingsGoal.sumOfMoney)
                
                if differenceAmount < 0 {
                    Text(String(format: "\(Strings.youAreStillMissing) %.2f €", abs(differenceAmount)))
                        .foregroundStyle(.red)
                } else if differenceAmount > 10 {
                    Text(Strings.wellSaved)
                        .foregroundStyle(.green)
                } else {
                    Text(Strings.MoneyIsJustEnough)
                        .foregroundStyle(.blue)
                }
            }
        }
        .foregroundStyle(Colors.primaryOrange)
        .font(.footnote)
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
