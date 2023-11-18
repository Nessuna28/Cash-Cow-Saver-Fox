//
//  LoginView.swift
//  CashCow
//
//  Created by Angelique Freier on 17.11.23.
//

import SwiftUI

struct LoginView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @State var repeatedPassword: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                Image(Strings.appIcon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                
                Text(Strings.welcome)
                    .font(.title)
                    .padding(.bottom, 50)
                
                Spacer()
                
                LoginTextField()
                   
                Spacer()
                
                NavigationLink {
                    
                } label: {
                    PrimaryButtonView(title: Strings.register)
                        .padding(.bottom, 40)
                }
            }
        }
    }
    
}

#Preview {
    LoginView()
}
