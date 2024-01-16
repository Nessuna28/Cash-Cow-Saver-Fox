//
//  OnboardingView1.swift
//  CashCow
//
//  Created by Angelique Freier on 16.11.23.
//

import SwiftUI

struct OnboardingView1: View {
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(Colors.backgroundOnboarding)
                    .ignoresSafeArea(.all)
                
                VStack {
                    LoginButton()
                    
                    TitleWithAnimation()
                    
                    Text(Strings.makeTheBest)
                        .frame(width: 190)
                        .multilineTextAlignment(.center)
                        .font(.title2)
                    
                    Text(Strings.withUsBestOverview)
                        .multilineTextAlignment(.center)
                        .padding(30)
                    
                    NavigationLink {
                        OnboardingView2()
                            .environmentObject(choiceOptionViewModel)
                    } label: {
                        PrimaryButtonView(title: Strings.letsGo)
                            .padding(30)
                    }
                    
                    Text(Strings.furtherUse)
                        .font(.footnote)
                        .multilineTextAlignment(.center)
                        .padding(.top, 30)
                        .padding(.bottom, 5)
                    
                    NavigationLink {
                        DataProtectionView()
                    } label: {
                        Text(Strings.dataProtection)
                            .font(.footnote)
                            .bold()
                    }
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
    OnboardingView1()
        .environmentObject(AuthViewModel())
        .environmentObject(ChoiceOptionViewModel())
}
