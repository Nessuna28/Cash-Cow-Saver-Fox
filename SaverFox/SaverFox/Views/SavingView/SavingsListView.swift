//
//  SavingsListView.swift
//  SaverFox
//
//  Created by Angelique Freier on 21.12.23.
//

import SwiftUI

struct SavingsListView: View {
    
    var body: some View {
        ScrollView {
            ForEach(savingsGoalList.sorted(by: { $0.date > $1.date })) { savingsGoal in
                HStack {
                    Image(savingsGoal.icon)
                        .padding(5)
                        .background(Colors.primaryOrange)
                        .clipShape(Circle())
                    
                    Text(savingsGoal.title)
                    
                    Spacer()
                    
                    Text(String(format: "%.2f €", savingsGoal.sumOfMoney))
                }
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Colors.secondaryOrange, lineWidth: 1)
                )
            }
        }
        .frame(maxHeight: .infinity)
    }
    
    
    // MARK: - Variables
    
    let savingsGoalList: [SavingsGoal]
    
}

#Preview {
    SavingsListView(savingsGoalList: [])
}
