//
//  SavingView.swift
//  SaverFox
//
//  Created by Angelique Freier on 15.12.23.
//

import SwiftUI

struct SavingView: View {
    
    var body: some View {
        VStack {
            DisplayPanel(title: "Sparziele", action: savingViewModel.toggleShowSheet, list: savingViewModel.savingsGoalList, view: AnyView(SavingsListView(savingsGoalList: savingViewModel.savingsGoalList)))
            
            Image("animation2")
                .resizable()
                .scaledToFit()
                .padding(.vertical, 30)
            
            Spacer()
            
            Warning()
                .environmentObject(savingViewModel)
                .environmentObject(financeViewModel)
        }
        .sheet(isPresented: $savingViewModel.showSheet, content: {
            NewSavingsGoalView()
        })
    }
    
    
    // MARK: - Variables
    
    @EnvironmentObject private var savingViewModel: SavingViewModel
    @EnvironmentObject private var financeViewModel: FinanceViewModel
    
}

#Preview {
    SavingView()
        .environmentObject(FinanceViewModel())
        .environmentObject(SavingViewModel())
}
