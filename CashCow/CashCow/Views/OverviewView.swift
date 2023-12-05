//
//  OverviewView.swift
//  CashCow
//
//  Created by Angelique Freier on 19.11.23.
//

import SwiftUI

struct OverviewView: View {
    
    var body: some View {
        NavigationStack {
            Text(Strings.setUpFinances)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 50)
                .padding(.top, 30)
            
            ScrollView {
                ForEach(ChoiceOption.allCases) { choiceOption in
                    ChoiceOptionListForOverview(choiceOption: choiceOption)
                }
                .padding(.top, 50)
            }
        }
    }
    
}

#Preview {
    OverviewView()
}
