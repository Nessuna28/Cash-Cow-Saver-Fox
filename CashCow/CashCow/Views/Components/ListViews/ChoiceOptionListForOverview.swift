//
//  TabListForOverview.swift
//  CashCow
//
//  Created by Angelique Freier on 24.11.23.
//

import SwiftUI

struct ChoiceOptionListForOverview: View {
    
    var body: some View {
        HStack {
            choiceOption.icon
            
            Text(choiceOption.title)
            
            Spacer()
            
            Image(systemName: Strings.plusIcon)
        }
        .padding(.bottom, 40)
    }
    
    // MARK: - Variables
    
    let choiceOption: ChoiceOption
    
}

#Preview {
    ChoiceOptionListForOverview(choiceOption: .bankAccounts)
}
