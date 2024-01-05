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
            DisplayPanel(title: "Sparziele", action: savingViewModel.toggleShowSheet, list: savingViewModel.savingsGoalList, view: AnyView(SavingsListView(id: profileViewModel.child?.id ?? "")))
                .environmentObject(savingViewModel)
            
            Image("animation2-removebg")
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
                .environmentObject(profileViewModel)
        })
    }
    
    
    // MARK: - Variables
    
    @EnvironmentObject private var savingViewModel: SavingViewModel
    @EnvironmentObject private var financeViewModel: FinanceViewModel
    @EnvironmentObject private var profileViewModel: ProfileViewModel
    
}

#Preview {
    SavingView()
        .environmentObject(FinanceViewModel())
        .environmentObject(SavingViewModel())
        .environmentObject(ProfileViewModel())
}
