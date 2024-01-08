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
            Text(Strings.addOutput)
                .font(.title2)
                .padding()
            
            VStack(alignment: .leading) {
                Text(Strings.whenMoneySpent)
                
                DatePicker(Strings.date, selection: $financeViewModel.date, in: ...Date(), displayedComponents: .date)
                    .padding(.bottom, 30)
                
                Text(Strings.whereMoneySpent)
                
                TextField(Strings.wherE, text: $financeViewModel.fromOrFor)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .padding(.bottom, 30)
                
                Text(Strings.whatMoneyWasSpentOn)
                
                TextField(Strings.title, text: $financeViewModel.title)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .padding(.bottom, 30)
                
                Text(Strings.whichIcon)
                
                IconPicker(selectedIcon: $financeViewModel.icon)
                    .padding(.bottom, 30)
                
                Text(Strings.howMuchMoneySpent)
                
                TextField(Strings.amount, text: $amount)
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
            Alert(title: Text(Strings.invalidInput),
                  message: Text(financeViewModel.errorDescription),
                  dismissButton: .default(Text(Strings.okay))
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
            financeViewModel.category = "output"
            
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
