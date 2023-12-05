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
                        .environmentObject(authViewModel)
                    
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
            }
        }
    }
    
    
    // MARK: - Variables
    
    @EnvironmentObject var authViewModel: AuthViewModel
    
    
    
    // MARK: - Functions
    
    private func navigate() {
        
    }
    
}

#Preview {
    OnboardingView1()
        .environmentObject(AuthViewModel())
}
