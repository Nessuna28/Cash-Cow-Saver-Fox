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
            Text("Sparziel hinzufügen")
                .font(.title2)
                .padding()
            
            VStack(alignment: .leading) {
                Text("Für was möchtest du sparen?")
                
                TextField("Titel", text: $title)
                    .padding(.bottom, 30)
                
                Text("Welches Icon möchtest du dafür?")
                
                IconPicker(selectedIcon: $icon)
                    .padding(.bottom, 30)
                
                Text("Bis wann möchtest du sparen?")
                
                DatePicker("Datum", selection: $date, in: Date()..., displayedComponents: .date)
                    .padding(.bottom, 30)
                
                Text("Wieviel möchtest du sparen?")
                
                TextField("Betrag", text: $amount)
                    .padding(.bottom, 30)
                
                
            }
            .padding(30)
            .background(Colors.secondaryOrange)
                        .cornerRadius(20)
            
            SaveAndCancelButton(action: saveSavingsGoal)
        }
        .frame(width: 300)

    }
    
    
    // MARK: - Variables
    
    @State private var title = ""
    @State private var date = Date()
    @State private var icon = ""
    @State private var amount = ""
    
    @EnvironmentObject private var savingViewModel: SavingViewModel
    
    
    // MARK: - Functions
    
    private func saveSavingsGoal() {
        
        savingViewModel.title = title
        savingViewModel.date = date
        savingViewModel.icon = icon
        savingViewModel.setSumOfMoney(amount: amount)
    }
    
}

#Preview {
    NewSavingsGoalView()
        .environmentObject(SavingViewModel())
}
