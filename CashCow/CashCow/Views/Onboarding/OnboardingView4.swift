//
//  OnboardingView4.swift
//  CashCow
//
//  Created by Angelique Freier on 17.11.23.
//

import SwiftUI

struct OnboardingView4: View {
    
    var body: some View {
        NavigationStack {
            VStack {
                LoginButton()
                
                Text(Strings.whichTabs)
                    .font(.title2)
                    .padding(30)
                
                ForEach(ChoiceOption.allCases) { tab in
                    SelectionChoiceOption(image: tab.icon, title: tab.title)
                        .environmentObject(choiceOptionViewModel)
                }
                
                Spacer()
                
                NavigationLink {
                    LoginView(authenticationMode: .register)
                        .environmentObject(choiceOptionViewModel)
                } label: {
                    PrimaryButtonView(title: Strings.goOn)
                        .padding(.bottom, 40)
                }
            }
        }
    }
    
    
    // MARK: - Variables
    
    @EnvironmentObject private var choiceOptionViewModel: ChoiceOptionViewModel
    
}

#Preview {
    OnboardingView4()
        .environmentObject(ChoiceOptionViewModel())
}
