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
            ForEach(savingViewModel.savingsGoalList.sorted(by: { $0.date > $1.date })) { savingsGoal in
                HStack {
                    HStack {
                        Image(systemName: savingsGoal.icon)
                            .padding(5)
                            .background(Colors.primaryOrange)
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading) {
                            Text("\(Strings.until) \(formatDate(date: savingsGoal.date))")
                                .font(.footnote)
                            
                            Text(savingsGoal.title)
                        }
                        
                        Spacer()
                        
                        Text(String(format: "%.2f \(Strings.currency)", savingsGoal.sumOfMoney))
                    }
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Colors.secondaryOrange, lineWidth: 1)
                    )
                    
                    Button {
                        savingViewModel.deleteSavingsGoal(with: id, savingsGoalId: savingsGoal.id ?? "")
                    } label: {
                        Image(systemName: Strings.trashIcon)
                    }
                }
//                .swipeActions(allowsFullSwipe: false) {
//                    Button(role: .destructive) {
//                        savingViewModel.deleteSavingsGoal(with: id, savingsGoalId: savingsGoal.id ?? "")
//                    } label: {
//                        Image(systemName: Strings.trashIcon)
//                    }
//                }
            }
        }
        .frame(maxHeight: .infinity)
    }
    
    
    // MARK: - Variables
    
    @EnvironmentObject private var savingViewModel: SavingViewModel
    
    let id: String
    
    
    // MARK: - Functions
    
    private func formatDate(date: Date) -> String {
        
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter.string(from: date)
    }
    
}

#Preview {
    SavingsListView(id: "")
        .environmentObject(SavingViewModel())
}
