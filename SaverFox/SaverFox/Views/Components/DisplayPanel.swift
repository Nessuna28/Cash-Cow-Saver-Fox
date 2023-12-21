//
//  DisplayPanel.swift
//  SaverFox
//
//  Created by Angelique Freier on 21.12.23.
//

import SwiftUI

struct DisplayPanel: View {
    
    var body: some View {
        HStack {
            Text(title)
                .bold()
            
            Spacer()
            
            NavigationLink {
                navigationView
            } label: {
                Image(systemName: "plus")
                    .foregroundColor(Colors.primaryOrange)
            }
        }
        
        if list.isEmpty {
            Text("Bisher keine \(title)")
                .padding(.top)
        } else {
            view
                .padding(.top)
        }
    }
    
    
    // MARK: - Variables
    
    let title: String
    let navigationView: AnyView
    
    let list: [Any]
    let view: AnyView
    
}

#Preview {
    DisplayPanel(title: "Einnahmen", navigationView: AnyView(NewSavingsGoalView()), list: [], view: AnyView(SavingsListView(savingsGoalList: [])))
}
