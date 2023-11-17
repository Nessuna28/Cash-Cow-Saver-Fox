//
//  LoginButton.swift
//  CashCow
//
//  Created by Angelique Freier on 17.11.23.
//

import SwiftUI

struct LoginButton: View {
    
    var body: some View {
        HStack {
            Spacer()
            
            NavigationLink {
                LoginView()
            } label: {
                TextButtonView(title: Strings.register)
                    .padding(.bottom, 20)
                    .padding(.trailing, 20)
                    .foregroundColor(Colors.primaryColor)
            }
        }
    }
    
}

#Preview {
    LoginButton()
}
