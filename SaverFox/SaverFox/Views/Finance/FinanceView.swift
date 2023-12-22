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
            DisplayPanel(title: "Einnahmen", action: financeViewModel.openRevenueSheet, list: financeViewModel.revenue, view: AnyView(FinanceListView(finance: financeViewModel.revenue)))
            
            DisplayPanel(title: "Ausgaben", action: financeViewModel.openExpenditureSheet, list: financeViewModel.expenditure, view: AnyView(FinanceListView(finance: financeViewModel.expenditure)))
                
            Spacer()
            
            Text(String(format: "%.2f € zur Verfügung", financeViewModel.currentSum))
                .foregroundStyle(Colors.primaryOrange)
        }
        .sheet(isPresented: $financeViewModel.showRevenueSheet, content: {
            NewRevenueView()
        })
        .sheet(isPresented: $financeViewModel.showExpenditureSheet, content: {
            NewExpenditureView()
        })
    }
    
    
    // MARK: - Variables
    
    @EnvironmentObject private var financeViewModel: FinanceViewModel
    
}

#Preview {
    FinanceView()
        .environmentObject(FinanceViewModel())
}
