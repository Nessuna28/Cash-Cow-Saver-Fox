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
            LoginButton()
                .environmentObject(authViewModel)
            
            Text(Strings.whichTabs)
                .font(.title2)
                .padding(30)
            
            ForEach(ChoiceOption.allCases) { tab in
                SelectionChoiceOption(image: tab.icon, title: tab.title)
            }
            
            Spacer()
            
            Button(action: setModeOnRegister) {
                NavigationLink {
                    LoginView()
                } label: {
                    PrimaryButtonView(title: Strings.goOn)
                        .padding(.bottom, 40)
                }
            }
        }
    }
    
    
    // MARK: - Variables
    
    @EnvironmentObject private var authViewModel: AuthViewModel
    
    
    
    // MARK: - Functions
    
    private func setModeOnRegister() {
        
        authViewModel.authenticationMode = .register
    }
    
}

#Preview {
    OnboardingView4()
        .environmentObject(AuthViewModel())
}
