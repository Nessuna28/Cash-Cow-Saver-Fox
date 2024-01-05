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
            DisplayPanel(title: "Einnahmen", action: financeViewModel.openRevenueSheet, list: financeViewModel.revenue, view: AnyView(FinanceListView(finances: financeViewModel.revenue, id: profileViewModel.child?.id ?? "")))
            
            DisplayPanel(title: "Ausgaben", action: financeViewModel.openExpenditureSheet, list: financeViewModel.expenditure, view: AnyView(FinanceListView(finances: financeViewModel.expenditure, id: profileViewModel.child?.id ?? "")))
            
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
        .environmentObject(financeViewModel)
        .environmentObject(profileViewModel)
    }
    
    
    // MARK: - Variables
    
    @EnvironmentObject private var financeViewModel: FinanceViewModel
    @EnvironmentObject private var profileViewModel: ProfileViewModel
    
}

#Preview {
    FinanceView()
        .environmentObject(FinanceViewModel())
        .environmentObject(ProfileViewModel())
}
