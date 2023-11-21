//
//  AuthenticationView.swift
//  CashCow
//
//  Created by Angelique Freier on 18.11.23.
//

import SwiftUI

struct AuthenticationView: View {
    
    // MARK: - Variables
    
    @EnvironmentObject var authViewModel: AuthViewModel
    
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var repeatedPassword = ""
    
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack{
                TextField(Strings.email, text: $email)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    
                Button {
                    deleteTextFieldInput(textInput: $email)
                } label: {
                    Image(systemName: Strings.deleteIcon)
                }
            }
            .padding()
            .border(Color.black, width: 1)
            .cornerRadius(3)
            .padding(.horizontal, 30)
            
            HStack{
                SecureField(Strings.password, text: $password)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    
                Button {
                    deleteTextFieldInput(textInput: $password)
                } label: {
                    Image(systemName: Strings.deleteIcon)
                }
            }
            .padding()
            .border(Color.black, width: 1)
            .cornerRadius(3)
            .padding(.horizontal, 30)
            
            if authViewModel.authenticationMode == .register {
                HStack{
                    SecureField(Strings.repeatedPassword, text: $repeatedPassword)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                    
                    Button {
                        deleteTextFieldInput(textInput: $repeatedPassword)
                    } label: {
                        Image(systemName: Strings.deleteIcon)
                    }
                }
                .padding()
                .border(Color.black, width: 1)
                .cornerRadius(3)
                .padding(.horizontal, 30)
            }
            
            Spacer()
            
            Button(action: authenticate) {
                PrimaryButtonView(title: authViewModel.authenticationMode.title)
                    .padding(.bottom, 40)
            }
            .disabled(disableAuthentication)
        }
    }
    
    // MARK: - Computed Properties
    
    private var disableAuthentication: Bool {
        email.isEmpty || password.isEmpty
    }
    
    
    // MARK: - Functions
    
    private func deleteTextFieldInput(textInput: Binding<String>) {
        
        textInput.wrappedValue = ""
    }
    
    private func authenticate() {
        
        switch authViewModel.authenticationMode {
        case .login:
            authViewModel.loginUser(email: email, password: password)
        case .register:
            authViewModel.registerUser(email: email, password: password, repeatedPassword: repeatedPassword)
        }
    }
    
}

#Preview {
    AuthenticationView()
        .environmentObject(AuthViewModel())
}
