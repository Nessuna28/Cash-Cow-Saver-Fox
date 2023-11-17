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
                
                SelectionSecurityButton(title: Strings.faceID, image: Strings.faceIDImage)
                
                SelectionSecurityButton(title: Strings.fingerprint, image: Strings.fingerprintImage)
                
                SelectionSecurityButton(title: Strings.enterWithCode, image: Strings.enterWithCodeImage)
                
                Spacer()
            }
        }
    }
    
}

#Preview {
    OnboardingView3()
}
