//
//  NewSavingsGoalView.swift
//  SaverFox
//
//  Created by Angelique Freier on 21.12.23.
//

import SwiftUI

struct NewSavingsGoalView: View {
    
    var body: some View {
        VStack {
            Text(Strings.addSavingsGoal)
                .font(.title2)
                .padding()
            
            VStack(alignment: .leading) {
                Text(Strings.saveForWhat)
                
                TextField(Strings.title, text: $title)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .padding(.bottom, 30)
                
                Text(Strings.whichIcon)
                
                IconPicker(selectedIcon: $icon)
                    .padding(.bottom, 30)
                
                Text(Strings.saveUntilWhen)
                
                DatePicker(Strings.date, selection: $date, in: Date()..., displayedComponents: .date)
                    .padding(.bottom, 30)
                
                Text(Strings.howMuchSave)
                
                TextField(Strings.amount, text: $amount)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .padding(.bottom, 30)
                
                
            }
            .padding(30)
            .background(Colors.secondaryOrange)
                        .cornerRadius(20)
            
            SaveAndCancelButton(action: saveSavingsGoal)
        }
        .frame(width: 300)
        .alert(isPresented: $savingViewModel.showAlert) {
            Alert(title: Text(Strings.invalidInput),
                  message: Text(savingViewModel.errorDescription),
                  dismissButton: .default(Text(Strings.okay))
            )
        }

    }
    
    
    // MARK: - Variables
    
    @State private var title = ""
    @State private var date = Date()
    @State private var icon = ""
    @State private var amount = ""
    
    @EnvironmentObject private var savingViewModel: SavingViewModel
    @EnvironmentObject private var profileViewModel: ProfileViewModel
    
    
    // MARK: - Functions
    
    private func saveSavingsGoal() {
        
        savingViewModel.title = title
        savingViewModel.date = date
        savingViewModel.icon = icon
        savingViewModel.convertStringToNumber(amount: amount)
        
        if let id = profileViewModel.child?.id {
            savingViewModel.createSavingsGoal(id: id)
        }
    }
    
}

#Preview {
    NewSavingsGoalView()
        .environmentObject(SavingViewModel())
        .environmentObject(ProfileViewModel())
}
