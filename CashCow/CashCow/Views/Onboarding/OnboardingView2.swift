//
//  OnboardingView2.swift
//  CashCow
//
//  Created by Angelique Freier on 17.11.23.
//

import SwiftUI

struct OnboardingView2: View {
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(Colors.backgroundOnboarding)
                    .ignoresSafeArea(.all)
                
                VStack {
                    LoginButton()
                        .environmentObject(authViewModel)
                    
                    TitleWithAnimation()
                    
                    Text(Strings.welcome)
                        .font(.title)
                        .foregroundStyle(Colors.primaryGreen)
                    
                    Text(Strings.justHelp)
                        .padding()
                    
                    HStack {
                        Text(Strings.newHere)
                            .padding(.leading, 40)
                            .padding(.top, 60)
                        
                        Spacer()
                    }
                    
                    NavigationLink {
                        OnboardingView3()
                            .environmentObject(choiceOptionViewModel)
                    } label: {
                        SelectionAdultView()
                    }
                    
                    SelectionChildButton()
                    
                    Spacer()
                }
                .foregroundColor(Colors.textColorOnS)
            }
        }
    }
    
    
    // MARK: - Variables
    
    @EnvironmentObject private var authViewModel: AuthViewModel
    @EnvironmentObject private var choiceOptionViewModel: ChoiceOptionViewModel
    
}

#Preview {
    OnboardingView2()
        .environmentObject(AuthViewModel())
        .environmentObject(ChoiceOptionViewModel())
}
