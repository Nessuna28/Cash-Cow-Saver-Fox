//
//  AuthenticationView.swift
//  CashCow
//
//  Created by Angelique Freier on 18.11.23.
//

import SwiftUI

struct AuthenticationView: View {
    
    // MARK: - Variables
    
    @EnvironmentObject var userViewModel: UserViewModel
    
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var repeatedPassword = ""
    
    @State var mode: AuthenticationMode
    
    
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
            
            if mode == .register {
                HStack{
                    SecureField(Strings.repeatedPassword, text: $repeatedPassword)
                    
                    Button {
                        deleteTextFieldInput(textInput: $repeatedPassword)
                    } label: {
                        Image(systemName: Strings.deleteIcon)
                    }
                    .disabled(disableAuthentication)
                }
                .padding()
                .border(Color.black, width: 1)
                .cornerRadius(3)
                .padding(.horizontal, 30)
            }
            
            Spacer()
            
            Button(action: authenticate) {
                PrimaryButtonView(title: mode.title)
                    .padding(.bottom, 40)
            }
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
        
        switch mode {
        case .login:
            userViewModel.loginUser(email: email, password: password)
        case .register:
            userViewModel.registerUser(email: email, password: password, repeatedPassword: repeatedPassword, firstName: "")
        }
    }
    
}

#Preview {
    AuthenticationView(mode: .register)
        .environmentObject(UserViewModel(repository: FirebaseRepository()))
}
