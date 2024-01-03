//
//  OverviewView.swift
//  SaverFox
//
//  Created by Angelique Freier on 15.12.23.
//

import SwiftUI

struct OverviewView: View {
    
    var body: some View {
        VStack {
            HStack {
                if profileViewModel.child?.initialAmount == nil {
                    TextField("Wieviel Geld hast du gerade?", text: $amount)
                        .foregroundStyle(Colors.primaryOrange)
                    
                    Button("speichern") {
                        financeViewModel.setInitialAmount(amount: amount)
                        profileViewModel.initialAmount = financeViewModel.initialAmount ?? 0.0
                        profileViewModel.updateInitialAmount()
                    }
                } else {
                    Text("Taschengeld:")
                        .padding(.trailing, 30)
                    
                    Text(String(format: "%.2f €", financeViewModel.currentSum))
                        .foregroundStyle(Colors.primaryOrange)
                }
            }
            
            HStack {
                Text("Punktekonto:")
                    .padding(.trailing, 30)
                
                Text("0 Punkte")
                    .foregroundStyle(Colors.primaryOrange)
                    .padding(.trailing, 30)
            }
            
            Image("animation1")
                .resizable()
                .scaledToFit()
                .padding(.vertical, 30)
            
            Warning()
                .environmentObject(financeViewModel)
                .environmentObject(savingViewModel)
            
            Spacer()
            
            TipsView()
            
            Button(action: currencyConverterViewModel.openSheet) {
                HStack {
                    Image("calculator")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                    
                    Text("Währungsrechner")
                }
            }
            .sheet(isPresented: $currencyConverterViewModel.showSheet) {
                CurrencyConverterView()
            }
        }
        .alert(isPresented: $financeViewModel.showAlert) {
            Alert(title: Text("Ungültige Eingabe"),
                  message: Text(financeViewModel.errorDescription),
                  dismissButton: .default(Text("Okay"))
            )
        }
    }
    
    
    // MARK: - Variables
    
    @StateObject private var currencyConverterViewModel = CurrencyConverterViewModel()
    
    @EnvironmentObject private var financeViewModel: FinanceViewModel
    @EnvironmentObject private var savingViewModel: SavingViewModel
    @EnvironmentObject private var profileViewModel: ProfileViewModel
    
    @State private var amount = ""
    
    
    
    // MARK: - Function
    
}

#Preview {
    OverviewView()
        .environmentObject(FinanceViewModel())
        .environmentObject(SavingViewModel())
        .environmentObject(ProfileViewModel())
}
