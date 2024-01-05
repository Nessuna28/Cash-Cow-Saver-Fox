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
            VStack(alignment: .leading) {
                HStack {
                    if profileViewModel.child?.initialAmount == nil {
                        TextField("Wieviel Geld hast du gerade?", text: $amount)
                            .textInputAutocapitalization(.never)
                            .disableAutocorrection(true)
                            .foregroundStyle(Colors.primaryOrange)
                        
                        Button("speichern") {
                            financeViewModel.convertStringToNumber(amount: amount, selection: "init")
                            profileViewModel.initialAmount = financeViewModel.initialAmount ?? 0.0
                            profileViewModel.updateInitialAmount()
                        }
                    } else {
                        Text("Taschengeld:")
                            .padding(.leading, 60)
                        
                        Text(String(format: "%.2f €", financeViewModel.currentSum))
                            .foregroundStyle(Colors.primaryOrange)
                            .padding(.leading, 30)
                    }
                }
                
                HStack {
                    Text("Punktekonto:")
                        .padding(.leading, 60)
                    
                    Text("\(profileViewModel.child?.currentPoints ?? 0) Punkte")
                        .foregroundStyle(Colors.primaryOrange)
                        .padding(.leading, 30)
                    
                    Text(overviewViewModel.emoji)
                }
            }
            
            Image("animation1-removebg")
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
        .onAppear {
            overviewViewModel.setEmoji(points: profileViewModel.child?.currentPoints ?? 0)
        }
    }
    
    
    // MARK: - Variables
    
    @StateObject private var currencyConverterViewModel = CurrencyConverterViewModel()
    @StateObject private var overviewViewModel = OverviewViewModel()
    
    @EnvironmentObject private var financeViewModel: FinanceViewModel
    @EnvironmentObject private var savingViewModel: SavingViewModel
    @EnvironmentObject private var profileViewModel: ProfileViewModel
    @EnvironmentObject private var pointsViewModel: PointsViewModel
    
    @State private var amount = ""
    
}

#Preview {
    OverviewView()
        .environmentObject(FinanceViewModel())
        .environmentObject(SavingViewModel())
        .environmentObject(ProfileViewModel())
        .environmentObject(PointsViewModel())
}
