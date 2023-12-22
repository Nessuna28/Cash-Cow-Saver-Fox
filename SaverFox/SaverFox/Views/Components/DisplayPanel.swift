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
            
            Button(action: action) {
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
    let action: () -> Void
    
    let list: [Any]
    let view: AnyView
    
}

#Preview {
    DisplayPanel(title: "Einnahmen", action: { }, list: [], view: AnyView(SavingsListView(savingsGoalList: [])))
}
