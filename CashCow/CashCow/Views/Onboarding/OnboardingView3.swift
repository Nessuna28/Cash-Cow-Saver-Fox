//
//  OnboardingView3.swift
//  CashCow
//
//  Created by Angelique Freier on 17.11.23.
//

import SwiftUI

struct OnboardingView3: View {
    
    var body: some View {
        NavigationStack {
            VStack {
                LoginButton()
                    .environmentObject(authViewModel)
                
                Image(Strings.warningImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                
                Text(Strings.yourSecurity)
                    .bold()
                    .frame(width: 220)
                    .multilineTextAlignment(.center)
                
                Spacer()
                    
                Text(Strings.howToSaveAccount)
                    .multilineTextAlignment(.leading)
                    .padding(20)
                
                SelectionFaceIdAndFingerprintButton()
                
                SelectionEnterWithCodeButton()
                
                Spacer()
                
                NavigationLink {
                    OnboardingView4()
                } label: {
                    PrimaryButtonView(title: Strings.goOn)
                        .padding(.bottom, 40)
                }
            }
        }
    }
    
    
    // MARK: - Variables
    
    @EnvironmentObject var authViewModel: AuthViewModel
    
}

#Preview {
    OnboardingView3()
        .environmentObject(AuthViewModel())
}
