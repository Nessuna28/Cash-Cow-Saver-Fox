//
//  NewRevenueView.swift
//  SaverFox
//
//  Created by Angelique Freier on 21.12.23.
//

import SwiftUI

struct NewRevenueView: View {
    
    var body: some View {
        VStack {
            Text("Einnahme hinzufügen")
                .font(.title2)
                .padding()
            
            VStack(alignment: .leading) {
                Text("Wann hast du das Geld bekommen?")
                
                DatePicker("Datum", selection: $financeViewModel.date, in: ...Date(), displayedComponents: .date)
                    .padding(.bottom, 30)
                
                Text("Von wem hast du das Geld bekommen?")
                
                TextField("von", text: $financeViewModel.fromOrFor)
                    .padding(.bottom, 30)
                
                Text("Wofür hast du das Geld bekommen?")
                
                TextField("Titel", text: $financeViewModel.title)
                    .padding(.bottom, 30)
                
                Text("Welches Icon möchtest du dafür?")
                
                IconPicker(selectedIcon: $financeViewModel.icon)
                    .padding(.bottom, 30)
                
                Text("Wieviel Geld hast du bekommen")
                
                TextField("Betrag", text: $amount)
                    .padding(.bottom, 30)
                
                
            }
            .padding(30)
            .background(Colors.secondaryOrange)
            .cornerRadius(20)
            
            SaveAndCancelButton(action: saveFinance)
        }
        .frame(width: 350)
    }
        
        
        
        // MARK: - Variables
        
        @State private var amount = ""
        
        @EnvironmentObject private var financeViewModel: FinanceViewModel
        @EnvironmentObject private var profileViewModel: ProfileViewModel
        
        
        // MARK: - Functions
        
        private func saveFinance() {
        
            financeViewModel.setSumOfMoney(amount: amount)
            financeViewModel.category = "Einnahme"
            
            if let id = profileViewModel.child?.id {
                financeViewModel.createFinance(with: id)
            }
        }
    
}

#Preview {
    NewRevenueView()
        .environmentObject(FinanceViewModel())
        .environmentObject(ProfileViewModel())
}
