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
            ScrollView {
                ForEach(ChoiceOption.allCases) { choiceOption in
                    ChoiceOptionListForOverview(choiceOption: choiceOption)
                }
                .padding(.top, 50)
            }
            .padding(.horizontal)
        }
    }
    
}

#Preview {
    OverviewView()
        .environmentObject(ProfileViewModel())
        .environmentObject(TabViewModel())
        .environmentObject(AuthViewModel())
}
