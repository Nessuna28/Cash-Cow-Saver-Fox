//
//  NewExpenditureView.swift
//  SaverFox
//
//  Created by Angelique Freier on 21.12.23.
//

import SwiftUI

struct NewExpenditureView: View {
    
    var body: some View {
        VStack {
            Text("Ausgabe hinzufügen")
                .font(.title2)
                .padding()
            
            VStack(alignment: .leading) {
                Text("Wann hast du das Geld ausgegeben?")
                
                DatePicker("Datum", selection: $financeViewModel.date, in: ...Date(), displayedComponents: .date)
                    .padding(.bottom, 30)
                
                Text("Wo hast du das Geld ausgegeben?")
                
                TextField("wo", text: $financeViewModel.fromOrFor)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .padding(.bottom, 30)
                
                Text("Wofür hast du das Geld ausgegeben?")
                
                TextField("Titel", text: $financeViewModel.title)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .padding(.bottom, 30)
                
                Text("Welches Icon möchtest du dafür?")
                
                IconPicker(selectedIcon: $financeViewModel.icon)
                    .padding(.bottom, 30)
                
                Text("Wieviel Geld hast du ausgegeben?")
                
                TextField("Betrag", text: $amount)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .padding(.bottom, 30)
                
                
            }
            .padding(30)
            .background(Colors.secondaryOrange)
            .cornerRadius(20)
            
            SaveAndCancelButton(action: saveFinance)
        }
        .frame(width: 350)
        .alert(isPresented: $financeViewModel.showAlert) {
            Alert(title: Text("Ungültige Eingabe"),
                  message: Text(financeViewModel.errorDescription),
                  dismissButton: .default(Text("Okay"))
            )
        }
    }
        
        
        
        // MARK: - Variables
        
        @State private var amount = ""
        
        @EnvironmentObject private var financeViewModel: FinanceViewModel
        @EnvironmentObject private var profileViewModel: ProfileViewModel
        
        
        // MARK: - Functions
        
        private func saveFinance() {
        
            financeViewModel.convertStringToNumber(amount: amount, selection: "sum")
            financeViewModel.category = "Ausgabe"
            
            if let id = profileViewModel.child?.id {
                financeViewModel.createFinance(with: id)
            }
        }
    
}

#Preview {
    NewExpenditureView()
        .environmentObject(FinanceViewModel())
        .environmentObject(ProfileViewModel())
}
