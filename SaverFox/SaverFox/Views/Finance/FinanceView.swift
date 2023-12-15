//
//  FinanceView.swift
//  SaverFox
//
//  Created by Angelique Freier on 15.12.23.
//

import SwiftUI

struct FinanceView: View {
    
    var body: some View {
        VStack {
            HStack {
                Text("Einnahmen")
                    .bold()
                
                Spacer()
                
                Button(action: financeViewModel.openRevenueSheet) {
                    Image(systemName: "plus")
                        .foregroundColor(Colors.primaryOrange)
                }
            }
            
            if financeViewModel.sumRevenue == 0.00 {
                Text("bisher keine Einnahmen")
            } else {
                FinanceList(finance: financeViewModel.revenue)
            }
            
            HStack {
                Text("Ausgaben")
                    .bold()
                
                Spacer()
                
                Button(action: financeViewModel.openExpenditureSheet) {
                    Image(systemName: "plus")
                        .foregroundColor(Colors.primaryOrange)
                }
            }
            .padding(.top, 50)
            
            if financeViewModel.sumExpenditure == 0.00 {
                Text("bisher keine Ausgaben")
            } else {
                FinanceList(finance: financeViewModel.expenditure)
            }
            
            Text(String(format: "%.2f € zur Verfügung", financeViewModel.currentSum))
                .foregroundStyle(Colors.primaryOrange)
        }
        .environmentObject(financeViewModel)
    }
    
    
    // MARK: - Variables
    
    @StateObject private var financeViewModel = FinanceViewModel()
    
}

#Preview {
    FinanceView()
}
