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
            
            Text(Strings.whichTabs)
                .font(.title2)
                .padding(30)
            
            ForEach(Tab.allCases) { tab in
                SelectionTab(image: tab.icon, title: tab.title)
            }
            
            Spacer()
            
            NavigationLink {
                LoginView()
            } label: {
                PrimaryButtonView(title: Strings.goOn)
                    .padding(.bottom, 40)
            }
            
        }
    }
    
}

#Preview {
    OnboardingView4()
}
