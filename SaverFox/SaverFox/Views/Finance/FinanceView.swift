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
            DisplayPanel(title: "Einnahmen", navigationView: AnyView(NewRevenueView()), list: financeViewModel.revenue, view: AnyView(FinanceListView(finance: financeViewModel.revenue)))
            
            DisplayPanel(title: "Ausgaben", navigationView: AnyView(NewExpenditureView()), list: financeViewModel.expenditure, view: AnyView(FinanceListView(finance: financeViewModel.expenditure)))
                
            Spacer()
            
            Text(String(format: "%.2f € zur Verfügung", financeViewModel.currentSum))
                .foregroundStyle(Colors.primaryOrange)
        }
    }
    
    
    // MARK: - Variables
    
    @EnvironmentObject private var financeViewModel: FinanceViewModel
    
}

#Preview {
    FinanceView()
        .environmentObject(FinanceViewModel())
}
